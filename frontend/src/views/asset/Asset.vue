<template>
  <div id="assetPage" class="content-container">
    <h1>资产管理</h1>
    <div class="handle-box">
      <el-input
        v-model="query.name"
        placeholder="输入资产名称"
        class="handle-input mr10"
        @keyup.enter.native="handleSearch"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="handleAddWithFetch"> 新增 </el-button>
      <el-button type="warning" :icon="Setting" @click="showColumnSettings">列设置</el-button>
    </div>
    <el-table
      :data="tableData"
      border
      class="table"
      ref="multipleTable"
      header-cell-class-name="table-header"
    >
      <el-table-column
        prop="id"
        label="ID"
        width="180"
        align="center"
        v-if="false"
      ></el-table-column>
      <el-table-column
        type="index"
        label="序号"
        width="80"
        align="center"
        :index="(index:number) => index + 1 + (query.pageIndex - 1) * query.pageSize"
      ></el-table-column>
      <el-table-column
        prop="name"
        label="资产名称"
        align="center"
        v-if="visibleColumns.name"
      ></el-table-column>
      <el-table-column
        prop="code"
        label="资产编号"
        align="center"
        v-if="visibleColumns.code"
      ></el-table-column>
      <el-table-column
        prop="sn"
        label="资产序列号"
        align="center"
        v-if="visibleColumns.sn"
      ></el-table-column>
      <el-table-column
        prop="type"
        label="资产类型"
        align="center"
        v-if="visibleColumns.type"
      ></el-table-column>
      <el-table-column
        prop="model"
        label="资产型号"
        align="center"
        v-if="visibleColumns.model"
      ></el-table-column>
      <el-table-column
        prop="config"
        label="资产配置"
        align="center"
        v-if="visibleColumns.config"
      ></el-table-column>
      <el-table-column
        prop="ip"
        label="资产IP"
        align="center"
        v-if="visibleColumns.ip"
      ></el-table-column>
      <el-table-column
        prop="description"
        label="资产描述"
        align="center"
        v-if="visibleColumns.description"
      ></el-table-column>
      <el-table-column
        prop="provider"
        label="资产提供商"
        align="center"
        v-if="visibleColumns.provider"
      ></el-table-column>
      <el-table-column
        prop="departmentName"
        label="所属部门"
        align="center"
        v-if="visibleColumns.departmentName"
      ></el-table-column>
      <el-table-column
        prop="location"
        label="资产位置"
        align="center"
        v-if="visibleColumns.location"
      ></el-table-column>
      <el-table-column
        prop="status"
        label="状态"
        align="center"
        v-if="visibleColumns.status"
      ></el-table-column>
      <el-table-column
        prop="useStatus"
        label="使用状态"
        align="center"
        v-if="visibleColumns.useStatus"
      ></el-table-column>
      <el-table-column
        prop="purchaseDate"
        label="购入时间"
        align="center"
        v-if="visibleColumns.purchaseDate"
      ></el-table-column>
      <el-table-column
        prop="purchasePrice"
        label="购买价格"
        width="100"
        align="right"
        v-if="visibleColumns.purchasePrice"
      ></el-table-column>
      <el-table-column
        prop="count"
        label="数量"
        align="center"
        width="80"
        v-if="visibleColumns.count"
      ></el-table-column>
      <el-table-column label="操作" width="300" align="center">
        <template #default="scope">
          <el-button
            text
            :icon="Edit"
            @click="handleEditWithFetch(scope.$index, scope.row)"
            v-permission="15"
          >
            编辑
          </el-button>
          <el-button
            text
            :icon="Delete"
            class="red"
            @click="handleDelete(scope.$index)"
            v-permission="16"
          >
            删除
          </el-button>
          <el-button
            text
            :icon="Memo"
            type="primary"
            @click="handleBorrow(scope.row)"
            :disabled="scope.row.status !== '正常'"
          >
            领用
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
        :total="pageTotal"
        :page-sizes="[10, 20, 50, 100]"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      ></el-pagination>
    </div>

    <!-- 使用组合对话框组件 -->
    <AssetDialog
      v-model:visible="dialogVisible"
      :mode="dialogMode"
      :asset-types="assetTypes"
      :departments="departments"
      :asset="currentAsset"
      @success="handleSuccess"
    />

    <!-- 使用领用对话框组件 -->
    <AssetBorrowDialog
      v-model:visible="borrowVisible"
      :departments="departments"
      :asset="currentAsset"
      @success="handleSuccess"
    />

    <!-- 列设置对话框 -->
    <ColumnSettings
      v-model:visible="columnSettingsVisible"
      :visibleColumns="visibleColumns"
      @updateVisibleColumns="updateVisibleColumns"
    />
  </div>
</template>

<script lang="ts" setup>
import { onMounted, ref } from 'vue'
import { useAssetType } from '@/hooks/useAssetType'
import { useDepartment } from '@/hooks/useDepartment'
import { Delete, Edit, Search, Plus, Memo, Setting } from '@element-plus/icons-vue'
import { useAsset } from '@/hooks/useAsset'
import AssetDialog from '@/components/asset/AssetDialog.vue'
import AssetBorrowDialog from '@/components/asset/AssetBorrowDialog.vue'
import ColumnSettings from '@/components/asset/ColumnSettings.vue'

const { assetTypes, fetchAssetTypes } = useAssetType()
const { departments, fetchDepartments } = useDepartment()
const {
  query,
  tableData,
  pageTotal,
  dialogVisible,
  dialogMode,
  currentAsset,
  borrowVisible,
  getData,
  handleSearch,
  handleSizeChange,
  handleCurrentChange,
  handleAdd,
  handleEdit,
  handleDelete,
  handleBorrow,
  handleSuccess
} = useAsset()

// 列显示控制
const visibleColumns = ref({
  name: true,
  code: true,
  sn: true,
  type: true,
  model: true,
  config: true,
  ip: true,
  description: true,
  provider: true,
  departmentName: true,
  location: true,
  status: true,
  useStatus: true,
  purchaseDate: true,
  purchasePrice: true,
  count: true
})

// 列设置对话框
const columnSettingsVisible = ref(false)

const showColumnSettings = () => {
  columnSettingsVisible.value = true
}

onMounted(() => {
  const savedPageIndex = localStorage.getItem('AMSCurrentAssetPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  getData()
  fetchDepartments()
})

// 新增操作
const handleAddWithFetch = async () => {
  await fetchAssetTypes()
  await fetchDepartments()
  await handleAdd()
}

// 编辑操作
const handleEditWithFetch = async (index: number, row: any) => {
  await fetchAssetTypes()
  await fetchDepartments()
  await handleEdit(index, row)
}

// 更新列显示控制
const updateVisibleColumns = (newVisibleColumns: any) => {
  visibleColumns.value = newVisibleColumns
}
</script>

<style scoped>
.handle-box {
  margin-bottom: 20px;
}

.handle-select {
  width: 120px;
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

.table-td-avatar {
  display: block;
  margin: auto;
  width: 40px;
  height: 40px;
}
</style>

