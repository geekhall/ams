<template>
  <div id="assetPage" class="content-container">
    <h1>资产管理</h1>
    <div class="handle-box">
      <el-input
        v-model="query.assetName"
        placeholder="输入资产名称"
        class="handle-input mr10"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus">新增</el-button>
    </div>
    <el-table
      :data="tableData"
      border
      class="table"
      ref="multipleTable"
      header-cell-class-name="table-header"
    >
      <el-table-column prop="id" label="ID" width="55" align="center"></el-table-column>
      <el-table-column prop="assetName" label="资产名称" align="center"></el-table-column>
      <el-table-column prop="assetCode" label="资产编号" align="center"> </el-table-column>
      <el-table-column prop="assetType" label="资产类型" align="center"></el-table-column>
      <el-table-column prop="departmentName" label="所属部门" align="center"> </el-table-column>
      <el-table-column prop="status" label="状态" align="center"> </el-table-column>
      <el-table-column prop="purchaseDate" label="购入时间" align="center"></el-table-column>
      <el-table-column prop="purchasePrice" label="购买价格" align="right"></el-table-column>
      <el-table-column prop="count" label="数量" align="center" width="100"></el-table-column>
      <el-table-column label="操作" width="220" align="center">
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
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination
        background
        layout="total, prev, pager, next"
        :current-page="query.pageIndex"
        :page-size="query.pageSize"
        :total="pageTotal"
        @current-change="handlePageChange"
      ></el-pagination>
    </div>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" v-model="editVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="ID">
          <el-input v-model="form.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="资产名称">
          <el-input v-model="form.assetName"></el-input>
        </el-form-item>
        <el-form-item label="资产编号">
          <el-input v-model="form.assetCode"></el-input>
        </el-form-item>
        <el-form-item label="资产类型">
          <el-input v-model="form.assetType"></el-input>
        </el-form-item>
        <el-form-item label="所属部门">
          <el-input v-model="form.departmentName"></el-input>
        </el-form-item>
        <el-form-item label="状态" label-width="120px">
          <el-select v-model="form.status" placeholder="请选择">
            <el-option label="在用" :value="1"></el-option>
            <el-option label="维修" :value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="购入时间">
          <el-input v-model="form.purchaseDate"></el-input>
        </el-form-item>
        <el-form-item label="购买价格">
          <el-input v-model="form.purchasePrice"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="form.count"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="editVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveEdit">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete, Edit, Search, Plus } from '@element-plus/icons-vue'
import { useUserStore } from '~/store/user'
import { getAssetList } from '~/api/asset'
import { Asset } from '@/types/asset'

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
  // 分页参数
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<Asset[]>([])
const pageTotal = ref(0)
const userStore = useUserStore()

// 获取表格数据
const getData = () => {
  const data = []
  getAssetList()
    .then((res) => {
      // console.log('Asset.vue::::res.data=', res.data)
      if (res.code === 200) {
        // console.log('Asset.vue::::res.data=', res.data)
        // 按照每10行一个分页，处理数据
        const start = (query.pageIndex - 1) * query.pageSize
        const end = start + query.pageSize
        tableData.value = res.data.slice(start, end)
        pageTotal.value = res.data.length
      } else {
        ElMessage.error(res.message)
      }
    })
    .catch((err) => {
      // console.error('Asset.vue::::res.data=', err)
      ElMessage.error('获取数据失败')
    })
    .finally(() => {
      // 这里可以添加一些清理操作
    })
}
onMounted(() => {
  getData()
})

// 查询操作
const handleSearch = () => {
  query.pageIndex = 1
  getData()
}
// 分页导航
const handlePageChange = (val: number) => {
  query.pageIndex = val
  getData()
}

// 删除操作
const handleDelete = (index: number) => {
  // 二次确认删除
  ElMessageBox.confirm('确定要删除吗？', '提示', {
    type: 'warning'
  })
    .then(() => {
      ElMessage.success('删除成功')
      tableData.value.splice(index, 1)
    })
    .catch(() => {})
}

// 表格编辑时弹窗和保存
const editVisible = ref(false)
let form = reactive({
  id: '',
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: 1,
  purchaseDate: '',
  purchasePrice: 0,
  count: 0
})
let idx: number = -1
const handleEdit = (index: number, row: any) => {
  idx = index
  form.id = row.id
  form.assetName = row.assetName
  form.assetCode = row.assetCode
  form.assetType = row.assetType
  form.departmentName = row.departmentName
  form.status = row.status
  form.purchaseDate = row.purchaseDate
  form.purchasePrice = row.purchasePrice
  form.count = row.count
  // 这里可以根据需要设置其他字段
  editVisible.value = true
  // 更新后台数据
}
const saveEdit = () => {
  editVisible.value = false
  ElMessage.success(`修改第 ${idx + 1} 行成功`)
  // 更新表格数据
  tableData.value[idx].assetName = form.assetName
  tableData.value[idx].assetCode = form.assetCode
  tableData.value[idx].assetType = form.assetType
  tableData.value[idx].departmentName = form.departmentName
  tableData.value[idx].status = form.status
  tableData.value[idx].purchaseDate = form.purchaseDate
  tableData.value[idx].purchasePrice = form.purchasePrice
  tableData.value[idx].count = form.count
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
