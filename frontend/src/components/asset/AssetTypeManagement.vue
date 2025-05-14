<template>
  <el-dialog v-model="dialogVisible" title="资产类型管理" width="800px" destroy-on-close>
    <div class="handle-box">
      <el-input
        v-model="query.name"
        placeholder="输入类型名称"
        class="handle-input mr10"
        @keyup.enter.native="handleSearch"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="handleAdd">新增</el-button>
    </div>

    <el-table :data="tableData" border class="table" header-cell-class-name="table-header">
      <el-table-column
        type="index"
        label="序号"
        width="80"
        align="center"
        :index="(index:number) => index + 1 + (query.pageIndex - 1) * query.pageSize"
      ></el-table-column>
      <el-table-column prop="name" label="类型名称" align="center"></el-table-column>
      <el-table-column prop="assetCount" label="关联资产数" align="center" width="100">
        <template #default="scope">
          <el-tag :type="scope.row.assetCount > 0 ? 'warning' : 'info'">
            {{ scope.row.assetCount || 0 }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column prop="status" label="状态" align="center" width="100">
        <template #default="scope">
          <el-tag :type="scope.row.status === 'active' ? 'success' : 'info'">
            {{ scope.row.status === 'active' ? '启用' : '停用' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="280" align="center">
        <template #default="scope">
          <el-button text :icon="Edit" @click="handleEdit(scope.row)">编辑</el-button>
          <el-button
            text
            :type="scope.row.status === 'active' ? 'warning' : 'success'"
            :icon="scope.row.status === 'active' ? 'Close' : 'Check'"
            @click="handleStatusChange(scope.row)"
          >
            {{ scope.row.status === 'active' ? '停用' : '启用' }}
          </el-button>
          <el-button
            text
            :icon="Delete"
            class="red"
            :disabled="scope.row.assetCount > 0"
            @click="handleDelete(scope.row)"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="pagination">
      <el-pagination
        background
        layout="total, sizes, prev, pager, next"
        :current-page="query.pageIndex"
        :page-size="query.pageSize"
        :total="total"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>

    <!-- 资产类型编辑对话框 -->
    <AssetTypeDialog
      v-model:visible="editDialogVisible"
      :mode="dialogMode"
      :asset-type="currentAssetType"
      @success="handleSuccess"
    />
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, reactive, computed, watch } from 'vue'
import { Delete, Edit, Search, Plus, Close, Check } from '@element-plus/icons-vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import AssetTypeDialog from '@/components/asset/AssetTypeDialog.vue'
import { getAssetTypeList, deleteAssetType, updateAssetType } from '@/api/asset'
import type { AssetType } from '@/types/asset'

const props = defineProps<{
  visible: boolean
}>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'success'): void
}>()

const dialogVisible = computed({
  get: () => props.visible,
  set: (value) => emit('update:visible', value)
})

const query = reactive({
  pageIndex: 1,
  pageSize: 10,
  name: ''
})

const tableData = ref<AssetType[]>([])
const total = ref(0)
const editDialogVisible = ref(false)
const dialogMode = ref<'add' | 'edit'>('add')
const currentAssetType = ref<AssetType | null>(null)

// 获取资产类型数据
const getData = async () => {
  try {
    const res = await getAssetTypeList()
    if (res.code === 200) {
      // 根据分页参数过滤数据
      const filteredData = query.name
        ? res.data.filter((item) => item.name.includes(query.name))
        : res.data

      // 计算总数
      total.value = filteredData.length

      // 分页处理
      const start = (query.pageIndex - 1) * query.pageSize
      const end = start + query.pageSize
      tableData.value = filteredData.slice(start, end)
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error('获取资产类型列表失败')
  }
}

// 搜索
const handleSearch = () => {
  query.pageIndex = 1
  getData()
}

// 新增
const handleAdd = () => {
  dialogMode.value = 'add'
  currentAssetType.value = null
  editDialogVisible.value = true
}

// 编辑
const handleEdit = (row: AssetType) => {
  dialogMode.value = 'edit'
  currentAssetType.value = row
  editDialogVisible.value = true
}

// 状态变更
const handleStatusChange = (row: AssetType) => {
  const newStatus = row.status === 'active' ? 'inactive' : 'active'
  const actionText = newStatus === 'active' ? '启用' : '停用'

  ElMessageBox.confirm(
    `确定要${actionText}该资产类型吗？${
      newStatus === 'inactive' ? '停用后，该类型将不再出现在新增资产时的类型选择列表中。' : ''
    }`,
    '提示',
    {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    }
  ).then(async () => {
    try {
      const res = await updateAssetType(row.id, row.name, newStatus)
      if (res.code === 200) {
        ElMessage.success(`${actionText}成功`)
        getData()
        emit('success')
      } else {
        ElMessage.error(res.message)
      }
    } catch (error) {
      ElMessage.error(`${actionText}失败`)
    }
  })
}

// 删除
const handleDelete = (row: AssetType) => {
  if ((row.assetCount ?? 0) > 0) {
    ElMessage.warning('该类型下存在关联资产，无法删除')
    return
  }

  ElMessageBox.confirm('确定要删除该资产类型吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    try {
      const res = await deleteAssetType(row.id)
      if (res.code === 200) {
        ElMessage.success('删除成功')
        getData()
        emit('success')
      } else {
        ElMessage.error(res.message)
      }
    } catch (error) {
      ElMessage.error('删除失败')
    }
  })
}

// 操作成功回调
const handleSuccess = () => {
  getData()
  emit('success')
}

// 分页大小改变
const handleSizeChange = (val: number) => {
  query.pageSize = val
  getData()
}

// 页码改变
const handleCurrentChange = (val: number) => {
  query.pageIndex = val
  getData()
}

// 监听对话框显示状态
watch(
  () => props.visible,
  (newVal) => {
    if (newVal) {
      getData()
    }
  }
)
</script>

<style scoped>
.handle-box {
  margin-bottom: 20px;
}

.handle-input {
  width: 300px;
}

.table {
  width: 100%;
  font-size: 14px;
}

.red {
  color: #f56c6c;
}

.mr10 {
  margin-right: 10px;
}

:deep(.el-table .cell) {
  white-space: nowrap;
}

:deep(.el-table .el-button) {
  padding: 4px 8px;
  margin: 0 2px;
}

:deep(.el-table .el-button + .el-button) {
  margin-left: 2px;
}

@media screen and (max-width: 576px) {
  :deep(.el-table .cell) {
    padding: 8px;
  }

  :deep(.el-table .el-button) {
    padding: 2px 4px;
    font-size: 12px;
  }

  :deep(.el-table .el-button [class*='el-icon'] + span) {
    display: none;
  }
}
</style>
