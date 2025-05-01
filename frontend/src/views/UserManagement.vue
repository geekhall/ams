<template>
  <div id="userManagementPage" class="content-container">
    <h1>用户管理</h1>
    <div class="handle-box">
      <el-input v-model="query.name" placeholder="用户名" class="handle-input mr10"></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="handleAdd">新增</el-button>
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
            <p m="t-0 b-2">状态: {{ props.row.status }}</p>
            <p m="t-0 b-2">是否启用: {{ props.row.isActive }}</p>
            <p m="t-0 b-2">是否锁定: {{ props.row.isLocked }}</p>
          </div>
        </template>
      </el-table-column>
      <el-table-column prop="username" label="用户名"></el-table-column>
      <el-table-column prop="name" label="昵称"></el-table-column>
      <el-table-column prop="phone" label="手机号"></el-table-column>
      <el-table-column prop="email" label="邮箱"></el-table-column>
      <el-table-column label="头像(查看大图)" align="center">
        <template #default="scope">
          <el-image
            class="table-td-avatar"
            :src="scope.row.avatar"
            :z-index="10"
            :preview-src-list="[scope.row.avatar]"
            preview-teleported
          >
          </el-image>
        </template>
      </el-table-column>
      <el-table-column prop="department" label="部门"></el-table-column>

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
    <el-dialog title="新增用户" v-model="addVisible" width="40%">
      <el-form label-width="100px">
        <el-form-item label="用户名">
          <el-input v-model="addForm.username"></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="addForm.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码">
          <el-input v-model="addForm.confirmPassword" type="password"></el-input>
        </el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="addForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="addForm.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="addForm.email"></el-input>
        </el-form-item>
        <el-form-item label="头像">
          <el-upload
            action="/upload"
            list-type="picture-card"
            :on-success="handleAvatarSuccess"
            :file-list="addForm.avatar ? [{ url: addForm.avatar }] : []"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="部门">
          <el-select v-model="addForm.department">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="角色">
          <el-select v-model="addForm.roles" multiple placeholder="请选择角色">
            <el-option
              v-for="role in roleOptions"
              :key="role.value"
              :label="role.label"
              :value="role.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="权限">
          <el-input v-model="addForm.permissions"></el-input>
        </el-form-item> -->
        <el-form-item label="状态">
          <el-select v-model="addForm.status">
            <el-option label="正常" value="1"></el-option>
            <el-option label="禁用" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否启用">
          <el-switch v-model="addForm.isActive"></el-switch>
        </el-form-item>
        <el-form-item label="是否锁定">
          <el-switch v-model="addForm.isLocked"></el-switch>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="addVisible = false">取消</el-button>
          <el-button type="primary" @click="saveAdd">确定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑用户" v-model="editVisible" width="40%">
      <el-form label-width="100px">
        <el-form-item label="用户名">
          <el-input v-model="editForm.username" disabled></el-input>
        </el-form-item>
        <el-form-item label="密码">
          <el-input v-model="editForm.password" type="password"></el-input>
        </el-form-item>
        <el-form-item label="确认密码">
          <el-input v-model="editForm.confirmPassword" type="password"></el-input>
        </el-form-item>
        <el-form-item label="昵称">
          <el-input v-model="editForm.name"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="editForm.phone"></el-input>
        </el-form-item>
        <el-form-item label="邮箱">
          <el-input v-model="editForm.email"></el-input>
        </el-form-item>
        <el-form-item label="头像">
          <el-upload
            action="/upload"
            list-type="picture-card"
            :on-success="handleAvatarSuccess"
            :file-list="editForm.avatar ? [{ url: editForm.avatar }] : []"
          >
            <i class="el-icon-plus"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="部门">
          <el-select v-model="editForm.department">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="角色">
          <el-select v-model="editForm.roles" multiple placeholder="请选择角色">
            <el-option
              v-for="role in roleOptions"
              :key="role.value"
              :label="role.label"
              :value="role.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <!-- <el-form-item label="权限">
          <el-input v-model="editForm.permissions"></el-input>
        </el-form-item> -->
        <el-form-item label="状态">
          <el-select v-model="editForm.status">
            <el-option label="正常" value="1"></el-option>
            <el-option label="禁用" value="0"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="是否启用">
          <el-switch v-model="editForm.isActive"></el-switch>
        </el-form-item>
        <el-form-item label="是否锁定">
          <el-switch v-model="editForm.isLocked"></el-switch>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="editVisible = false">取消</el-button>
          <el-button type="primary" @click="saveEdit">确定</el-button>
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
import { getUserList, addUser, updateUser } from '~/api/user'
import { UserDTO } from '~/types/user'
import { useDepartment } from '@/hooks/useDepartment'
import { useTeam } from '@/hooks/useTeam'

const { departments, fetchDepartments } = useDepartment()
const { teams, fetchTeams } = useTeam()
const roleOptions = [
  { value: 'ROLE_ADMIN', label: '超级管理员' },
  { value: 'ROLE_MANAGER', label: '管理员' },
  { value: 'ROLE_VIP', label: 'VIP' },
  { value: 'ROLE_USER', label: '普通用户' },
  { value: 'ROLE_DEV', label: '开发用户' },
  { value: 'ROLE_TEST', label: '测试用户' },
  { value: 'ROLE_GUEST', label: '游客' }
]
const query = reactive({
  name: '',
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<UserDTO[]>([])
const pageTotal = ref(0)
const userStore = useUserStore()
const addVisible = ref(false)
let addForm: UserDTO = reactive({
  username: 'testuser1',
  password: 'password',
  confirmPassword: 'password',
  name: '测试昵称1',
  phone: '13911113333',
  email: 'test1@gmail.com',
  avatar: '',
  department: '',
  roles: [],
  permissions: [],
  status: 1,
  isActive: true,
  isLocked: false
})
// 新增用户
const handleAdd = async () => {
  try {
    await fetchDepartments()
    await fetchTeams()
    addVisible.value = true
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
  }
}
const getMaxPageIndex = () => {
  if (pageTotal.value === 0) {
    return 1
  }

  const maxPageIndex = Math.ceil((pageTotal.value + 1) / query.pageSize)
  return maxPageIndex > 0 ? maxPageIndex : 1
}

// 保存新增
const saveAdd = async () => {
  // comfirm password
  if (addForm.password !== addForm.confirmPassword) {
    ElMessage.error('密码不一致')
    return
  }

  addVisible.value = false
  let errorMessage = ''
  try {
    const res = await addUser(addForm)
    if (res.code === 200) {
      ElMessage.success('新增成功')
      query.pageIndex = getMaxPageIndex()
      getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '新增失败')
  }
}

const editVisible = ref(false)
let editForm: UserDTO = reactive({
  username: '',
  name: '',
  phone: '',
  email: '',
  avatar: '',
  department: '',
  roles: [],
  permissions: [],
  status: 1,
  isActive: true,
  isLocked: false
})

let idx: number = -1
const handleEdit = async (index: number, row: any) => {
  idx = index
  try {
    await fetchDepartments()
    await fetchTeams()
    Object.assign(editForm, row) // 将选中行的数据赋值到编辑表单
    editVisible.value = true
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
  }
}

const saveEdit = async () => {
  // comfirm password
  if (editForm.password !== editForm.confirmPassword) {
    ElMessage.error('密码不一致')
    return
  }

  editVisible.value = false
  try {
    const res = await updateUser(editForm)
    if (res.code === 200) {
      ElMessage.success('修改成功')
      getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '修改失败')
  }
}

// 获取表格数据
const getData = async () => {
  try {
    const res = await getUserList({
      username: query.name,
      pageIndex: query.pageIndex,
      pageSize: query.pageSize
    })

    if (res.code === 200) {
      console.log('#### res.data.items', res.data.items)

      tableData.value = res.data.items
      pageTotal.value = res.data.total
    } else {
      console.log('#### res.code', res.code)
      console.log('#### res.message', res.message)
      console.log('#### res.data', res.data)
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
  }
}
onMounted(() => {
  const pageIndex = localStorage.getItem('AMSCurentUserManagementPageIndex')
  if (pageIndex) {
    query.pageIndex = Number(pageIndex)
  }
  getData()
  fetchDepartments()
  fetchTeams()
})
const handleClear = () => {
  query.name = ''
  query.pageIndex = 1
  getData()
}

// 搜索操作
const handleSearch = async () => {
  query.pageIndex = 1
  try {
    await getData()
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
  }
}
// 分页导航
const handlePageChange = async (val: number) => {
  query.pageIndex = val
  localStorage.setItem('AMSCurentUserManagementPageIndex', val.toString())
  try {
    await getData()
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
  }
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

const handleAvatarSuccess = (response: any, file: any) => {
  if (response.code === 200) {
    addForm.avatar = response.data.url
    ElMessage.success('上传成功')
  } else {
    ElMessage.error('上传失败')
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
