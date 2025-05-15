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
      <el-form-item v-if="mode === 'edit'" label="关联资产数">
        <el-tag :type="assetCount > 0 ? 'warning' : 'info'">
          {{ assetCount || 0 }}
        </el-tag>
      </el-form-item>
      <!-- <el-form-item v-if="mode === 'edit' && assetCount === 0" label="状态">
        <el-radio-group v-model="form.status">
          <el-radio value="1">启用</el-radio>
          <el-radio value="0">停用</el-radio>
        </el-radio-group>
      </el-form-item> -->
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
import { addAssetType, updateAssetType, getAssetTypeSummaryList } from '@/api/asset'
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
const assetCount = ref(0)

const form = reactive({
  id: '',
  name: '',
  status: 1
})

const rules = reactive<FormRules>({
  name: [
    { required: true, message: '请输入资产类型名称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ]
})

// 获取资产类型关联的资产数
const getAssetCount = async (typeId: string) => {
  try {
    const res = await getAssetTypeSummaryList()
    if (res.code === 200) {
      const type = res.data.find((item) => item.id === typeId)
      if (type) {
        assetCount.value = type.assetCount || 0
      } else {
        console.warn(`未找到ID为 ${typeId} 的资产类型`)
        assetCount.value = 0
      }
    } else {
      ElMessage.error(res.message || '获取资产类型关联资产数失败')
    }
  } catch (error) {
    console.error('获取资产类型关联资产数失败:', error)
    ElMessage.error('获取资产类型关联资产数失败')
  }
}

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
      form.status = val.status
      // 如果是编辑模式，获取关联资产数
      if (props.mode === 'edit') {
        getAssetCount(val.id)
      }
    } else {
      form.id = ''
      form.name = ''
      form.status = 1
      assetCount.value = 0
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
          // 如果是编辑模式且有资产关联，不允许修改状态
          if (assetCount.value > 0) {
            await updateAssetType(form.id, form.name, form.status)
          } else {
            // 如果没有资产关联，可以修改状态
            await updateAssetType(form.id, form.name, form.status)
          }
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
