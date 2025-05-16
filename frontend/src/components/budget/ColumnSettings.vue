<template>
  <el-dialog
    v-model="dialogVisible"
    title="列设置"
    width="700px"
    :close-on-click-modal="false"
    @close="handleClose"
  >
    <div class="transfer-container">
      <el-transfer
        v-model="selectedColumns"
        :data="transferData"
        :titles="['已选列', '可选列']"
        :props="{
          key: 'value',
          label: 'label'
        }"
        filterable
        filter-placeholder="请输入列名"
      />
    </div>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="handleConfirm">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch, computed } from 'vue'

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

// 转换为穿梭框数据格式
const transferData = computed(() => allFields)

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
        .filter(([_, value]) => !value)
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
    newVisibleColumns[field.value] = !selectedColumns.value.includes(field.value)
  })
  emit('updateVisibleColumns', newVisibleColumns)
  dialogVisible.value = false
}
</script>

<style scoped>
.transfer-container {
  display: flex;
  justify-content: center;
  padding: 20px 0;
}

:deep(.el-transfer) {
  width: 100%;
  display: flex;
  justify-content: center;
}

:deep(.el-transfer-panel) {
  width: 40%;
  min-width: 200px;
}

:deep(.el-transfer-panel__body) {
  height: 400px;
}

:deep(.el-transfer-panel__list) {
  height: calc(100% - 40px);
}

:deep(.el-transfer-panel__filter) {
  margin: 10px;
}

:deep(.el-transfer__buttons) {
  padding: 0 20px;
}

:deep(.el-transfer__button) {
  display: block;
  margin: 10px 0;
}

:deep(.el-transfer__button:first-child) {
  margin-bottom: 20px;
}
</style>
