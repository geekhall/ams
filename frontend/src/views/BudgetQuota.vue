<template>
  <div id="budgetQuotaPage" class="content-container">
    <h1>{{ formatYear(selectedYear) }}年度 部门预算额度管理</h1>

    <div class="handle-box">
      <el-button type="danger" :icon="Select" @click="handleSelectYear" style="margin-right: 10px"
        >选择年度</el-button
      >
      <el-input
        v-model="query.departmentName"
        placeholder="输入部门名称"
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
      <el-table-column prop="id" label="ID" align="center"></el-table-column>
      <el-table-column prop="departmentName" label="部门" align="center"></el-table-column>
      <el-table-column prop="quota" label="预算额度" align="right"> </el-table-column>
      <el-table-column label="操作" align="center">
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
    <div class="footer-container">
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
      <div class="totalQuota">总计：{{ query.yearTotal }}</div>
    </div>

    <!-- 选择年度弹出框 -->
    <el-dialog title="选择预算年度" v-model="yearVisible" width="30%">
      <el-row>
        <el-col :span="8" style="margin-top: 10px"></el-col>
        <el-col :span="8">
          <el-form>
            <el-form-item label="年度">
              <div class="year-picker">
                <div class="container">
                  <div class="block">
                    <el-date-picker v-model="selectedYear" type="year" placeholder="选择年份" />
                  </div>
                </div>
              </div>
            </el-form-item>
          </el-form>
        </el-col>
        <el-col :span="8"></el-col>
      </el-row>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="yearVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveYear">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 新增弹出框 -->
    <el-dialog title="新增部门额度" v-model="addVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="部门">
          <el-select v-model="addForm.departmentName">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="额度">
          <el-input v-model="addForm.quota"></el-input>
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
        <el-form-item label="ID" v-show="false">
          <el-input v-model="editForm.id" disabled></el-input>
        </el-form-item>

        <el-form-item label="部门">
          <el-select v-model="editForm.departmentName">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="预算额度">
          <el-input v-model="editForm.quota"></el-input>
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
import { Delete, Edit, Search, Plus, Select } from '@element-plus/icons-vue'
import { deleteQuotaById, getQuotaList, addQuota, updateQuota } from '@/api/quota'
import { getDepartmentList } from '@/api/department'
import { type Quota } from '@/types/quota'
import { Department, DepartmentListResponse } from '@/types/department'
import dayjs from 'dayjs'

const departments = ref<Department[]>([])
const query = reactive({
  id: '',
  departmentName: '',
  quota: 0,
  yearTotal: 0,
  // 分页参数
  pageIndex: 1,
  pageSize: 16
})
const tableData = ref<Quota[]>([])
const pageTotal = ref(0)
// 表格编辑时弹窗和保存
const yearVisible = ref(false)
// 格式化日期为年度
const formatYear = (date: Date | string | null | undefined) => {
  if (!date) {
    return ''
  }
  return dayjs(date).format('YYYY')
}
const selectedYear = ref(new Date())
// 选择年度操作
const handleSelectYear = () => {
  yearVisible.value = true
  // 这里可以添加新增逻辑
  // selectedYear.value = new Date()
}

// 保存年度操作
const saveYear = () => {
  // 检查selectedYear的值是否有效
  if (!selectedYear.value || isNaN(selectedYear.value.getTime())) {
    ElMessage.error('请选择有效的年度')
    return
  }
  // 关闭弹窗
  yearVisible.value = false
  // 添加至后台的逻辑
  ElMessage.success(`已选择 ${selectedYear.value.getFullYear()} 年度的额度信息`)
  // 更新年度
  addForm.year = selectedYear.value.getFullYear()
  editForm.year = selectedYear.value.getFullYear()

  // 更新表格数据
  getData()
}

const addVisible = ref(false)
let addForm = reactive({
  year: selectedYear.value.getFullYear(),
  departmentName: '信息科技部',
  quota: 0
})
const editVisible = ref(false)
let editForm = reactive({
  id: '',
  year: selectedYear.value.getFullYear(),
  departmentName: '',
  quota: 0
})
let idx: number = -1
// 获取部门列表
const getDepartments = () => {
  getDepartmentList().then((res: DepartmentListResponse) => {
    if (res.code === 200) {
      console.log('getDepartmentList res.data:', res.data)
      departments.value = res.data
    } else {
      ElMessage.error(res.message)
    }
  })
}
// 获取表格数据
const getData = () => {
  getQuotaList({
    name: query.departmentName,
    year: selectedYear.value.getFullYear(),
    pageIndex: query.pageIndex,
    pageSize: query.pageSize
  })
    .then((res) => {
      if (res.code === 200) {
        tableData.value = res.data.items
        pageTotal.value = res.data.count
        query.yearTotal = res.data.total
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
  const savedPageIndex = localStorage.getItem('AMSCurrentQuotaPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  getData()
})

// 搜索操作
const handleSearch = () => {
  query.pageIndex = 1
  // 这里可以添加搜索逻辑
  getData()
}

// 分页导航
const handlePageChange = (val: number) => {
  query.pageIndex = val
  localStorage.setItem('AMSCurrentQuotaPageIndex', val.toString())
  getData()
}

// 新增操作
const handleAdd = () => {
  getDepartments()
  addVisible.value = true
  // 这里可以添加新增逻辑
}
const getMaxPage = () => {
  if (!pageTotal.value) {
    return 1
  }

  let maxPage = Math.ceil((pageTotal.value + 1) / query.pageSize)
  return maxPage
}
// 保存新增操作
const saveAdd = () => {
  addVisible.value = false
  // 添加至后台的逻辑
  addQuota(addForm)
    .then((res) => {
      if (res.code === 200) {
        ElMessage.success('新增成功')
        // 更新当前页码
        query.pageIndex = getMaxPage()
        // 更新表格数据
        getData()
      } else {
        ElMessage.error(res.message)
      }
    })
    .catch((err) => {
      ElMessage.error('新增失败: ' + err.message)
    })
}

// 编辑操作
const handleEdit = (index: number, row: any) => {
  getDepartments()
  idx = index
  editForm.id = row.id
  editForm.departmentName = row.departmentName
  editForm.quota = row.quota
  // 这里可以根据需要设置其他字段
  editVisible.value = true
  // 更新后台数据
}

// 保存编辑操作
const saveEdit = () => {
  editVisible.value = false
  let currentPage = query.pageIndex
  // 编辑至后台的逻辑
  updateQuota(editForm)
    .then((res) => {
      if (res.code === 200) {
        ElMessage.success(`修改第 ${idx + 1} 行成功`)
        // 更新表格数据
        query.pageIndex = currentPage
        getData()
      } else {
        ElMessage.error(res.message)
      }
    })
    .catch((err) => {
      ElMessage.error('修改失败')
    })
}

// 删除操作
const handleDelete = (index: number) => {
  // 二次确认删除
  ElMessageBox.confirm('确定要删除吗？', '提示', {
    type: 'warning'
  })
    .then(() => {
      // 删除操作
      deleteQuotaById(tableData.value[index].id)
        .then((res) => {
          if (res.code === 200) {
            ElMessage.success('删除成功')
            // 更新表格数据
            getData()
          } else {
            ElMessage.error(res.message)
          }
        })
        .catch((err) => {
          ElMessage.error('删除失败')
        })
    })
    .catch(() => {})
}
</script>

<style scoped>
.handle-box {
  display: flex;
  justify-content: flex-start;
  align-items: center;
  flex-direction: row;
  width: 100%;
}

.handle-select {
  width: 120px;
}

.handle-input {
  width: 300px;
}
.footer-container {
  display: flex;
  padding: 0 20px;
  max-width: 960px;
  justify-content: space-between;
  align-items: center;
  width: 100%;
}

.totalQuota {
  font-size: 20px;
  font-weight: bold;

  color: #f26c6f;
  text-align: right;
}
.table {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  max-width: 960px;
  width: 100%;
  border-radius: 4px;
  overflow: hidden;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
  background-color: #fff;
  border: 1px solid #e4e7ed;
  margin-top: 20px;
  margin-bottom: 20px;
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
.year-picker {
  display: flex;
  width: 100%;
  padding: 0;
  flex-wrap: wrap;
}

.year-picker .block {
  text-align: left;
  widows: 100%;
  border-right: solid 1px var(--el-border-color);
  flex: 1;
}

.year-picker .block:last-child {
  border-right: none;
}

.year-picker .container {
  flex: 1;
  border-right: solid 1px var(--el-border-color);
}

.year-picker .container .block {
  border-right: none;
}

.year-picker .container .block:last-child {
  border-top: solid 1px var(--el-border-color);
}

.year-picker .container:last-child {
  border-right: none;
}
</style>
