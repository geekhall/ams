<template>
  <div id="assetPage" class="content-container">
    <h1>资产管理</h1>
    <div class="handle-box">
      <el-input
        v-model="query.assetName"
        placeholder="输入资产名称"
        class="handle-input mr10"
        @keyup.enter.native="handleSearch"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="handleAdd"> 新增 </el-button>
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
      <el-table-column prop="assetName" label="资产名称" align="center"></el-table-column>
      <el-table-column prop="assetCode" label="资产编号" align="center"> </el-table-column>
      <el-table-column prop="assetType" label="资产类型" align="center"></el-table-column>
      <el-table-column prop="departmentName" label="所属部门" align="center"> </el-table-column>
      <el-table-column prop="status" label="状态" align="center"> </el-table-column>
      <el-table-column prop="purchaseDate" label="购入时间" align="center"></el-table-column>
      <el-table-column
        prop="purchasePrice"
        label="购买价格"
        width="100"
        align="right"
      ></el-table-column>
      <el-table-column prop="count" label="数量" align="center" width="80"></el-table-column>
      <el-table-column label="操作" width="300" align="center">
        <template #default="scope">
          <el-button
            text
            :icon="Edit"
            @click="handleEdit(scope.$index, scope.row)"
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
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted } from 'vue'
import { useAssetType } from '@/hooks/useAssetType'
import { useDepartment } from '@/hooks/useDepartment'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete, Edit, Search, Plus } from '@element-plus/icons-vue'
import { deleteAssetById, getAssetList } from '@/api/asset'
import { type Asset } from '@/types/asset'
import AssetDialog from '@/components/asset/AssetDialog.vue'
import AssetBorrowDialog from '@/components/asset/AssetBorrowDialog.vue'

const { assetTypes, fetchAssetTypes } = useAssetType()
const { departments, fetchDepartments } = useDepartment()

const query = reactive({
  id: '',
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: '',
  purchaseDate: '',
  purchasePrice: '',
  count: 0,
  pageIndex: 1,
  pageSize: 10
})

const tableData = ref<Asset[]>([])
const pageTotal = ref(0)
const dialogVisible = ref(false)
const dialogMode = ref<'add' | 'edit'>('add')
const currentAsset = ref<Asset | null>(null)
const borrowVisible = ref(false)

// 获取表格数据
const getData = async () => {
  try {
    const res = await getAssetList({
      name: query.assetName,
      pageIndex: query.pageIndex,
      pageSize: query.pageSize
    })

    if (res.code === 200) {
      tableData.value = res.data.items
      pageTotal.value = res.data.total
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}

onMounted(() => {
  const savedPageIndex = localStorage.getItem('AMSCurrentAssetPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  getData()
  fetchDepartments()
})

// 搜索操作
const handleSearch = async () => {
  query.pageIndex = 1
  try {
    await getData()
  } catch (err) {
    ElMessage.error('搜索失败')
  }
}

// 分页导航
const handleSizeChange = async (val: number) => {
  query.pageSize = val
  query.pageIndex = 1
  try {
    await getData()
  } catch (err) {
    ElMessage.error('搜索失败')
  }
}

const handleCurrentChange = async (val: number) => {
  query.pageIndex = val
  localStorage.setItem('AMSCurrentAssetPageIndex', val.toString())
  try {
    await getData()
  } catch (err) {
    ElMessage.error('搜索失败')
  }
}

// 新增操作
const handleAdd = async () => {
  await fetchAssetTypes()
  await fetchDepartments()
  dialogMode.value = 'add'
  currentAsset.value = null
  dialogVisible.value = true
}

// 编辑操作
const handleEdit = async (index: number, row: Asset) => {
  try {
    await fetchAssetTypes()
    await fetchDepartments()
    dialogMode.value = 'edit'
    currentAsset.value = row
    dialogVisible.value = true
  } catch (error) {
    ElMessage.error('编辑失败: ' + error)
  }
}

// 删除操作
const handleDelete = async (index: number) => {
  try {
    await ElMessageBox.confirm('确定要删除吗？', '提示', {
      type: 'warning'
    })

    const res = await deleteAssetById(tableData.value[index].id)

    if (res.code === 200) {
      ElMessage.success('删除成功')
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败: ' + error)
    }
  }
}

// 领用操作
const handleBorrow = (row: Asset) => {
  currentAsset.value = row
  borrowVisible.value = true
}

// 操作成功后的回调
const handleSuccess = () => {
  getData()
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

