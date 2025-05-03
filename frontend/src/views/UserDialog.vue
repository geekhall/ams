<template>
  <el-dialog :title="isEdit ? '编辑用户' : '新增用户'" v-model="dialogVisible" width="40%">
    <el-form ref="formRef" :model="formData" :rules="rules" label-width="100px">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="formData.username" :disabled="isEdit" />
      </el-form-item>
      <!-- <el-form-item label="密码" prop="password">
        <el-input v-model="formData.password" type="password" />
      </el-form-item>
      <el-form-item label="确认密码" prop="confirmPassword">
        <el-input v-model="formData.confirmPassword" type="password" />
      </el-form-item> -->
      <el-form-item label="昵称" prop="name">
        <el-input v-model="formData.name" />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input v-model="formData.phone" />
      </el-form-item>
      <el-form-item label="邮箱" prop="email">
        <el-input v-model="formData.email" />
      </el-form-item>
      <!-- <el-form-item label="头像">
        <el-upload
          class="avatar-uploader"
          action="/upload"
          :show-file-list="false"
          :on-success="handleAvatarSuccess"
          :file-list="formData.avatar ? [formData.avatar] : []"
        >
          <img v-if="formData.avatar" :src="formData.avatar" class="avatar" />
          <el-button size="small" type="primary">上传头像</el-button>
        </el-upload>
      </el-form-item> -->
      <el-form-item label="部门" prop="department">
        <el-select v-model="formData.department">
          <el-option
            v-for="item in departments"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="角色" prop="roles">
        <el-select v-model="formData.roles" multiple>
          <el-option
            v-for="role in roleOptions"
            :key="role.value"
            :label="role.label"
            :value="role.value"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态">
        <el-select v-model="formData.status">
          <el-option label="正常" value="1"></el-option>
          <el-option label="禁用" value="0"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否启用">
        <el-switch v-model="formData.isActive"></el-switch>
      </el-form-item>
      <el-form-item label="是否锁定">
        <el-switch v-model="formData.isLocked"></el-switch>
      </el-form-item>
    </el-form>
    <template #footer>
      <el-button @click="emit('update:visible', false)">取消</el-button>
      <el-button type="primary" @click="handleSave">确定</el-button>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch, defineProps, defineEmits, onMounted, reactive } from 'vue'
import { ElMessage, FormInstance, FormRules } from 'element-plus'
import { useDepartment } from '@/hooks/useDepartment'
import { useTeam } from '@/hooks/useTeam'
import { UserDTO } from '@/types/user'
import { PropType } from 'vue'

const { departments, fetchDepartments } = useDepartment()
const { teams, fetchTeams } = useTeam()
const roleOptions = [
  { value: 'ROLE_ADMIN', label: '超级管理员' },
  { value: 'ROLE_MANAGER', label: '管理员' },
  { value: 'ROLE_VIP', label: 'VIP' },
  { value: 'ROLE_USER', label: '普通用户' },
  { value: 'ROLE_DEV', label: '开发用户' },
  { value: 'ROLE_TEST', label: '测试用户' },
  { value: 'ROLE_GUEST', label: '游客' }
]

// 接收父组件传入的 props
const props = defineProps({
  visible: Boolean,
  isEdit: Boolean,
  formData: {
    type: Object as PropType<UserDTO>,
    required: true
  }
})

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'save', formData: UserDTO): void
}>()

const dialogVisible = ref(props.visible) // 本地管理 visible 的状态

const formRef = ref<FormInstance>()
const formData = reactive<UserDTO>({ ...props.formData })
// const validatePassword = (rule: any, value: string, callback: any) => {
//   if (value === '') {
//     ElMessage.error('请输入密码')
//   } else if (value.length < 6) {
//     ElMessage.error('密码长度不能小于6位')
//   } else {
//     callback()
//   }
// }

// const validateConfirmPassword = (rule: any, value: string, callback: any) => {
//   if (value === '') {
//     ElMessage.error('请再次输入密码')
//   } else if (value !== formData.password) {
//     ElMessage.error('两次输入密码不一致!')
//   } else {
//     callback()
//   }
// }
const rules: FormRules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  // password: [
  //   { required: true, message: '请输入密码', trigger: 'blur' },
  //   { validator: validatePassword, trigger: 'blur' }
  // ],
  // confirmPassword: [
  //   { required: true, message: '请再次确认密码', trigger: 'blur' },
  //   { validator: validateConfirmPassword, trigger: 'blur' }
  // ],
  name: [{ required: true, message: '请输入昵称', trigger: 'blur' }],
  phone: [{ required: true, message: '请输入手机号', trigger: 'blur' }],
  email: [{ required: true, message: '请输入邮箱', trigger: 'blur' }],
  department: [{ required: true, message: '请选择部门', trigger: 'change' }],
  roles: [{ required: true, message: '请选择角色', trigger: 'change' }]
}

const handleSave = async () => {
  // if (props.isEdit) {
  //   formData.password = ''
  //   formData.confirmPassword = ''
  // }
  if (!formData) return

  if (formData.roles.length === 0) {
    ElMessage.error('请至少选择一个角色')
    return
  }

  if (!formRef.value) return
  await formRef.value.validate(async (valid: boolean) => {
    if (valid) {
      emit('save', formData)
      emit('update:visible', false)
    } else {
      ElMessage.error('表单验证失败')
    }
  })
}

// const handleAvatarSuccess = (response: any, file: any) => {
//   if (response.code === 200) {
//     ElMessage.success('上传成功')
//   } else {
//     ElMessage.error('上传失败')
//   }
// }

onMounted(() => {
  fetchDepartments()
  fetchTeams()
})

// 监听 dialogVisible 的变化，更新 props.visible
watch(dialogVisible, (newVal) => {
  emit('update:visible', newVal)
})

// 同步 props.visible 的变化到本地 dialogVisible
watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
  }
)

// 同步 props.formData 的变化到本地 formData
watch(
  () => props.formData,
  (newVal) => {
    if (newVal) {
      Object.keys(newVal).forEach((key) => {
        ;(formData as any)[key] = (newVal as any)[key]
      })
    }
  },
  { deep: true }
)
</script>
