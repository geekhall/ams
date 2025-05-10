<template>
  <el-dialog v-model="dialogVisible" title="列设置" width="500px" :before-close="handleClose">
    <el-form>
      <el-form-item label="显示列">
        <el-checkbox-group v-model="selectedColumns">
          <el-checkbox value="name">资产名称</el-checkbox>
          <el-checkbox value="code">资产编号</el-checkbox>
          <el-checkbox value="sn">资产序列号</el-checkbox>
          <el-checkbox value="type">资产类型</el-checkbox>
          <el-checkbox value="model">资产型号</el-checkbox>
          <el-checkbox value="config">资产配置</el-checkbox>
          <el-checkbox value="ip">资产IP</el-checkbox>
          <el-checkbox value="description">资产描述</el-checkbox>
          <el-checkbox value="provider">资产提供商</el-checkbox>
          <el-checkbox value="departmentName">所属部门</el-checkbox>
          <el-checkbox value="location">资产位置</el-checkbox>
          <el-checkbox value="status">状态</el-checkbox>
          <el-checkbox value="useStatus">使用状态</el-checkbox>
          <el-checkbox value="purchaseDate">购入时间</el-checkbox>
          <el-checkbox value="purchasePrice">购买价格</el-checkbox>
          <el-checkbox value="count">数量</el-checkbox>
        </el-checkbox-group>
      </el-form-item>
    </el-form>
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
const selectedColumns = ref<string[]>([])

// 监听visible属性变化
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
    newVisibleColumns[key] = selectedColumns.value.includes(key)
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

:deep(.el-checkbox-group) {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 10px;
}
</style>
