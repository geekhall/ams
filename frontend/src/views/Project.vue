<template>
  <div id="projectPage" class="content-container">
    <h1>项目清单</h1>
    <div class="handle-box">
      <el-input v-model="query.name" placeholder="项目名称" class="handle-input mr10"></el-input>
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
      <el-table-column prop="username" label="项目名称"></el-table-column>
      <el-table-column prop="description" label="项目简介"></el-table-column>
      <el-table-column prop="pm" label="项目负责人"></el-table-column>
      <el-table-column prop="department" label="部门"></el-table-column>
      <el-table-column prop="status" label="状态" align="center"> </el-table-column>
      <el-table-column prop="planStart" label="计划开始时间"></el-table-column>
      <el-table-column prop="planEnd" label="计划结束时间"></el-table-column>

      <el-table-column label="操作" width="220" align="center">
        <template #default="scope">
          <el-button text :icon="Edit" @click="handleEdit(scope.$index, scope.row)">
            编辑
          </el-button>
          <el-button text :icon="Delete" class="red" @click="handleDelete(scope.$index)">
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
        <el-form-item label="用户名">
          <el-input v-model="form.name"></el-input>
        </el-form-item>
        <el-form-item label="职业">
          <el-input v-model="form.career"></el-input>
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
import { useUserStore } from '@/stores/user'

interface TableItem {
  id: string
  name: string
  intro: string
  level: number
  createTime: string
  career: string
}

const query = reactive({
  career: '',
  name: '',
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<TableItem[]>([])
const pageTotal = ref(0)
const userStore = useUserStore()

// 获取表格数据
const getData = () => {}
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
  name: '',
  career: ''
})
let idx: number = -1
const handleEdit = (index: number, row: any) => {
  idx = index
  form.name = row.name
  form.career = row.career
  editVisible.value = true
}
const saveEdit = () => {
  editVisible.value = false
  ElMessage.success(`修改第 ${idx + 1} 行成功`)
  tableData.value[idx].name = form.name
  tableData.value[idx].career = form.career
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
