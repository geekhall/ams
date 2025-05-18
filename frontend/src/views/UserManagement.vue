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
          <div m="4">
            <p m="t-0 b-2">角色: {{ props.row.roles }}</p>
            <p m="t-0 b-2">权限: {{ props.row.permissions }}</p>
            <p m="t-0 b-2">团队: {{ props.row.teamName }}</p>
            <p m="t-0 b-2">年龄: {{ props.row.age }}</p>
            <p m="t-0 b-2">地址: {{ props.row.address }}</p>
            <p m="t-0 b-2">性别: {{ props.row.gender }}</p>
            <p m="t-0 b-2">上次登录时间: {{ props.row.lastLoginTime }}</p>
            <p m="t-0 b-2">上次登录IP: {{ props.row.lastLoginIp }}</p>
            <p m="t-0 b-2">注册时间: {{ props.row.createTime }}</p>
            <p m="t-0 b-2">更新时间: {{ props.row.updateTime }}</p>
            <p m="t-0 b-2">状态: {{ props.row.status === 0 ? '正常' : '禁用' }}</p>
            <p m="t-0 b-2">是否启用: {{ props.row.isActive }}</p>
            <p m="t-0 b-2">是否锁定: {{ props.row.isLocked }}</p>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名"></el-table-column>
      <el-table-column prop="name" label="昵称"></el-table-column>
      <el-table-column prop="phone" label="手机号"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column prop="department" label="部门"></el-table-column>

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
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox, FormInstance } from 'element-plus'
import { Delete, Edit, Search, Plus } from '@element-plus/icons-vue'
import { getUserList, addUser, updateUser, deleteUser } from '~/api/user'
import { UserDTO } from '~/types/user'
import UserDialog from '../components/user/UserDialog.vue'
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

// 获取表格数据
const getData = async () => {
  try {
    // 确保查询参数正确
    const params = {
      username: query.name || undefined,
      pageIndex: query.pageIndex || 1,
      pageSize: query.pageSize || 10
    }

    const res = await getUserList(params)

    if (res.code === 200 && res.data) {
      tableData.value = res.data.items || []
      pageTotal.value = res.data.total || 0
    } else {
      ElMessage.error(res.message || '获取用户列表失败')
      tableData.value = []
      pageTotal.value = 0
    }
  } catch (error) {
    ElMessage.error('获取用户列表失败')
    tableData.value = []
    pageTotal.value = 0
  }
}

onMounted(async () => {
  try {
    // 从 localStorage 获取保存的页码
    const savedPageIndex = localStorage.getItem('AMSCurentUserManagementPageIndex')
    if (savedPageIndex) {
      query.pageIndex = parseInt(savedPageIndex, 10)
    }
    // 确保页码有效
    if (isNaN(query.pageIndex) || query.pageIndex < 1) {
      query.pageIndex = 1
    }
    await getData()
  } catch (error) {
    console.error('初始化数据失败:', error)
    ElMessage.error('初始化数据失败')
  }
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
</style>
