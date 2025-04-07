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
    <!-- 新增弹出框 -->
    <el-dialog title="新增资产" v-model="addVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="资产名称">
          <el-input v-model="addForm.assetName"></el-input>
        </el-form-item>
        <el-form-item label="资产编号">
          <el-input v-model="addForm.assetCode"></el-input>
        </el-form-item>
        <el-form-item label="资产类型">
          <el-input v-model="addForm.assetType"></el-input>
        </el-form-item>
        <el-form-item label="所属部门">
          <el-input v-model="addForm.departmentName"></el-input>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="addForm.status" placeholder="请选择">
            <el-option label="正常" :value="0"></el-option>
            <el-option label="在用" :value="1"></el-option>
            <el-option label="维修" :value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="购入时间">
          <span class="demonstration"></span>
          <el-date-picker
            class="date-picker"
            v-model="addForm.purchaseDate"
            type="date"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
            size="default"
            placeholder="选择日期"
          />
        </el-form-item>
        <el-form-item label="购买价格">
          <el-input v-model="addForm.purchasePrice"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="addForm.count"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="addVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveAdd">确 定</el-button>
        </span>
      </template>
    </el-dialog>
    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" v-model="editVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="ID">
          <el-input v-model="editForm.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="资产名称">
          <el-input v-model="editForm.assetName"></el-input>
        </el-form-item>
        <el-form-item label="资产编号">
          <el-input v-model="editForm.assetCode"></el-input>
        </el-form-item>
        <el-form-item label="资产类型">
          <el-input v-model="editForm.assetType"></el-input>
        </el-form-item>
        <el-form-item label="所属部门">
          <el-input v-model="editForm.departmentName"></el-input>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="editForm.status" placeholder="请选择">
            <el-option label="在用" :value="1"></el-option>
            <el-option label="维修" :value="2"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="购入时间">
          <span class="demonstration"></span>
          <el-date-picker
            class="date-picker"
            v-model="editForm.purchaseDate"
            type="date"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
            size="default"
            placeholder="选择日期"
          />
        </el-form-item>
        <el-form-item label="购买价格">
          <el-input v-model="editForm.purchasePrice"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="editForm.count"></el-input>
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
import { useUserStore } from '@/store/user'
import { getAssetList } from '@/api/asset'
import { Asset } from '@/types/asset'
import dayjs from 'dayjs'

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
// 表格编辑时弹窗和保存
const addVisible = ref(false)

let addForm = reactive({
  assetName: '测试资产1',
  assetCode: 'TEST-2025-1',
  assetType: '服务器',
  departmentName: '信息科技部',
  status: 0,
  purchaseDate: dayjs().format('YYYY-MM-DD'),
  purchasePrice: 0,
  count: 0
})
const editVisible = ref(false)
let editForm = reactive({
  id: '',
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: 1,
  purchaseDate: '',
  purchasePrice: 100,
  count: 1
})
let idx: number = -1

// 获取表格数据
const getData = () => {
  getAssetList({
    name: query.assetName,
    pageIndex: query.pageIndex,
    pageSize: query.pageSize
  })
    .then((res) => {
      if (res.code === 200) {
        tableData.value = res.data.items
        pageTotal.value = res.data.total
      } else {
        ElMessage.error(res.message)
      }
    })
    .catch((err) => {
      ElMessage.error('获取数据失败')
    })
    .finally(() => {
      // 这里可以添加一些清理操作
    })
}
onMounted(() => {
  getData()
})

// 搜索操作
const handleSearch = () => {
  query.pageIndex = 1
  // 获取输入框中的值
  console.log('query.assetName', query.assetName)
  // 这里可以添加搜索逻辑
  getData()
}

// 分页导航
const handlePageChange = (val: number) => {
  query.pageIndex = val
  getData()
}

// 新增操作
const handleAdd = () => {
  addVisible.value = true
  // 这里可以添加新增逻辑
}

const handleEdit = (index: number, row: any) => {
  idx = index
  editForm.id = row.id
  editForm.assetName = row.assetName
  editForm.assetCode = row.assetCode
  editForm.assetType = row.assetType
  editForm.departmentName = row.departmentName
  editForm.status = row.status
  editForm.purchaseDate = row.purchaseDate
  editForm.purchasePrice = row.purchasePrice
  editForm.count = row.count
  // 这里可以根据需要设置其他字段
  editVisible.value = true
  // 更新后台数据
}
const saveAdd = () => {
  addVisible.value = false
  // 添加至后台的逻辑

  ElMessage.success('新增成功')
  // 更新表格数据（这里有问题，不应该更新到当前页面）
  // tableData.value.push({
  //   id: tableData.value.length + 1,
  //   assetName: addForm.assetName,
  //   assetCode: addForm.assetCode,
  //   assetType: addForm.assetType,
  //   departmentName: addForm.departmentName,
  //   status: addForm.status,
  //   purchaseDate: addForm.purchaseDate,
  //   purchasePrice: addForm.purchasePrice,
  //   count: addForm.count
  // })
  getData()
}

const saveEdit = () => {
  editVisible.value = false
  ElMessage.success(`修改第 ${idx + 1} 行成功`)
  // 更新表格数据
  tableData.value[idx].assetName = editForm.assetName
  tableData.value[idx].assetCode = editForm.assetCode
  tableData.value[idx].assetType = editForm.assetType
  tableData.value[idx].departmentName = editForm.departmentName
  tableData.value[idx].status = editForm.status
  tableData.value[idx].purchaseDate = editForm.purchaseDate
  tableData.value[idx].purchasePrice = editForm.purchasePrice
  tableData.value[idx].count = editForm.count
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
.date-picker {
  width: 100%;
}
</style>
