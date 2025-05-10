<template>
  <div class="borrow-records">
    <h1>资产领用记录</h1>
    <div class="handle-box">
      <el-input
        v-model="query.name"
        placeholder="输入资产名称"
        class="handle-input mr10"
        @keyup.enter.native="handleSearch"
      />
      <el-select v-model="query.status" placeholder="领用状态" class="handle-select mr10" clearable>
        <el-option label="使用中" value="using" />
        <el-option label="已归还" value="returned" />
        <el-option label="已逾期" value="overdue" />
      </el-select>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
    </div>

    <el-table :data="tableData" border class="table" header-cell-class-name="table-header">
      <el-table-column
        type="index"
        label="序号"
        width="80"
        align="center"
        :index="(index:number) => index + 1 + (query.pageIndex - 1) * query.pageSize"
      />
      <el-table-column prop="name" label="资产名称" align="center" />
      <el-table-column prop="code" label="资产编号" align="center" />
      <el-table-column prop="borrowDepartment" label="领用部门" align="center" />
      <el-table-column prop="borrower" label="领用人" align="center" />
      <el-table-column prop="borrowCount" label="领用数量" align="center" />
      <el-table-column prop="borrowDate" label="领用日期" align="center" />
      <el-table-column prop="expectedReturnDate" label="预计归还" align="center" />
      <el-table-column prop="actualReturnDate" label="实际归还" align="center" />
      <el-table-column prop="status" label="状态" align="center">
        <template #default="scope">
          <el-tag :type="getStatusType(scope.row.status)">
            {{ getStatusText(scope.row.status) }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="180" align="center">
        <template #default="scope">
          <el-button
            v-if="scope.row.status === 'using'"
            text
            type="primary"
            @click="handleReturn(scope.row)"
          >
            归还
          </el-button>
          <el-button text type="info" @click="handleViewDetails(scope.row)"> 详情 </el-button>
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
      />
    </div>

    <!-- 归还弹窗 -->
    <el-dialog title="资产归还" v-model="returnVisible" width="30%">
      <el-form :model="returnForm" label-width="100px" :rules="returnRules" ref="returnFormRef">
        <el-form-item label="资产名称">
          <span>{{ returnForm.name }}</span>
        </el-form-item>
        <el-form-item label="领用人">
          <span>{{ returnForm.borrower }}</span>
        </el-form-item>
        <el-form-item label="归还日期" prop="returnDate">
          <el-date-picker
            v-model="returnForm.returnDate"
            type="date"
            placeholder="选择归还日期"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
            :disabled-date="disabledDate"
          />
        </el-form-item>
        <el-form-item label="归还备注" prop="returnNote">
          <el-input
            v-model="returnForm.returnNote"
            type="textarea"
            :rows="3"
            placeholder="请输入归还备注"
          />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="returnVisible = false">取 消</el-button>
          <el-button type="primary" @click="submitReturn">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 详情弹窗 -->
    <el-dialog title="领用详情" v-model="detailsVisible" width="40%">
      <el-descriptions :column="2" border>
        <el-descriptions-item label="资产名称">{{ details.name }}</el-descriptions-item>
        <el-descriptions-item label="资产编号">{{ details.code }}</el-descriptions-item>
        <el-descriptions-item label="领用部门">{{ details.borrowDepartment }}</el-descriptions-item>
        <el-descriptions-item label="领用人">{{ details.borrower }}</el-descriptions-item>
        <el-descriptions-item label="领用数量">{{ details.borrowCount }}</el-descriptions-item>
        <el-descriptions-item label="领用日期">{{ details.borrowDate }}</el-descriptions-item>
        <el-descriptions-item label="预计归还">{{
          details.expectedReturnDate
        }}</el-descriptions-item>
        <el-descriptions-item label="实际归还">{{
          details.actualReturnDate || '-'
        }}</el-descriptions-item>
        <el-descriptions-item label="领用状态">
          <el-tag :type="getStatusType(details.status)">
            {{ getStatusText(details.status) }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="领用原因" :span="2">
          {{ details.reason }}
        </el-descriptions-item>
        <el-descriptions-item label="归还备注" :span="2">
          {{ details.returnNote || '-' }}
        </el-descriptions-item>
      </el-descriptions>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search } from '@element-plus/icons-vue'
import { getAssetBorrowRecords, returnAsset, type AssetBorrowRecord } from '@/api/asset'
import type { FormInstance, FormRules } from 'element-plus'
import dayjs from 'dayjs'

const query = reactive({
  name: '',
  status: '',
  pageIndex: 1,
  pageSize: 10
})

const tableData = ref<AssetBorrowRecord[]>([])
const pageTotal = ref(0)
const returnVisible = ref(false)
const detailsVisible = ref(false)
const returnFormRef = ref<FormInstance>()

const returnForm = reactive({
  borrowId: '',
  name: '',
  borrower: '',
  returnDate: dayjs().format('YYYY-MM-DD'),
  returnNote: ''
})

const details = reactive({
  name: '',
  code: '',
  borrowDepartment: '',
  borrower: '',
  borrowCount: 0,
  borrowDate: '',
  expectedReturnDate: '',
  actualReturnDate: '',
  status: '',
  reason: '',
  returnNote: ''
})

const returnRules = reactive<FormRules>({
  returnDate: [{ required: true, message: '请选择归还日期', trigger: 'change' }],
  returnNote: [
    { required: true, message: '请输入归还备注', trigger: 'blur' },
    { min: 5, message: '归还备注不能少于5个字符', trigger: 'blur' }
  ]
})

const getData = async () => {
  try {
    const res = await getAssetBorrowRecords({
      name: query.name,
      status: query.status,
      pageIndex: query.pageIndex,
      pageSize: query.pageSize
    })

    if (res.data) {
      tableData.value = res.data.items
      pageTotal.value = res.data.total
    } else {
      ElMessage.error('获取数据失败')
    }
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}

onMounted(() => {
  getData()
})

const handleSearch = () => {
  query.pageIndex = 1
  getData()
}

const handlePageChange = (val: number) => {
  query.pageIndex = val
  getData()
}

const getStatusType = (status: string) => {
  switch (status) {
    case 'using':
      return 'primary'
    case 'returned':
      return 'success'
    case 'overdue':
      return 'danger'
    default:
      return 'info'
  }
}

const getStatusText = (status: string) => {
  switch (status) {
    case 'using':
      return '使用中'
    case 'returned':
      return '已归还'
    case 'overdue':
      return '已逾期'
    default:
      return status
  }
}

const handleReturn = (row: AssetBorrowRecord) => {
  returnForm.borrowId = row.id
  returnForm.name = row.name
  returnForm.borrower = row.borrower
  returnForm.returnDate = dayjs().format('YYYY-MM-DD')
  returnForm.returnNote = ''
  returnVisible.value = true
}

const handleViewDetails = (row: AssetBorrowRecord) => {
  Object.assign(details, row)
  detailsVisible.value = true
}

const disabledDate = (time: Date) => {
  return time.getTime() < Date.now() - 8.64e7 // 禁用今天之前的日期
}

const submitReturn = async () => {
  if (!returnFormRef.value) return

  await returnFormRef.value.validate(async (valid) => {
    if (valid) {
      try {
        const res = await returnAsset({
          borrowId: returnForm.borrowId,
          returnDate: returnForm.returnDate,
          returnNote: returnForm.returnNote
        })

        if (res.data?.code === 200) {
          ElMessage.success('归还成功')
          returnVisible.value = false
          getData()
        } else {
          ElMessage.error(res.data?.message || '归还失败')
        }
      } catch (err) {
        ElMessage.error('归还失败')
      }
    }
  })
}
</script>

<style scoped>
.borrow-records {
  padding: 20px;
  height: 100%;
  box-sizing: border-box;
  width: 100%;
  overflow-x: hidden;
}

.handle-box {
  margin-bottom: 20px;
  width: 100%;
}

.handle-select {
  width: 100%;
}

.handle-input {
  width: 100%;
}

.table-card {
  margin-bottom: 20px;
  width: 100%;
  overflow-x: auto;
}

.table {
  width: 100%;
  font-size: 14px;
  min-width: 1200px; /* 设置最小宽度，确保内容不会被挤压 */
}

.table-header {
  background-color: #f5f7fa;
  color: #606266;
  font-weight: 600;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
  width: 100%;
  overflow-x: auto;
}

:deep(.el-table) {
  --el-table-border-color: #ebeef5;
  --el-table-header-bg-color: #f5f7fa;
  width: 100% !important;
}

:deep(.el-table__body-wrapper) {
  overflow-x: auto;
}

:deep(.el-table__header-wrapper) {
  overflow-x: hidden;
}

:deep(.el-date-picker) {
  width: 100%;
}

/* 移动端适配 */
@media screen and (max-width: 768px) {
  .borrow-records {
    padding: 10px;
  }

  .handle-box {
    margin-bottom: 10px;
  }

  .table-card {
    margin: 0 -10px; /* 在移动端下让表格卡片占满屏幕宽度 */
    border-radius: 0;
  }

  :deep(.el-table) {
    font-size: 12px;
  }

  :deep(.el-button--small) {
    padding: 5px 10px;
  }

  .pagination-container {
    padding: 0 10px;
  }
}

/* 平板适配 */
@media screen and (min-width: 769px) and (max-width: 1024px) {
  .table {
    min-width: 1000px;
  }
}

/* 小屏幕适配 */
@media screen and (min-width: 1025px) and (max-width: 1366px) {
  .table {
    min-width: 1100px;
  }
}
</style>
