<template>
  <el-dialog
    :title="mode === 'add' ? '新增资产' : '编辑资产'"
    v-model="dialogVisible"
    width="30%"
    @close="handleClose"
  >
    <el-form :model="form" label-width="70px" ref="formRef">
      <el-form-item label="ID" v-if="mode === 'edit'">
        <el-input v-model="form.id" disabled></el-input>
      </el-form-item>
      <el-form-item label="资产名称" prop="assetName">
        <el-input v-model="form.assetName"></el-input>
      </el-form-item>
      <el-form-item label="资产编号" prop="assetCode">
        <el-input v-model="form.assetCode"></el-input>
      </el-form-item>
      <el-form-item label="资产类型" prop="assetType">
        <el-select v-model="form.assetType" placeholder="请选择">
          <el-option
            v-for="item in assetTypes"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="所属部门" prop="departmentName">
        <el-select v-model="form.departmentName">
          <el-option
            v-for="item in departments"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="状态" prop="status">
        <el-select v-model="form.status">
          <el-option label="正常" value="正常"></el-option>
          <el-option label="维修" value="维修"></el-option>
          <el-option label="报废" value="报废"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="购入时间" prop="purchaseDate">
        <el-date-picker
          class="date-picker"
          v-model="form.purchaseDate"
          type="date"
          format="YYYY-MM-DD"
          value-format="YYYY-MM-DD"
          size="default"
          placeholder="选择日期"
        />
      </el-form-item>
      <el-form-item label="购买价格" prop="purchasePrice">
        <el-input v-model="form.purchasePrice"></el-input>
      </el-form-item>
      <el-form-item label="数量" prop="count">
        <el-input v-model="form.count"></el-input>
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
import { addAsset, updateAsset } from '@/api/asset'
import type { FormInstance } from 'element-plus'
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
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: '正常',
  purchaseDate: dayjs().format('YYYY-MM-DD'),
  purchasePrice: 0,
  count: 0
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
        assetName: '',
        assetCode: '',
        assetType: '',
        departmentName: '',
        status: '正常',
        purchaseDate: dayjs().format('YYYY-MM-DD'),
        purchasePrice: 0,
        count: 0
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
.date-picker {
  width: 100%;
}
</style>
