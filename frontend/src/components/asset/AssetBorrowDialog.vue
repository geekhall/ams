<template>
  <el-dialog title="资产领用" v-model="dialogVisible" width="30%" @close="handleClose">
    <el-form :model="form" label-width="100px" :rules="rules" ref="formRef">
      <el-form-item label="资产名称">
        <span>{{ form.name }}</span>
      </el-form-item>
      <el-form-item label="资产编号">
        <span>{{ form.code }}</span>
      </el-form-item>
      <el-form-item label="领用数量" prop="borrowCount">
        <el-input-number
          v-model="form.borrowCount"
          :min="1"
          :max="form.availableCount"
          @change="handleCountChange"
        />
        <span class="count-tip">可用数量: {{ form.availableCount }}</span>
      </el-form-item>
      <el-form-item label="领用部门" prop="borrowDepartment">
        <el-select v-model="form.borrowDepartment" placeholder="请选择领用部门">
          <el-option
            v-for="item in departments"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="领用人" prop="borrower">
        <el-input v-model="form.borrower" placeholder="请输入领用人姓名" />
      </el-form-item>
      <el-form-item label="领用日期" prop="borrowDate">
        <el-date-picker
          v-model="form.borrowDate"
          type="date"
          placeholder="选择领用日期"
          format="YYYY-MM-DD"
          value-format="YYYY-MM-DD"
          :disabled-date="disabledDate"
        />
      </el-form-item>
      <el-form-item label="预计归还" prop="expectedReturnDate">
        <el-date-picker
          v-model="form.expectedReturnDate"
          type="date"
          placeholder="选择预计归还日期"
          format="YYYY-MM-DD"
          value-format="YYYY-MM-DD"
          :disabled-date="disabledDate"
        />
      </el-form-item>
      <el-form-item label="领用原因" prop="reason">
        <el-input v-model="form.reason" type="textarea" :rows="3" placeholder="请输入领用原因" />
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, reactive, defineProps, defineEmits, watch } from 'vue'
import { ElMessage } from 'element-plus'
import type { FormInstance, FormRules } from 'element-plus'
import dayjs from 'dayjs'
import type { Asset } from '@/types/asset'

const props = defineProps<{
  visible: boolean
  departments: any[]
  asset: Asset | null
}>()

const emit = defineEmits(['update:visible', 'success'])

const dialogVisible = ref(props.visible)
const formRef = ref<FormInstance>()

const form = reactive({
  id: '',
  name: '',
  code: '',
  borrowCount: 1,
  availableCount: 0,
  borrowDepartment: '',
  borrower: '',
  borrowDate: dayjs().format('YYYY-MM-DD'),
  expectedReturnDate: '',
  reason: ''
})

const rules = reactive<FormRules>({
  borrowCount: [
    { required: true, message: '请输入领用数量', trigger: 'blur' },
    { type: 'number', min: 1, message: '领用数量必须大于0', trigger: 'blur' }
  ],
  borrowDepartment: [{ required: true, message: '请选择领用部门', trigger: 'change' }],
  borrower: [{ required: true, message: '请输入领用人姓名', trigger: 'blur' }],
  borrowDate: [{ required: true, message: '请选择领用日期', trigger: 'change' }],
  expectedReturnDate: [{ required: true, message: '请选择预计归还日期', trigger: 'change' }],
  reason: [
    { required: true, message: '请输入领用原因', trigger: 'blur' },
    { min: 5, message: '领用原因不能少于5个字符', trigger: 'blur' }
  ]
})

// 监听资产数据变化
watch(
  () => props.asset,
  (newAsset) => {
    if (newAsset) {
      form.id = newAsset.id
      form.name = newAsset.name
      form.code = newAsset.code
      form.availableCount = newAsset.count
      form.borrowCount = 1
      form.borrowDepartment = ''
      form.borrower = ''
      form.borrowDate = dayjs().format('YYYY-MM-DD')
      form.expectedReturnDate = ''
      form.reason = ''
    }
  },
  { immediate: true }
)

// 监听对话框显示状态
watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
  }
)

const handleClose = () => {
  emit('update:visible', false)
}

const handleCountChange = (value: number) => {
  if (value > form.availableCount) {
    form.borrowCount = form.availableCount
  }
}

const disabledDate = (time: Date) => {
  return time.getTime() < Date.now() - 8.64e7 // 禁用今天之前的日期
}

const handleSubmit = async () => {
  if (!formRef.value) return

  try {
    await formRef.value.validate()
    // TODO: 调用领用API
    // const res = await borrowAsset({
    //   ...form,
    //   assetId: form.assetId
    // })

    // if (res.code === 200) {
    //   ElMessage.success('领用申请已提交')
    //   emit('success')
    //   handleClose()
    // } else {
    //   ElMessage.error(res.message)
    // }
  } catch (error) {
    ElMessage.error('领用失败: ' + error)
  }
}
</script>

<style scoped>
.count-tip {
  margin-left: 10px;
  color: #909399;
  font-size: 12px;
}

:deep(.el-input-number) {
  width: 180px;
}
</style>
