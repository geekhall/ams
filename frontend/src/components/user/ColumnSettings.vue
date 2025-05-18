<template>
  <el-dialog
    v-model="dialogVisible"
    title="列设置"
    width="900px"
    :close-on-click-modal="false"
    @close="handleClose"
  >
    <div class="column-settings">
      <el-transfer
        v-model="selectedColumns"
        :data="transferData"
        :titles="['展开行字段', '表格显示字段']"
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
        <el-button type="primary" @click="handleSave">确定</el-button>
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

const dialogVisible = computed({
  get: () => props.visible,
  set: (value) => emit('update:visible', value)
})

// 定义所有字段
const allFields = [
  { value: 'username', label: '用户名' },
  { value: 'name', label: '昵称' },
  { value: 'phone', label: '手机号' },
  { value: 'email', label: '邮箱' },
  { value: 'department', label: '部门' },
  { value: 'roles', label: '角色' },
  { value: 'permissions', label: '权限' },
  { value: 'teamName', label: '团队' },
  { value: 'age', label: '年龄' },
  { value: 'address', label: '地址' },
  { value: 'gender', label: '性别' },
  { value: 'lastLoginTime', label: '上次登录时间' },
  { value: 'lastLoginIp', label: '上次登录IP' },
  { value: 'createTime', label: '注册时间' },
  { value: 'updateTime', label: '更新时间' },
  { value: 'status', label: '状态' },
  { value: 'isActive', label: '是否启用' },
  { value: 'isLocked', label: '是否锁定' }
]

// 转换数据为穿梭框所需格式
const transferData = allFields.map((field) => ({
  key: field.value,
  label: field.label,
  value: field.value
}))

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

const handleClose = () => {
  dialogVisible.value = false
}

const handleSave = () => {
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
