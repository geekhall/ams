<template>
  <el-dialog v-model="dialogVisible" title="列设置" width="800px" :before-close="handleClose">
    <div class="transfer-container">
      <el-transfer
        v-model="selectedColumns"
        :data="allColumns"
        :titles="['表格显示字段', '展开行字段']"
        :props="{
          key: 'value',
          label: 'label'
        }"
        :left-default-checked="[]"
        :right-default-checked="[]"
      />
    </div>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" @click="handleConfirm">确定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch } from 'vue'

const props = defineProps<{
  visible: boolean
  visibleColumns: Record<string, boolean>
}>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'updateVisibleColumns', value: Record<string, boolean>): void
}>()

const dialogVisible = ref(props.visible)

// 定义所有列
const allColumns = [
  { value: 'name', label: '资产名称' },
  { value: 'code', label: '资产编号' },
  { value: 'sn', label: '资产序列号' },
  { value: 'type', label: '资产类型' },
  { value: 'model', label: '资产型号' },
  { value: 'config', label: '资产配置' },
  { value: 'ip', label: '资产IP' },
  { value: 'description', label: '资产描述' },
  { value: 'provider', label: '资产提供商' },
  { value: 'departmentName', label: '所属部门' },
  { value: 'location', label: '资产位置' },
  { value: 'status', label: '状态' },
  { value: 'useStatus', label: '使用状态' },
  { value: 'purchaseDate', label: '购入时间' },
  { value: 'purchasePrice', label: '购买价格' },
  { value: 'count', label: '数量' }
]

// 选中的列（表格显示字段）
const selectedColumns = ref<string[]>([])

// 监听visible属性变化
watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
    if (newVal) {
      // 初始化选中的列（展开行字段）
      selectedColumns.value = Object.entries(props.visibleColumns)
        .filter(([_, value]) => !value)
        .map(([key]) => key)
    }
  }
)

// 监听对话框可见性变化
watch(dialogVisible, (newVal) => {
  emit('update:visible', newVal)
})

const handleClose = () => {
  dialogVisible.value = false
}

const handleConfirm = () => {
  // 更新列显示状态
  const newVisibleColumns = { ...props.visibleColumns }
  Object.keys(newVisibleColumns).forEach((key) => {
    newVisibleColumns[key] = !selectedColumns.value.includes(key)
  })
  emit('updateVisibleColumns', newVisibleColumns)
  dialogVisible.value = false
}
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.transfer-container {
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 20px 0;
}

:deep(.el-transfer) {
  width: 100%;
  display: flex;
  justify-content: space-between;
}

:deep(.el-transfer-panel) {
  width: 45%;
  margin: 0;
}

:deep(.el-transfer-panel__header) {
  background-color: #f5f7fa;
}

:deep(.el-transfer-panel__body) {
  height: 400px;
}

:deep(.el-transfer-panel__list) {
  height: 350px;
}

:deep(.el-transfer__buttons) {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

:deep(.el-transfer__button) {
  margin: 10px 0;
}
</style>
