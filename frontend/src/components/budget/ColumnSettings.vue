<template>
  <el-dialog
    v-model="dialogVisible"
    title="列设置"
    width="500px"
    :close-on-click-modal="false"
    @close="handleClose"
  >
    <el-checkbox-group v-model="selectedColumns" class="column-list">
      <el-checkbox
        v-for="field in allFields"
        :key="field.value"
        :label="field.value"
        class="column-item"
      >
        {{ field.label }}
      </el-checkbox>
    </el-checkbox-group>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="handleConfirm">确 定</el-button>
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

// 所有可选字段
const allFields = [
  { value: 'budgetType', label: '项目类型' },
  { value: 'budgetCategory', label: '项目性质' },
  { value: 'innovation', label: '是否信创' },
  { value: 'name', label: '项目名称' },
  { value: 'departmentName', label: '部门' },
  { value: 'amount', label: '预算金额' },
  { value: 'description', label: '项目概述' },
  { value: 'teamName', label: '团队' },
  { value: 'priority', label: '优先级' },
  { value: 'businessPriority', label: '业务优先级' },
  { value: 'businessDescription', label: '业务优先级说明' },
  { value: 'plannedStartDate', label: '预计启动时间' },
  { value: 'remark', label: '备注' }
]

// 选中的列
const selectedColumns = ref<string[]>([])

// 监听 visible 属性变化
watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
    if (newVal) {
      // 初始化选中的列
      selectedColumns.value = Object.entries(props.visibleColumns)
        .filter(([_, value]) => value)
        .map(([key]) => key)
    }
  }
)

// 监听 dialogVisible 变化
watch(
  () => dialogVisible.value,
  (newVal) => {
    emit('update:visible', newVal)
  }
)

// 关闭对话框
const handleClose = () => {
  dialogVisible.value = false
}

// 确认设置
const handleConfirm = () => {
  const newVisibleColumns = { ...props.visibleColumns }
  // 更新所有列的显示状态
  allFields.forEach((field) => {
    newVisibleColumns[field.value] = selectedColumns.value.includes(field.value)
  })
  emit('updateVisibleColumns', newVisibleColumns)
  dialogVisible.value = false
}
</script>

<style scoped>
.column-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
  max-height: 400px;
  overflow-y: auto;
  padding: 10px;
}

.column-item {
  margin-right: 0;
  padding: 8px;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.column-item:hover {
  background-color: #f5f7fa;
}
</style>
