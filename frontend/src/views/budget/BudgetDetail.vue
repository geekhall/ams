<template>
  <div id="budgetDetailPage" class="content-container">
    <h1 style="display: flex">
      <div @click="handleSelectYear" class="switch-button">
        {{ formatYear(selectedYear) }}
      </div>
      年度
      <div type="warning" :icon="Switch" @click="toggleTech" class="switch-button">
        {{ buttonName }}
      </div>
      预算明细
    </h1>
    <div class="table-title">
      <div class="handle-box">
        <div class="filter-bar">
          <el-form inline class="filter-form">
            <el-form-item style="width: 150px">
              <el-select v-model="query.budgetType" placeholder="项目类型" @change="handleSearch">
                <el-option
                  v-for="item in budgetTypes"
                  :key="item.name"
                  :label="item.name"
                  :value="item.name"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item style="width: 280px">
              <el-select
                v-model="query.budgetCategory"
                placeholder="项目性质"
                @change="handleSearch"
              >
                <el-option
                  v-for="item in budgetCategories"
                  :key="item.name"
                  :label="item.name"
                  :value="item.name"
                ></el-option>
              </el-select>
            </el-form-item>
            <!-- 部门（新加） -->
            <el-form-item style="width: 200px">
              <el-select
                v-model="query.departmentName"
                placeholder="部门"
                @change="handleSearch"
                clearable
              >
                <el-option
                  v-for="dept in departments"
                  :key="dept.name"
                  :label="dept.name"
                  :value="dept.name"
                />
              </el-select>
            </el-form-item>
            <el-form-item style="width: 120px">
              <el-select v-model="query.innovation" @change="handleSearch" placeholder="是否信创">
                <el-option label="是" value="1"></el-option>
                <el-option label="否" value="0"></el-option>
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-input
                v-model="query.name"
                @keyup.enter="handleSearch"
                placeholder="项目名称"
              ></el-input>
            </el-form-item>
            <el-button type="primary" :icon="Search" @click="handleSearch" v-if="false"
              >搜索</el-button
            >
            <el-button type="primary" :icon="Refresh" @click="handleClear">清空</el-button>
            <el-button type="success" :icon="Setting" @click="showColumnSettings">列设置</el-button>
          </el-form>
        </div>
      </div>
      <div class="handle-box">
        <el-button type="primary" :icon="Plus" @click="handleAdd"> 新增 </el-button>
        <el-button type="primary" :icon="Upload" @click="handleImport">导入</el-button>
        <el-button type="primary" :icon="Download" @click="handleExport">导出</el-button>
      </div>
    </div>
    <div></div>
    <el-table
      :data="tableData"
      border
      class="table"
      ref="multipleTable"
      @row-dblclick="handleRowDblClick"
      header-cell-class-name="table-header"
    >
      <el-table-column
        prop="id"
        label="ID"
        width="80"
        align="center"
        v-if="false"
      ></el-table-column>

      <el-table-column type="expand">
        <template #default="props">
          <div class="expand-content">
            <div class="expand-grid">
              <template v-for="field in expandFields" :key="field.value">
                <div class="expand-item" :class="{ 'full-row': field.value === 'description' }">
                  <div class="expand-label">{{ field.label }}</div>
                  <div class="expand-value">
                    {{
                      field.value === 'amount'
                        ? '¥' + props.row[field.value]
                        : props.row[field.value]
                    }}
                  </div>
                </div>
              </template>
            </div>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="projectInfo" label="项目概述" align="center">
        <el-table-column prop="budgetType" label="项目类型" align="center"></el-table-column>
        <el-table-column prop="budgetCategory" label="项目性质" align="center"></el-table-column>
        <el-table-column prop="innovation" label="是否信创" align="center" width="60px">
        </el-table-column>
        <el-table-column prop="name" label="项目名称" align="center"> </el-table-column>
      </el-table-column>
      <el-table-column prop="departmentName" label="部门" align="center"> </el-table-column>
      <el-table-column prop="amount" label="预算金额" align="center"> </el-table-column>

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

    <div class="pagination-and-actions">
      <!-- 左：分页 -->
      <el-pagination
        background
        layout="total, sizes, prev, pager, next"
        :current-page="query.pageIndex"
        :page-size="query.pageSize"
        :page-sizes="[10, 20, 50, 100]"
        :total="pageTotal"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      ></el-pagination>

      <!-- 右：季度选择 + 报告按钮 -->
      <div class="report-actions">
        <el-select v-model="selectedQuarter" placeholder="选择季度" style="width: 120px">
          <el-option v-for="n in [1, 2, 3, 4]" :key="n" :label="`第${n}季度`" :value="n" />
        </el-select>
        <el-button type="primary" class="ml-10" @click="handleGenerateReport('year')">
          生成年度报告
        </el-button>
        <el-button type="primary" class="ml-10" @click="handleGenerateReport('quarter')">
          生成季度报告
        </el-button>
      </div>
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
    <BudgetDialog
      v-model:visible="dialogVisible"
      :mode="dialogMode"
      :budget-types="budgetTypes"
      :budget-categories="budgetCategories"
      :departments="departments"
      :teams="teams"
      :is-tech="isTech"
      :selected-year="selectedYear"
      :budget="currentBudget || undefined"
      @success="handleSuccess"
      @approval-required="handleApprovalRequired"
    />

    <!-- 审批流程抽屉 -->
    <el-drawer
      v-model="approvalDrawerVisible"
      title="预算修改审批"
      size="800px"
      :destroy-on-close="true"
    >
      <div class="approval-container">
        <el-form :model="approvalForm" label-width="120px" class="approval-form">
          <el-form-item label="项目名称">
            <span>{{ approvalForm.projectName }}</span>
          </el-form-item>
          <el-form-item label="修改原因">
            <el-input
              v-model="approvalForm.reason"
              type="textarea"
              :rows="4"
              placeholder="请输入修改原因"
            />
          </el-form-item>
          <el-form-item label="修改内容">
            <div class="changes-table">
              <el-table :data="changesData" border style="width: 100%">
                <el-table-column prop="field" label="字段" width="150" />
                <el-table-column prop="oldValue" label="原值" width="200">
                  <template #default="scope">
                    <span :class="{ 'highlight-deleted': scope.row.changed }">
                      {{ scope.row.oldValue }}
                    </span>
                  </template>
                </el-table-column>
                <el-table-column prop="newValue" label="新值" width="200">
                  <template #default="scope">
                    <span :class="{ 'highlight-added': scope.row.changed }">
                      {{ scope.row.newValue }}
                    </span>
                  </template>
                </el-table-column>
                <el-table-column prop="description" label="说明" />
              </el-table>
            </div>
          </el-form-item>
          <el-form-item label="审批人">
            <el-select v-model="approvalForm.approver" placeholder="请选择审批人">
              <el-option
                v-for="item in approvers"
                :key="item.value"
                :label="item.label"
                :value="item.value"
              />
            </el-select>
          </el-form-item>
        </el-form>

        <div class="approval-history" v-if="approvalHistory.length > 0">
          <h3>审批历史</h3>
          <el-timeline>
            <el-timeline-item
              v-for="(activity, index) in approvalHistory"
              :key="index"
              :timestamp="activity.timestamp"
              :type="activity.type"
            >
              {{ activity.content }}
            </el-timeline-item>
          </el-timeline>
        </div>

        <div class="drawer-footer">
          <el-button @click="approvalDrawerVisible = false">取 消</el-button>
          <el-button type="primary" @click="submitApproval">提 交</el-button>
        </div>
      </div>
    </el-drawer>

    <!-- 列设置对话框 -->
    <ColumnSettings
      v-model:visible="columnSettingsVisible"
      :visibleColumns="visibleColumns"
      @updateVisibleColumns="updateVisibleColumns"
    />
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted, computed } from 'vue'
import { useBudgetType } from '@/hooks/useBudgetType'
import { useBudgetCategory } from '@/hooks/useBudgetCategory'
import { useDepartment } from '@/hooks/useDepartment'
import { useTeam } from '@/hooks/useTeam'
import { generateReport, ReportRequest } from '@/api/report' // ← 新增
import { ElMessage, ElMessageBox } from 'element-plus'
import {
  Delete,
  Edit,
  Search,
  Plus,
  Switch,
  Select,
  Upload,
  Download,
  Refresh,
  Setting
} from '@element-plus/icons-vue'
import { deleteBudgetById, getBudgetList, addBudget, updateBudget } from '@/api/budget'
import { type Budget } from '@/types/budget'
import dayjs from 'dayjs'
import { hasPermission } from '@/utils/permission'
import BudgetDialog from '@/components/budget/BudgetDialog.vue'
import ColumnSettings from '@/components/budget/ColumnSettings.vue'
import { useUserStore } from '@/stores/user'
import { PermissionType } from '@/types/user'

const { departments, fetchDepartments } = useDepartment()
const { budgetTypes, fetchBudgetTypes } = useBudgetType()
const { budgetCategories, fetchBudgetCategories } = useBudgetCategory()
const { teams, fetchTeams } = useTeam()

const isTech = ref(true)
const buttonName = ref('科技')
const toggleTech = () => {
  isTech.value = !isTech.value
  buttonName.value = isTech.value === true ? '科技' : '业务'
  // 切换时重新获取数据
  getData()
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
  // 更新表格数据
  getData()
}

const query = reactive({
  id: '',
  name: '',
  description: '',
  budgetType: '',
  budgetCategory: '',
  innovation: '',
  amount: 0,
  departmentName: '',
  teamName: '',
  priority: '',
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
const dialogVisible = ref(false)
const dialogMode = ref<'add' | 'edit'>('add')
const currentBudget = ref<Budget | null>(null)

const userStore = useUserStore()

// 获取表格数据
const getData = async () => {
  try {
    const res = await getBudgetList({
      year: selectedYear.value.getFullYear(),
      budgetType: query.budgetType,
      budgetCategory: query.budgetCategory,
      innovation: query.innovation,
      name: query.name,
      tech: isTech.value ? '1' : '0',
      departmentName: query.departmentName,
      pageIndex: query.pageIndex,
      pageSize: query.pageSize
    })

    if (res.code === 200) {
      // console.log('getBudgetList res.data:', res.data)
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
const handleSearch = async () => {
  query.pageIndex = 1
  try {
    await getData()
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}
const handleClear = () => {
  query.name = ''
  query.budgetType = ''
  query.budgetCategory = ''
  query.innovation = ''
  query.amount = 0
  query.departmentName = ''
  query.teamName = ''
  query.priority = ''
  query.businessPriority = ''
  query.businessDescription = ''
  query.plannedStartDate = dayjs().format('YYYY-MM-DD')
  query.remark = ''
  getData()
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
  localStorage.setItem('AMSCurrentBudgetPageIndex', val.toString())
  try {
    await getData()
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}

// 新增操作
const handleAdd = async () => {
  try {
    await fetchBudgetTypes()
    await fetchBudgetCategories()
    await fetchDepartments()
    await fetchTeams()
    dialogMode.value = 'add'
    currentBudget.value = null
    dialogVisible.value = true
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}
// 保存新增操作
const handleSuccess = () => {
  getData()
}

// 编辑操作
const handleEdit = async (index: number, row: Budget) => {
  try {
    await fetchBudgetTypes()
    await fetchBudgetCategories()
    await fetchDepartments()
    await fetchTeams()
    dialogMode.value = 'edit'
    currentBudget.value = row
    dialogVisible.value = true
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}

// 处理需要审批的情况
const handleApprovalRequired = (form: Budget) => {
  approvalForm.projectName = form.name
  approvalForm.projectId = form.id
  approvalForm.reason = ''
  approvalForm.approver = ''
  approvalDrawerVisible.value = true
}

// 修改内容数据结构
interface ChangeItem {
  field: string
  oldValue: string | number
  newValue: string | number
  description: string
  changed: boolean
}

// 字段映射
const fieldMap = {
  name: '项目名称',
  description: '项目概述',
  budgetType: '项目类型',
  budgetCategory: '项目性质',
  innovation: '是否信创',
  amount: '预算金额',
  departmentName: '部门',
  teamName: '团队',
  priority: '优先级',
  businessPriority: '业务优先级',
  businessDescription: '业务优先级说明',
  plannedStartDate: '预计启动时间',
  remark: '备注'
}

// 计算修改内容数据
const changesData = computed(() => {
  const changes: ChangeItem[] = []
  const originalData = tableData.value.find((item) => item.id === approvalForm.projectId)

  if (!originalData || !currentBudget.value) return changes

  Object.entries(currentBudget.value).forEach(([key, value]) => {
    if (key === 'id') return // 跳过ID字段

    const oldValue = originalData[key as keyof Budget]
    const newValue = value

    // 检查值是否发生变化
    const changed = oldValue !== newValue

    // 格式化显示值
    const formatValue = (val: any) => {
      if (key === 'innovation') return val === '1' ? '是' : '否'
      if (key === 'priority') return val === 1 ? '优先' : '默认'
      if (key === 'amount') return `¥${val.toLocaleString()}`
      return val
    }

    changes.push({
      field: fieldMap[key as keyof typeof fieldMap] || key,
      oldValue: formatValue(oldValue),
      newValue: formatValue(newValue),
      description: changed ? '已修改' : '未修改',
      changed
    })
  })

  return changes
})

// 修改保存编辑操作
const saveEdit = async () => {
  if (!hasPermission(userStore.userInfo, PermissionType.BUDGET_EDIT)) {
    // 如果没有编辑权限，打开审批抽屉
    approvalForm.projectName = currentBudget.value?.name || ''
    approvalForm.projectId = currentBudget.value?.id || ''
    approvalForm.reason = ''
    approvalForm.approver = ''
    approvalDrawerVisible.value = true
    return
  }

  dialogVisible.value = false
  let currentPage = query.pageIndex
  try {
    if (!currentBudget.value) {
      throw new Error('No budget data to update')
    }
    const res = await updateBudget(currentBudget.value)

    if (res.code === 200) {
      ElMessage.success(`修改成功`)
      query.pageIndex = currentPage
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('修改失败')
  }
}

// 删除操作
const handleDelete = async (index: number) => {
  // 二次确认删除
  try {
    await ElMessageBox.confirm('确定要删除吗？', '提示', {
      type: 'warning'
    })
    const res = await deleteBudgetById(tableData.value[index].id)
    if (res.code === 200) {
      ElMessage.success('删除成功')
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('删除失败')
  }
}
// 双击行时的处理函数
const handleRowDblClick = (row: any, column: any, event: Event) => {
  console.log('双击行数据:', row)
  console.log('双击的列:', column)
  console.log('事件对象:', event)
}

const handleImport = () => {
  // 这里可以添加导入逻辑
  ElMessage.success('导入成功')
}
const handleExport = () => {
  // 这里可以添加导出逻辑
  ElMessage.success('导出成功')
}
// 生成报告
const selectedQuarter = ref<number | null>(null) // 存储选择的季度

function handleGenerateReport(command: 'year' | 'quarter') {
  const base = {
    year: selectedYear.value.getFullYear(),
    type: command
  }

  // 如果是季度报告，就加上一个 number 类型的 quarter
  const payload: ReportRequest =
    command === 'quarter' ? { ...base, quarter: selectedQuarter.value! } : base

  generateReport(payload)
    .then((res) => {
      const blob = res.data
      const url = window.URL.createObjectURL(blob)
      const a = document.createElement('a')
      a.href = url
      a.download = `预算执行报告_${payload.year}_${payload.type}.xlsx`
      a.click()
      window.URL.revokeObjectURL(url)
    })
    .catch(() => {
      ElMessage.error('报告生成失败')
    })
}

// 审批流程相关
const approvalDrawerVisible = ref(false)
const approvalForm = reactive({
  projectName: '',
  reason: '',
  changes: '',
  approver: '',
  projectId: ''
})

const approvers = [
  { value: '1', label: '部门经理' },
  { value: '2', label: '财务总监' },
  { value: '3', label: '总经理' }
]

const approvalHistory = ref([
  {
    content: '张三提交了修改申请',
    timestamp: '2024-03-20 10:00:00',
    type: 'primary'
  },
  {
    content: '李四审批通过',
    timestamp: '2024-03-20 11:00:00',
    type: 'success'
  }
])

const submitApproval = async () => {
  if (!approvalForm.reason || !approvalForm.changes || !approvalForm.approver) {
    ElMessage.warning('请填写完整的审批信息')
    return
  }

  try {
    // TODO: 调用后端API提交审批
    ElMessage.success('审批申请已提交')
    approvalDrawerVisible.value = false
  } catch (error) {
    ElMessage.error('提交失败')
  }
}

// 列显示控制
const visibleColumns = ref({
  budgetType: true,
  budgetCategory: true,
  innovation: true,
  name: true,
  departmentName: true,
  amount: true,
  description: false,
  teamName: false,
  priority: false,
  businessPriority: false,
  businessDescription: false,
  plannedStartDate: false,
  remark: false
})

// 列设置对话框
const columnSettingsVisible = ref(false)

const showColumnSettings = () => {
  columnSettingsVisible.value = true
}

// 定义字段类型
type FieldKey = keyof typeof visibleColumns.value

// 更新列显示控制
const updateVisibleColumns = (newVisibleColumns: Record<FieldKey, boolean>) => {
  visibleColumns.value = newVisibleColumns
}

// 计算表格显示的字段
const tableFields = computed(() => {
  return allFields.filter((field) => visibleColumns.value[field.value as FieldKey])
})

// 计算展开行显示的字段
const expandFields = computed(() => {
  return allFields.filter((field) => !visibleColumns.value[field.value as FieldKey])
})

// 所有字段定义
const allFields = [
  { value: 'budgetType', label: '项目类型' },
  { value: 'budgetCategory', label: '项目性质' },
  { value: 'innovation', label: '是否信创' },
  { value: 'name', label: '项目名称' },
  { value: 'departmentName', label: '部门' },
  { value: 'amount', label: '预算金额' },
  { value: 'description', label: '项目概述' },
  { value: 'teamName', label: '团队' },
  { value: 'priority', label: '优先级' },
  { value: 'businessPriority', label: '业务优先级' },
  { value: 'businessDescription', label: '业务优先级说明' },
  { value: 'plannedStartDate', label: '预计启动时间' },
  { value: 'remark', label: '备注' }
]
</script>

<style scoped>
.table-title {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fafafa;
  overflow: hidden;
}
.handle-box {
  /* margin-bottom: 20px; */
  min-width: max-content;
}

.handle-select {
  width: 120px;
}

.handle-input {
  width: 200px;
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
  width: 100%;
}
.red {
  color: #f56c6c;
}
.mr10 {
  margin-right: 10px;
}
.date-picker {
  width: 100%;
}
.search-select {
  width: 120px;
}
/* 新增 begin */
.filter-bar {
  padding: 16px;
  background: #fafafa;
}
.filter-form {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  align-items: center;
}
.filter-form .el-form-item {
  margin: 0;
}

.switch-button {
  margin-right: 10px;
  background-color: #fafafa;
  padding: 0 10px;
  border-radius: 5px;
}
.switch-button:hover {
  cursor: pointer; /* 仅在鼠标悬停时显示手形指针 */
  background-color: #e4e7ed;
}
.action-bar {
  display: flex;
  justify-content: flex-end; /* 靠右对齐 */
  gap: 10px; /* 按钮间距 */
  margin-bottom: 16px; /* 与筛选栏保持距离 */
}
.ml-10 {
  margin-left: 10px;
}
.pagination-and-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 20px; /* 或者你想要的间距 */
}

.report-actions {
  display: flex;
  align-items: center;
}

.report-actions > * + * {
  margin-left: 10px;
}

.changes-table {
  margin: 10px 0;
}

.highlight-deleted {
  color: #f56c6c;
  text-decoration: line-through;
}

.highlight-added {
  color: #67c23a;
  font-weight: bold;
}

.approval-container {
  padding: 20px;
  height: calc(100% - 60px);
  overflow-y: auto;
}

.approval-form {
  margin-bottom: 20px;
}

.approval-history {
  margin-top: 20px;
  padding-top: 20px;
  border-top: 1px solid #eee;
}

.drawer-footer {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 20px;
  background: #fff;
  border-top: 1px solid #eee;
  text-align: right;
}

.expand-content {
  padding: 20px;
  background-color: #fafafa;
}

.expand-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 1px;
  background-color: #ebeef5;
  border: 1px solid #ebeef5;
  border-radius: 4px;
}

.expand-item {
  display: flex;
  width: calc(33.33% - 1px);
  background-color: #fff;
}
.expand-item.full-row {
  width: 100%;
  min-height: 88px; /* 正常高度的2倍 */
}

.expand-label {
  width: 120px;
  padding: 12px 15px;
  background-color: #f5f7fa;
  font-weight: bold;
  color: #606266;
  border-right: 1px solid #ebeef5;
}

.expand-value {
  flex: 1;
  padding: 12px 15px;
  color: #606266;
}

/* 响应式布局 */
@media screen and (max-width: 1200px) {
  .expand-item {
    width: calc(50% - 1px);
  }
}

@media screen and (max-width: 768px) {
  .expand-item {
    width: 100%;
  }
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
</style>
