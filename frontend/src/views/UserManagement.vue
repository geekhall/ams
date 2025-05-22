<template>
  <div id="userManagementPage" class="content-container">
    <h1>用户管理</h1>
    <div class="handle-box">
      <el-input
        v-model="query.name"
        placeholder="用户名"
        @keyup.enter="handleSearch"
        class="handle-input mr10"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="openAddDialog">新增</el-button>
      <el-button type="success" :icon="Setting" @click="showColumnSettings">列设置</el-button>
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
        width="55"
        align="center"
        v-if="false"
      ></el-table-column>
      <el-table-column type="expand">
        <template #default="props">
          <div class="expand-content">
            <div class="expand-grid">
              <template v-for="field in expandFields" :key="field.value">
                <div class="expand-item">
                  <div class="expand-label">{{ field.label }}</div>
                  <div class="expand-value">
                    {{ formatFieldValue(props.row[field.value], field.value) }}
                  </div>
                </div>
              </template>
            </div>
          </div>
        </template>
      </el-table-column>
      <template v-for="field in tableFields" :key="field.value">
        <el-table-column :prop="field.value" :label="field.label" align="center"></el-table-column>
      </template>
      <el-table-column label="操作" width="220" align="center">
        <template #default="scope">
          <el-button text :icon="Edit" @click="openEditDialog(scope.$index, scope.row)">
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

    <!-- 新增和编辑弹窗 -->
    <UserDialog
      v-model:visible="dialogVisible"
      :is-edit="isEdit"
      :form-data="currentFormData"
      @save="handleSave"
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
import { ref, reactive, onMounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete, Edit, Search, Plus, Setting } from '@element-plus/icons-vue'
import { getUserList, addUser, updateUser, deleteUser } from '~/api/user'
import { UserDTO, UserListResponse } from '~/types/user'
import UserDialog from '../components/user/UserDialog.vue'
import ColumnSettings from '../components/user/ColumnSettings.vue'

const dialogVisible = ref(false)
const isEdit = ref(false)
const currentFormData = ref<UserDTO>({
  id: '',
  username: '',
  password: '',
  confirmPassword: '',
  name: '',
  phone: '',
  email: '',
  avatar: '',
  department: '',
  roles: [],
  permissions: [],
  status: 0,
  isActive: true,
  isLocked: false
})
const handleSave = async (formData: UserDTO) => {
  try {
    const res = isEdit.value ? await updateUser(formData) : await addUser(formData)

    if (res.code === 200) {
      ElMessage.success(isEdit.value ? '修改成功' : '新增成功')
      // 重新获取数据
      getData()
    } else {
      ElMessage.error(res.message)
    }
    dialogVisible.value = false
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '操作失败')
  }
}

const openAddDialog = () => {
  isEdit.value = false
  currentFormData.value = {
    id: '',
    username: 'user15',
    password: '',
    confirmPassword: '',
    name: 'user15',
    phone: '13500005555',
    email: 'user15@gmail.com',
    avatar: '',
    department: '信息科技部',
    roles: [],
    permissions: [],
    status: 0,
    isActive: true,
    isLocked: false
  }
  dialogVisible.value = true
}
const openEditDialog = (idx: number, row: UserDTO) => {
  isEdit.value = true
  currentFormData.value = { ...row }
  dialogVisible.value = true
}

const query = reactive({
  name: '',
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<UserDTO[]>([])
const pageTotal = ref(0)

// 定义所有字段
const allFields = [
  { value: 'username', label: '用户名' },
  { value: 'name', label: '昵称' },
  { value: 'phone', label: '手机号' },
  { value: 'email', label: '邮箱' },
  { value: 'department', label: '部门' },
  { value: 'roles', label: '角色' },
  { value: 'permissions', label: '权限' },
  { value: 'teamName', label: '团队' },
  { value: 'age', label: '年龄' },
  { value: 'address', label: '地址' },
  { value: 'gender', label: '性别' },
  { value: 'lastLoginTime', label: '上次登录时间' },
  { value: 'lastLoginIp', label: '上次登录IP' },
  { value: 'createTime', label: '注册时间' },
  { value: 'updateTime', label: '更新时间' },
  { value: 'status', label: '状态' },
  { value: 'isActive', label: '是否启用' },
  { value: 'isLocked', label: '是否锁定' }
]

// 选中的列（表格显示字段）
const selectedColumns = ref<string[]>([])

// 计算表格显示的字段
const tableFields = computed(() => {
  return allFields.filter((field) => selectedColumns.value.includes(field.value))
})

// 计算展开行显示的字段
const expandFields = computed(() => {
  return allFields.filter((field) => !selectedColumns.value.includes(field.value))
})

// 列显示控制
const visibleColumns = ref({
  username: true,
  name: true,
  phone: true,
  email: true,
  department: true,
  roles: false,
  permissions: false,
  teamName: false,
  age: false,
  address: false,
  gender: false,
  lastLoginTime: false,
  lastLoginIp: false,
  createTime: false,
  updateTime: false,
  status: false,
  isActive: false,
  isLocked: false
})

// 列设置对话框
const columnSettingsVisible = ref(false)

const showColumnSettings = () => {
  // 初始化选中的列（表格中显示的字段）
  selectedColumns.value = Object.entries(visibleColumns.value)
    .filter(([_, value]) => value)
    .map(([key]) => key)
  columnSettingsVisible.value = true
}

// 更新列显示控制
const updateVisibleColumns = (newVisibleColumns: any) => {
  visibleColumns.value = newVisibleColumns
  // 更新选中的列（表格中显示的字段）
  selectedColumns.value = Object.entries(newVisibleColumns)
    .filter(([_, value]) => value)
    .map(([key]) => key)
}

// 格式化字段值
const formatFieldValue = (value: any, field: string) => {
  if (value === null || value === undefined) return '-'

  switch (field) {
    case 'status':
      return value === 0 ? '正常' : '禁用'
    case 'isActive':
      return value ? '是' : '否'
    case 'isLocked':
      return value ? '是' : '否'
    case 'gender':
      return value === '男' ? '男' : '女'
    case 'roles':
    case 'permissions':
      return Array.isArray(value) ? value.join(', ') : value
    case 'lastLoginTime':
    case 'createTime':
    case 'updateTime':
      return value ? new Date(value).toLocaleString() : '-'
    default:
      return value
  }
}

// 获取表格数据
const getData = async () => {
  try {
    // 确保查询参数正确
    const params = {
      username: query.name || undefined,
      pageIndex: query.pageIndex || 1,
      pageSize: query.pageSize || 10
    }

    const res: UserListResponse = await getUserList(params)

    if (res.code === 200 && res.data) {
      tableData.value = res.data.items || []
      pageTotal.value = res.data.total || 0
    } else {
      ElMessage.error(res.message || '获取用户列表失败')
      tableData.value = []
      pageTotal.value = 0
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取用户列表失败')
  }
}

onMounted(() => {
  const savedPageIndex = localStorage.getItem('AMSCurentUserManagementPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  // 初始化选中的列
  selectedColumns.value = Object.entries(visibleColumns.value)
    .filter(([_, value]) => value)
    .map(([key]) => key)
  getData()
})

// 搜索操作
const handleSearch = async () => {
  try {
    query.pageIndex = 1
    await getData()
  } catch (error) {
    console.error('搜索失败:', error)
    ElMessage.error('搜索失败')
  }
}

// 分页导航
const handlePageChange = async (val: number) => {
  try {
    if (val < 1) {
      val = 1
    }
    query.pageIndex = val
    localStorage.setItem('AMSCurentUserManagementPageIndex', val.toString())
    await getData()
  } catch (error) {
    console.error('切换页码失败:', error)
    ElMessage.error('切换页码失败')
  }
}

// 删除操作
const handleDelete = async (index: number) => {
  const row = tableData.value[index]
  if (!row.id) {
    ElMessage.error('用户ID不存在')
    return
  }

  try {
    await ElMessageBox.confirm('确定要删除该用户吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })

    const res = await deleteUser(row.id)
    if (res.code === 200) {
      ElMessage.success('删除成功')
      // 重新获取数据
      getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error(error instanceof Error ? error.message : '删除失败')
    }
  }
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
</style>
