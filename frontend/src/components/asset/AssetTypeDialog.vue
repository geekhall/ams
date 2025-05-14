<template>
  <el-dialog
    v-model="dialogVisible"
    :title="mode === 'add' ? '新增资产类型' : '编辑资产类型'"
    width="500px"
    @close="handleClose"
  >
    <el-form ref="formRef" :model="form" :rules="rules" label-width="100px" class="asset-type-form">
      <el-form-item label="类型名称" prop="name">
        <el-input v-model="form.name" placeholder="请输入资产类型名称"></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" @click="handleSubmit">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, reactive, defineProps, defineEmits, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { addAssetType, updateAssetType } from '@/api/asset'
import type { FormInstance, FormRules } from 'element-plus'
import type { AssetType } from '@/types/asset'

const props = defineProps<{
  visible: boolean
  mode: 'add' | 'edit'
  assetType: AssetType | null
}>()

const emit = defineEmits(['update:visible', 'success'])

const dialogVisible = ref(props.visible)
const formRef = ref<FormInstance>()

const form = reactive({
  id: '',
  name: ''
})

const rules = reactive<FormRules>({
  name: [
    { required: true, message: '请输入资产类型名称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ]
})

// 监听对话框可见性变化
watch(
  () => props.visible,
  (val) => {
    dialogVisible.value = val
  }
)

// 监听对话框可见性变化
watch(
  () => dialogVisible.value,
  (val) => {
    emit('update:visible', val)
  }
)

// 监听资产类型数据变化
watch(
  () => props.assetType,
  (val) => {
    if (val) {
      form.id = val.id
      form.name = val.name
    } else {
      form.id = ''
      form.name = ''
    }
  },
  { immediate: true }
)

const handleClose = () => {
  dialogVisible.value = false
  formRef.value?.resetFields()
}

const handleSubmit = async () => {
  if (!formRef.value) return

  await formRef.value.validate(async (valid) => {
    if (valid) {
      try {
        if (props.mode === 'add') {
          await addAssetType(form.name)
          ElMessage.success('添加成功')
        } else {
          await updateAssetType(form.id, form.name)
          ElMessage.success('更新成功')
        }
        emit('success')
        handleClose()
      } catch (error) {
        ElMessage.error(props.mode === 'add' ? '添加失败' : '更新失败')
      }
    }
  })
}
</script>

<style scoped>
.asset-type-form {
  padding: 20px;
}
</style>
