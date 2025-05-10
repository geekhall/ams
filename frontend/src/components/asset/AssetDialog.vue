<template>
  <el-dialog
    :title="mode === 'add' ? '新增资产' : '编辑资产'"
    v-model="dialogVisible"
    width="50%"
    @close="handleClose"
  >
    <el-form :model="form" label-width="100px" ref="formRef" :rules="rules">
      <el-form-item label="ID" v-if="mode === 'edit'">
        <el-input v-model="form.id" disabled></el-input>
      </el-form-item>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产名称" prop="name">
            <el-input v-model="form.name"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="资产编号" prop="code">
            <el-input v-model="form.code"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产序列号" prop="sn">
            <el-input v-model="form.sn"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="资产类型" prop="type">
            <el-select v-model="form.type" placeholder="请选择" style="width: 100%">
              <el-option
                v-for="item in assetTypes"
                :key="item.name"
                :label="item.name"
                :value="item.name"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产型号" prop="model">
            <el-input v-model="form.model"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="资产配置" prop="config">
            <el-input v-model="form.config"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产IP" prop="ip">
            <el-input v-model="form.ip"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="资产描述" prop="description">
            <el-input v-model="form.description"></el-input>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产提供商" prop="provider">
            <el-input v-model="form.provider"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="所属部门" prop="departmentName">
            <el-select v-model="form.departmentName" placeholder="请选择" style="width: 100%">
              <el-option
                v-for="item in departments"
                :key="item.name"
                :label="item.name"
                :value="item.name"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="资产位置" prop="location">
            <el-input v-model="form.location"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="状态" prop="status">
            <el-select v-model="form.status" placeholder="请选择" style="width: 100%">
              <el-option label="正常" value="正常"></el-option>
              <el-option label="维修" value="维修"></el-option>
              <el-option label="报废" value="报废"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="使用状态" prop="useStatus">
            <el-select v-model="form.useStatus" placeholder="请选择" style="width: 100%">
              <el-option label="在用" value="在用"></el-option>
              <el-option label="闲置" value="闲置"></el-option>
              <el-option label="维修" value="维修"></el-option>
              <el-option label="报废" value="报废"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="购入时间" prop="purchaseDate">
            <el-date-picker
              v-model="form.purchaseDate"
              type="date"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
              style="width: 100%"
              placeholder="选择日期"
            />
          </el-form-item>
        </el-col>
      </el-row>
      <el-row :gutter="20">
        <el-col :span="12">
          <el-form-item label="购买价格" prop="purchasePrice">
            <el-input-number
              v-model="form.purchasePrice"
              :precision="2"
              :step="100"
              style="width: 100%"
            ></el-input-number>
          </el-form-item>
        </el-col>
        <el-col :span="12">
          <el-form-item label="数量" prop="count">
            <el-input-number v-model="form.count" :min="1" style="width: 100%"></el-input-number>
          </el-form-item>
        </el-col>
      </el-row>
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
import { addAsset, updateAsset } from '@/api/asset'
import type { FormInstance, FormRules } from 'element-plus'
import type { Asset } from '@/types/asset'
import dayjs from 'dayjs'

const props = defineProps<{
  visible: boolean
  mode: 'add' | 'edit'
  assetTypes: any[]
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
  sn: '',
  type: '',
  model: '',
  config: '',
  ip: '',
  description: '',
  provider: '',
  departmentName: '',
  location: '',
  status: '正常',
  useStatus: '闲置',
  purchaseDate: dayjs().format('YYYY-MM-DD'),
  purchasePrice: 0,
  count: 1
})

const rules = reactive<FormRules>({
  name: [{ required: true, message: '请输入资产名称', trigger: 'blur' }],
  code: [{ required: true, message: '请输入资产编号', trigger: 'blur' }],
  type: [{ required: true, message: '请选择资产类型', trigger: 'change' }],
  departmentName: [{ required: true, message: '请选择所属部门', trigger: 'change' }],
  status: [{ required: true, message: '请选择状态', trigger: 'change' }],
  useStatus: [{ required: true, message: '请选择使用状态', trigger: 'change' }],
  purchaseDate: [{ required: true, message: '请选择购入时间', trigger: 'change' }],
  purchasePrice: [{ required: true, message: '请输入购买价格', trigger: 'blur' }],
  count: [{ required: true, message: '请输入数量', trigger: 'blur' }]
})

// 监听资产数据变化
watch(
  () => props.asset,
  (newAsset) => {
    if (newAsset && props.mode === 'edit') {
      Object.assign(form, newAsset)
    } else if (props.mode === 'add') {
      // 重置表单
      Object.assign(form, {
        id: '',
        name: '',
        code: '',
        sn: '',
        type: '',
        model: '',
        config: '',
        ip: '',
        description: '',
        provider: '',
        departmentName: '',
        location: '',
        status: '正常',
        useStatus: '闲置',
        purchaseDate: dayjs().format('YYYY-MM-DD'),
        purchasePrice: 0,
        count: 1
      })
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

const handleSubmit = async () => {
  if (!formRef.value) return

  try {
    await formRef.value.validate()
    let res
    if (props.mode === 'add') {
      res = await addAsset(form)
    } else {
      res = await updateAsset(form)
    }

    if (res.code === 200) {
      ElMessage.success(props.mode === 'add' ? '新增成功' : '修改成功')
      emit('success')
      handleClose()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(props.mode === 'add' ? '新增失败: ' : '修改失败: ' + error)
  }
}
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

:deep(.el-input-number) {
  width: 100%;
}
</style>
