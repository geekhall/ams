<template>
  <div id="budgetDetailPage" class="content-container">
    <h1>{{ formatYear(selectedYear) }}年度 预算明细</h1>
    <div class="table-title">
      <div class="handle-box">
        <el-button type="danger" :icon="Select" @click="handleSelectYear" style="margin-right: 10px"
          >选择年度</el-button
        >
        <el-button type="warning" :icon="Switch" @click="toggleTech" style="margin-right: 20px">
          {{ buttonName }}
        </el-button>
        <el-input
          v-model="query.name"
          placeholder="输入预算名称"
          class="handle-input mr10"
          @keyup.enter.native="handleSearch"
        ></el-input>
        <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
        <el-button type="primary" :icon="Plus" @click="handleAdd"> 新增 </el-button>
      </div>
      <div>
        <el-button type="primary" :icon="Upload" @click="handleImport">导入</el-button>
        <el-button type="primary" :icon="Download" @click="handleExport">导出</el-button>
      </div>
    </div>
    <el-table
      :data="tableData"
      border
      class="table"
      ref="multipleTable"
      @row-dblclick="handleRowDblClick"
      header-cell-class-name="table-header"
    >
      <el-table-column prop="id" label="ID" width="80" align="center"></el-table-column>
      <el-table-column prop="projectInfo" label="项目概述" align="center">
        <el-table-column prop="budgetType" label="项目类型" align="center"></el-table-column>
        <el-table-column prop="budgetCategory" label="项目性质" align="center"></el-table-column>
        <el-table-column prop="inno" label="是否信创" align="center" width="60px">
        </el-table-column>
        <el-table-column prop="name" label="项目名称" align="center"> </el-table-column>
        <el-table-column prop="description" label="项目概述" align="center"> </el-table-column>
      </el-table-column>
      <el-table-column prop="amount" label="预算金额" align="center"> </el-table-column>
      <el-table-column prop="departmentName" label="部门" align="center"> </el-table-column>
      <el-table-column v-if="isTech" prop="teamName" label="团队" align="center"> </el-table-column>
      <el-table-column v-if="!isTech" prop="priority" label="优先级" align="center" width="60px">
      </el-table-column>
      <el-table-column
        v-if="!isTech"
        prop="businessPriority"
        label="业务优先级"
        align="center"
        width="90px"
      >
      </el-table-column>
      <el-table-column
        v-if="!isTech"
        prop="businessDescription"
        label="业务优先级情况说明"
        align="center"
      >
      </el-table-column>
      <el-table-column
        v-if="!isTech"
        prop="plannedStartDate"
        label="预计启动时间"
        align="center"
        width="90px"
      >
      </el-table-column>
      <el-table-column prop="remark" label="备注" align="center"> </el-table-column>
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
        <el-col :span="8" style="margin-top: 10px"></el-col>
      </el-row>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="yearVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveYear">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 新增弹出框 -->
    <el-dialog title="新增预算" v-model="addVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="项目类型">
          <el-select v-model="addForm.budgetType" placeholder="请选择">
            <el-option
              v-for="item in budgetTypes"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目性质">
          <el-select v-model="addForm.budgetCategory" placeholder="请选择">
            <el-option
              v-for="item in budgetCategories"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否信创">
          <el-select v-model="addForm.inno">
            <el-option label="是" value="是"></el-option>
            <el-option label="否" value="否"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目名称">
          <el-input v-model="addForm.name"></el-input>
        </el-form-item>
        <el-form-item label="项目概述">
          <el-input v-model="addForm.description"></el-input>
        </el-form-item>
        <el-form-item label="预算金额">
          <el-input v-model="addForm.amount"></el-input>
        </el-form-item>
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
        <el-form-item label="团队">
          <el-select v-model="addForm.teamName">
            <el-option
              v-for="item in teams"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="优先级" v-if="!isTech">
          <el-input v-model="addForm.priority"></el-input>
        </el-form-item>
        <el-form-item label="业务优先级" v-if="!isTech">
          <el-input v-model="addForm.businessPriority"></el-input>
        </el-form-item>
        <el-form-item label="业务优先级情况说明" v-if="!isTech">
          <el-input v-model="addForm.businessDescription"></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="addForm.remark"></el-input>
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
        <el-form-item label="项目类型">
          <el-select v-model="editForm.budgetType" placeholder="请选择">
            <el-option
              v-for="item in budgetTypes"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目性质">
          <el-select v-model="editForm.budgetCategory" placeholder="请选择">
            <el-option
              v-for="item in budgetCategories"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否信创">
          <el-select v-model="editForm.inno">
            <el-option label="是" value="是"></el-option>
            <el-option label="否" value="否"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="项目名称">
          <el-input v-model="editForm.name"></el-input>
        </el-form-item>
        <el-form-item label="项目概述">
          <el-input v-model="editForm.description"></el-input>
        </el-form-item>
        <el-form-item label="预算金额">
          <el-input v-model="editForm.amount"></el-input>
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
        <el-form-item label="团队">
          <el-select v-model="editForm.teamName">
            <el-option
              v-for="item in teams"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="优先级" v-if="!isTech">
          <el-input v-model="editForm.priority"></el-input>
        </el-form-item>
        <el-form-item label="业务优先级" v-if="!isTech">
          <el-input v-model="editForm.businessPriority"></el-input>
        </el-form-item>
        <el-form-item label="业务优先级情况说明" v-if="!isTech">
          <el-input v-model="editForm.businessDescription"></el-input>
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="editForm.remark"></el-input>
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
import { useBudgetType } from '@/hooks/useBudgetType'
import { useBudgetCategory } from '@/hooks/useBudgetCategory'
import { useDepartment } from '@/hooks/useDepartment'
import { useTeam } from '@/hooks/useTeam'

import { ElMessage, ElMessageBox } from 'element-plus'
import {
  Delete,
  Edit,
  Search,
  Plus,
  Switch,
  Select,
  Upload,
  Download
} from '@element-plus/icons-vue'
import { deleteBudgetById, getBudgetList, addBudget, updateBudget } from '@/api/budget'
import { type Budget } from '@/types/budget'
import dayjs from 'dayjs'

const { departments, fetchDepartments } = useDepartment()
const { budgetTypes, fetchBudgetTypes } = useBudgetType()
const { budgetCategories, fetchBudgetCategories } = useBudgetCategory()
const { teams, fetchTeams } = useTeam()

const isTech = ref(true)
const buttonName = ref('科技')
const toggleTech = () => {
  isTech.value = !isTech.value
  buttonName.value = isTech.value === true ? '科技' : '业务'
}
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
  ElMessage.success(`已选择 ${selectedYear.value.getFullYear()} 年度`)
  // 更新年度
  addForm.year = selectedYear.value.getFullYear()
  editForm.year = selectedYear.value.getFullYear()
  // 更新表格数据
  getData()
}

const query = reactive({
  id: '',
  name: '',
  description: '',
  budgetType: '',
  budgetCategory: '',
  inno: '',
  amount: 0,
  departmentName: '',
  teamName: '',
  priority: 1,
  businessPriority: '',
  businessDescription: '',
  plannedStartDate: dayjs().format('YYYY-MM-DD'),
  remark: '',
  status: '',
  // 分页参数
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<Budget[]>([])
const pageTotal = ref(0)
// 表格编辑时弹窗和保存
const addVisible = ref(false)
let addForm = reactive({
  year: selectedYear.value.getFullYear(),
  name: '测试项目1',
  description: '测试需求及目标',
  budgetType: '软件',
  budgetCategory: '监管要求落实',
  inno: '是',
  amount: 10000,
  departmentName: '信息科技部',
  teamName: '核心开发',
  priority: 1,
  businessPriority: '已立项',
  businessDescription: '测试业务优先级情况说明',
  plannedStartDate: dayjs().format('YYYY-MM-DD'),
  remark: '测试备注',
  status: '正常'
})
const editVisible = ref(false)
let editForm = reactive({
  id: '',
  year: selectedYear.value.getFullYear(),
  name: '',
  description: '',
  budgetType: '',
  budgetCategory: '',
  inno: '',
  amount: 0,
  departmentName: '',
  teamName: '',
  priority: 1,
  businessPriority: '',
  businessDescription: '',
  plannedStartDate: dayjs().format('YYYY-MM-DD'),
  remark: '',
  status: ''
})

let idx: number = -1

// 获取表格数据
const getData = () => {
  getBudgetList({
    year: selectedYear.value.getFullYear(),
    name: query.name,
    pageIndex: query.pageIndex,
    pageSize: query.pageSize
  })
    .then((res) => {
      if (res.code === 200) {
        console.log('getBudgetList res.data:', res.data)

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
  const savedPageIndex = localStorage.getItem('AMSCurrentBudgetPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  getData()
  fetchBudgetTypes()
  fetchBudgetCategories()
  fetchDepartments()
  fetchTeams()
})

// 搜索操作
const handleSearch = () => {
  query.pageIndex = 1
  // 获取输入框中的值
  console.log('query.name', query.name)
  // 这里可以添加搜索逻辑
  getData()
}

// 分页导航
const handlePageChange = (val: number) => {
  query.pageIndex = val
  localStorage.setItem('AMSCurrentBudgetPageIndex', val.toString())
  getData()
}

// 新增操作
const handleAdd = () => {
  fetchBudgetTypes()
  fetchBudgetCategories()
  fetchDepartments()
  fetchTeams()
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
  addBudget(addForm)
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
      ElMessage.error('新增失败')
    })
}

// 编辑操作
const handleEdit = (index: number, row: any) => {
  fetchBudgetTypes()
  fetchBudgetCategories()
  fetchDepartments()
  fetchTeams()
  idx = index
  editForm.id = row.id
  editForm.year = row.year
  editForm.name = row.name
  editForm.description = row.description
  editForm.budgetType = row.budgetType
  editForm.budgetCategory = row.budgetCategory
  editForm.inno = row.inno
  editForm.amount = row.amount
  editForm.departmentName = row.departmentName
  editForm.teamName = row.teamName
  editForm.priority = row.priority
  editForm.businessPriority = row.businessPriority
  editForm.businessDescription = row.businessDescription
  editForm.plannedStartDate = row.plannedStartDate
  editForm.remark = row.remark
  editForm.status = row.status
  // 这里可以根据需要设置其他字段
  editVisible.value = true
  // 更新后台数据
}

// 保存编辑操作
const saveEdit = () => {
  editVisible.value = false
  let currentPage = query.pageIndex
  // 编辑至后台的逻辑
  updateBudget(editForm)
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
      deleteBudgetById(tableData.value[index].id)
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
// 双击行时的处理函数
const handleRowDblClick = (row: any, column: any, event: Event) => {
  console.log('双击行数据:', row)
  console.log('双击的列:', column)
  console.log('事件对象:', event)
  // 执行更多操作
}

const handleImport = () => {
  // 这里可以添加导入逻辑
  ElMessage.success('导入成功')
}
const handleExport = () => {
  // 这里可以添加导出逻辑
  ElMessage.success('导出成功')
}
</script>

<style scoped>
.table-title {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
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
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
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
.el-table {
  width: 100%; /* 设置表格宽度为100% */
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

function getMaxPage(): number {
  throw new Error('Function not implemented.')
}
