<template>
  <div id="profilePage" class="content-container">
    <el-row :gutter="24">
      <el-col :xs="24" :sm="24" :md="8" :lg="8" :xl="8">
        <el-card shadow="hover" class="profile-card">
          <div class="profile-header">
            <div class="avatar-container" @click="showAvatarDialog">
              <el-avatar :size="120" :src="userInfo.avatar" class="user-avatar" />
              <div class="avatar-mask">
                <el-icon><Camera /></el-icon>
                <span>更换头像</span>
              </div>
            </div>
            <h2 class="username">{{ userInfo.username }}</h2>
            <p class="bio">{{ userInfo.bio || '这个人很懒，什么都没留下' }}</p>
            <div class="user-tags">
              <el-tag size="small" effect="plain" class="user-tag">{{ userInfo.role }}</el-tag>
              <el-tag size="small" effect="plain" type="success" class="user-tag">{{
                userInfo.department
              }}</el-tag>
              <el-tag size="small" effect="plain" type="warning" class="user-tag">{{
                userInfo.status
              }}</el-tag>
            </div>
          </div>
          <el-divider class="custom-divider" />
          <div class="profile-stats">
            <div class="stat-item">
              <span class="stat-value">{{ userInfo.postCount }}</span>
              <span class="stat-label">发布</span>
            </div>
            <div class="stat-item">
              <span class="stat-value">{{ userInfo.followers }}</span>
              <span class="stat-label">关注者</span>
            </div>
            <div class="stat-item">
              <span class="stat-value">{{ userInfo.following }}</span>
              <span class="stat-label">关注</span>
            </div>
          </div>
        </el-card>

        <el-card shadow="hover" class="activity-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">最近活动</span>
              <el-button type="primary" link>查看全部</el-button>
            </div>
          </template>
          <el-timeline>
            <el-timeline-item
              v-for="activity in recentActivities"
              :key="activity.id"
              :type="activity.type"
              :timestamp="activity.time"
              :hollow="activity.hollow"
            >
              {{ activity.content }}
            </el-timeline-item>
          </el-timeline>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="24" :md="16" :lg="16" :xl="16">
        <el-card shadow="hover" class="settings-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">个人设置</span>
            </div>
          </template>

          <el-tabs v-model="activeTab" class="custom-tabs">
            <el-tab-pane label="基本信息" name="basic">
              <el-form
                ref="basicFormRef"
                :model="basicForm"
                :rules="basicRules"
                label-width="100px"
                class="custom-form"
              >
                <el-form-item label="用户名" prop="username">
                  <el-input v-model="basicForm.username" disabled class="custom-input" />
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                  <el-input v-model="basicForm.name" class="custom-input" />
                </el-form-item>
                <el-form-item label="角色" prop="role">
                  <el-select
                    v-model="basicForm.role"
                    placeholder="请选择角色"
                    class="custom-select"
                  >
                    <el-option label="管理员" value="admin" />
                    <el-option label="普通用户" value="user" />
                    <el-option label="访客" value="guest" />
                  </el-select>
                </el-form-item>
                <el-form-item label="部门" prop="department">
                  <el-select
                    v-model="basicForm.department"
                    placeholder="请选择部门"
                    class="custom-select"
                  >
                    <el-option label="信息科技部" value="tech" />
                    <el-option label="公司业务部" value="marketing" />
                    <el-option label="人力资源部" value="hr" />
                    <el-option label="计划财务部" value="finance" />
                  </el-select>
                </el-form-item>
                <el-form-item label="昵称" prop="nickname">
                  <el-input v-model="basicForm.nickname" class="custom-input" />
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                  <el-input v-model="basicForm.email" class="custom-input" />
                </el-form-item>
                <el-form-item label="手机号" prop="phone">
                  <el-input v-model="basicForm.phone" class="custom-input" />
                </el-form-item>
                <el-form-item label="个人简介" prop="bio">
                  <el-input
                    v-model="basicForm.bio"
                    type="textarea"
                    :rows="3"
                    placeholder="介绍一下自己吧"
                    class="custom-textarea"
                  />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" class="submit-btn" @click="handleBasicSubmit"
                    >保存修改</el-button
                  >
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="安全设置" name="security">
              <el-form
                ref="passwordFormRef"
                :model="passwordForm"
                :rules="passwordRules"
                label-width="100px"
                class="custom-form"
              >
                <el-form-item label="当前密码" prop="oldPassword">
                  <el-input
                    v-model="passwordForm.oldPassword"
                    type="password"
                    show-password
                    class="custom-input"
                  />
                </el-form-item>
                <el-form-item label="新密码" prop="newPassword">
                  <el-input
                    v-model="passwordForm.newPassword"
                    type="password"
                    show-password
                    class="custom-input"
                  />
                </el-form-item>
                <el-form-item label="确认密码" prop="confirmPassword">
                  <el-input
                    v-model="passwordForm.confirmPassword"
                    type="password"
                    show-password
                    class="custom-input"
                  />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" class="submit-btn" @click="handlePasswordSubmit"
                    >修改密码</el-button
                  >
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="通知设置" name="notification">
              <el-form label-width="100px" class="custom-form">
                <el-form-item label="系统通知">
                  <el-switch v-model="notificationSettings.system" class="custom-switch" />
                </el-form-item>
                <el-form-item label="消息提醒">
                  <el-switch v-model="notificationSettings.message" class="custom-switch" />
                </el-form-item>
                <el-form-item label="邮件通知">
                  <el-switch v-model="notificationSettings.email" class="custom-switch" />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" class="submit-btn" @click="handleNotificationSubmit"
                    >保存设置</el-button
                  >
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>

    <!-- 待办事项卡片 -->
    <el-row :gutter="24" class="todo-section">
      <el-col :span="24">
        <el-card shadow="hover" class="todo-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">待办事项</span>
              <div class="todo-header-actions">
                <el-input
                  v-model="newTodo"
                  placeholder="添加新的待办事项"
                  class="todo-input"
                  @keyup.enter="addTodo"
                >
                  <template #append>
                    <el-button @click="addTodo">
                      <el-icon><Plus /></el-icon>
                    </el-button>
                  </template>
                </el-input>
              </div>
            </div>
          </template>
          <el-tabs v-model="todoTab" class="todo-tabs">
            <el-tab-pane label="全部" name="all">
              <el-checkbox-group v-model="checkedTodos" class="todo-list">
                <div v-for="todo in filteredTodos" :key="todo.id" class="todo-item">
                  <el-checkbox :label="todo.id">
                    <span :class="{ 'todo-done': todo.done }">{{ todo.content }}</span>
                  </el-checkbox>
                  <div class="todo-actions">
                    <el-dropdown
                      @command="(command: 'success' | 'warning' | 'danger' | 'info') => updateTodoPriority(todo.id, command)"
                    >
                      <el-tag size="small" :type="todo.priority" effect="plain">
                        {{ todo.priorityText }}
                      </el-tag>
                      <template #dropdown>
                        <el-dropdown-menu>
                          <el-dropdown-item command="danger">紧急</el-dropdown-item>
                          <el-dropdown-item command="warning">重要</el-dropdown-item>
                          <el-dropdown-item command="info">普通</el-dropdown-item>
                        </el-dropdown-menu>
                      </template>
                    </el-dropdown>
                    <el-button type="danger" link @click="deleteTodo(todo.id)">
                      <el-icon><Delete /></el-icon>
                    </el-button>
                  </div>
                </div>
              </el-checkbox-group>
            </el-tab-pane>
            <el-tab-pane label="待完成" name="active">
              <el-checkbox-group v-model="checkedTodos" class="todo-list">
                <div v-for="todo in activeTodos" :key="todo.id" class="todo-item">
                  <el-checkbox :label="todo.id">
                    <span>{{ todo.content }}</span>
                  </el-checkbox>
                  <div class="todo-actions">
                    <el-dropdown
                      @command="(command: 'success' | 'warning' | 'danger' | 'info') => updateTodoPriority(todo.id, command)"
                    >
                      <el-tag size="small" :type="todo.priority" effect="plain">
                        {{ todo.priorityText }}
                      </el-tag>
                      <template #dropdown>
                        <el-dropdown-menu>
                          <el-dropdown-item command="danger">紧急</el-dropdown-item>
                          <el-dropdown-item command="warning">重要</el-dropdown-item>
                          <el-dropdown-item command="info">普通</el-dropdown-item>
                        </el-dropdown-menu>
                      </template>
                    </el-dropdown>
                    <el-button type="danger" link @click="deleteTodo(todo.id)">
                      <el-icon><Delete /></el-icon>
                    </el-button>
                  </div>
                </div>
              </el-checkbox-group>
            </el-tab-pane>
            <el-tab-pane label="已完成" name="completed">
              <el-checkbox-group v-model="checkedTodos" class="todo-list">
                <div v-for="todo in completedTodos" :key="todo.id" class="todo-item">
                  <el-checkbox :label="todo.id">
                    <span class="todo-done">{{ todo.content }}</span>
                  </el-checkbox>
                  <div class="todo-actions">
                    <el-dropdown
                      @command="(command: 'success' | 'warning' | 'danger' | 'info') => updateTodoPriority(todo.id, command)"
                    >
                      <el-tag size="small" :type="todo.priority" effect="plain">
                        {{ todo.priorityText }}
                      </el-tag>
                      <template #dropdown>
                        <el-dropdown-menu>
                          <el-dropdown-item command="danger">紧急</el-dropdown-item>
                          <el-dropdown-item command="warning">重要</el-dropdown-item>
                          <el-dropdown-item command="info">普通</el-dropdown-item>
                        </el-dropdown-menu>
                      </template>
                    </el-dropdown>
                    <el-button type="danger" link @click="deleteTodo(todo.id)">
                      <el-icon><Delete /></el-icon>
                    </el-button>
                  </div>
                </div>
              </el-checkbox-group>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>

    <el-dialog
      v-model="avatarDialogVisible"
      title="更换头像"
      width="500px"
      destroy-on-close
      class="avatar-dialog"
    >
      <div class="cropper-container">
        <vue-cropper
          ref="cropperRef"
          :src="cropperImage"
          :aspect-ratio="1"
          :view-mode="1"
          :auto-crop-area="1"
          :background="true"
          :rotatable="false"
          :zoomable="true"
          :guides="true"
          :highlight="true"
          :crop-box-movable="true"
          :crop-box-resizable="true"
          :toggle-drag-mode-on-dblclick="false"
        />
      </div>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="avatarDialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleImageSelect">
            选择图片
            <input class="hidden-input" type="file" accept="image/*" @change="handleImageSelect" />
          </el-button>
          <el-button type="success" @click="handleCropAvatar">确认</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, watch } from 'vue'
import { ElMessage, FormInstance } from 'element-plus'
import { Camera, Plus, Delete } from '@element-plus/icons-vue'
import VueCropper from 'vue-cropperjs'
import 'cropperjs/dist/cropper.css'
import { useUserStore } from '@/stores/user'
import defaultAvatar from '../assets/img/avatar.png'

const userStore = useUserStore()

// 用户信息
const userInfo = reactive({
  username: userStore.username,
  avatar: defaultAvatar,
  bio: '',
  postCount: 0,
  followers: 0,
  following: 0,
  role: '系统管理员',
  department: '信息科技部',
  status: '在线'
})

// 表单引用
const basicFormRef = ref<FormInstance>()
const passwordFormRef = ref<FormInstance>()

// 当前激活的标签页
const activeTab = ref('basic')

// 基本信息表单
const basicForm = reactive({
  username: userInfo.username,
  name: '',
  role: '',
  department: '',
  nickname: '',
  email: '',
  phone: '',
  bio: ''
})

// 密码表单
const passwordForm = reactive({
  oldPassword: '',
  newPassword: '',
  confirmPassword: ''
})

// 通知设置
const notificationSettings = reactive({
  system: true,
  message: true,
  email: false
})

// 表单验证规则
const basicRules = {
  name: [
    { required: true, message: '请输入姓名', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  role: [{ required: true, message: '请选择角色', trigger: 'change' }],
  department: [{ required: true, message: '请选择部门', trigger: 'change' }],
  nickname: [
    { required: true, message: '请输入昵称', trigger: 'blur' },
    { min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur' }
  ],
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱地址', trigger: 'blur' }
  ],
  phone: [{ pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号码', trigger: 'blur' }]
}

const passwordRules = {
  oldPassword: [
    { required: true, message: '请输入当前密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
  ],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能小于6位', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    {
      validator: (rule: any, value: string, callback: Function) => {
        if (value !== passwordForm.newPassword) {
          callback(new Error('两次输入的密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ]
}

// 头像裁剪相关
const avatarDialogVisible = ref(false)
const cropperRef = ref()
const cropperImage = ref('')

// 显示头像裁剪对话框
const showAvatarDialog = () => {
  avatarDialogVisible.value = true
  cropperImage.value = userInfo.avatar
}

// 处理图片选择
const handleImageSelect = (e: Event) => {
  const file = (e.target as HTMLInputElement).files?.[0]
  if (!file) return

  if (!file.type.includes('image/')) {
    ElMessage.error('请选择图片文件')
    return
  }

  const reader = new FileReader()
  reader.onload = (e) => {
    cropperImage.value = e.target?.result as string
    cropperRef.value?.replace(e.target?.result as string)
  }
  reader.readAsDataURL(file)
}

// 处理头像裁剪
const handleCropAvatar = () => {
  if (!cropperRef.value) return

  const canvas = cropperRef.value.getCroppedCanvas({
    width: 200,
    height: 200
  })

  if (canvas) {
    userInfo.avatar = canvas.toDataURL('image/jpeg')
    avatarDialogVisible.value = false
    ElMessage.success('头像更新成功')
  }
}

// 处理基本信息提交
const handleBasicSubmit = async () => {
  if (!basicFormRef.value) return

  await basicFormRef.value.validate((valid) => {
    if (valid) {
      // TODO: 调用API保存基本信息
      ElMessage.success('基本信息更新成功')
    }
  })
}

// 处理密码修改
const handlePasswordSubmit = async () => {
  if (!passwordFormRef.value) return

  await passwordFormRef.value.validate((valid) => {
    if (valid) {
      // TODO: 调用API修改密码
      ElMessage.success('密码修改成功')
      passwordForm.oldPassword = ''
      passwordForm.newPassword = ''
      passwordForm.confirmPassword = ''
    }
  })
}

// 处理通知设置提交
const handleNotificationSubmit = () => {
  // TODO: 调用API保存通知设置
  ElMessage.success('通知设置已更新')
}

// 最近活动数据
const recentActivities = reactive([
  {
    id: 1,
    content: '更新了个人资料',
    time: '2024-03-20 10:30',
    type: 'primary',
    hollow: false
  },
  {
    id: 2,
    content: '完成了资产盘点任务',
    time: '2024-03-19 15:45',
    type: 'success',
    hollow: false
  },
  {
    id: 3,
    content: '添加了新的待办事项',
    time: '2024-03-18 09:15',
    type: 'warning',
    hollow: true
  },
  {
    id: 4,
    content: '修改了密码',
    time: '2024-03-17 14:20',
    type: 'info',
    hollow: true
  }
])

// 待办事项相关
const todoTab = ref('all')
const newTodo = ref('')
const checkedTodos = ref<number[]>([])

interface Todo {
  id: string
  content: string
  done: boolean
  priority: 'success' | 'warning' | 'danger' | 'info'
  priorityText: string
}

const todos = reactive<Todo[]>([
  {
    id: 1,
    content: '审核资产采购申请',
    done: false,
    priority: 'danger',
    priorityText: '紧急'
  },
  {
    id: 2,
    content: '更新资产分类信息',
    done: false,
    priority: 'warning',
    priorityText: '重要'
  },
  {
    id: 3,
    content: '处理资产调拨申请',
    done: true,
    priority: 'info',
    priorityText: '普通'
  }
])

const filteredTodos = computed(() => todos)
const activeTodos = computed(() => todos.filter((todo) => !todo.done))
const completedTodos = computed(() => todos.filter((todo) => todo.done))

// 添加待办事项
const addTodo = () => {
  if (!newTodo.value.trim()) return

  const todo: Todo = {
    id: Date.now(),
    content: newTodo.value,
    done: false,
    priority: 'info',
    priorityText: '普通'
  }

  todos.unshift(todo)
  newTodo.value = ''
  ElMessage.success('添加成功')
}

// 删除待办事项
const deleteTodo = (id: string) => {
  const index = todos.findIndex((todo) => todo.id === id)
  if (index > -1) {
    todos.splice(index, 1)
    ElMessage.success('删除成功')
  }
}

// 切换待办事项状态
const toggleTodoStatus = (id: string) => {
  const todo = todos.find((todo) => todo.id === id)
  if (todo) {
    todo.done = !todo.done
    ElMessage.success(todo.done ? '已完成' : '已取消完成')
  }
}

// 更新待办事项优先级
const updateTodoPriority = (id: string, priority: 'success' | 'warning' | 'danger' | 'info') => {
  const todo = todos.find((todo) => todo.id === id)
  if (todo) {
    todo.priority = priority
    todo.priorityText = {
      success: '普通',
      warning: '重要',
      danger: '紧急',
      info: '普通'
    }[priority]
    ElMessage.success('优先级已更新')
  }
}

// 监听待办事项状态变化
watch(checkedTodos, (newVal) => {
  todos.forEach((todo) => {
    if (newVal.includes(todo.id) !== todo.done) {
      toggleTodoStatus(todo.id)
    }
  })
})

// 初始化数据
onMounted(() => {
  // TODO: 从API获取用户信息
  // 这里使用模拟数据
  userInfo.bio = '信息科技部'
  userInfo.postCount = 42
  userInfo.followers = 128
  userInfo.following = 256

  basicForm.name = '张三'
  basicForm.role = 'user'
  basicForm.department = 'tech'
  basicForm.nickname = '测试用户'
  basicForm.email = 'test@example.com'
  basicForm.phone = '13800138000'
  basicForm.bio = userInfo.bio
})
</script>

<style lang="less" scoped>
.content-container {
  padding: 24px;
  background-color: var(--el-bg-color-page);
  min-height: calc(100vh - 60px);
}

.profile-card {
  transition: all 0.3s ease;
  border-radius: 8px;
  overflow: hidden;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
  }

  .profile-header {
    text-align: center;
    padding: 32px 0;
  }

  .avatar-container {
    position: relative;
    width: 120px;
    height: 120px;
    margin: 0 auto;
    cursor: pointer;
    border-radius: 50%;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);

    .user-avatar {
      border: 4px solid #fff;
      transition: all 0.3s ease;
    }

    .avatar-mask {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.5);
      border-radius: 50%;
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      color: #fff;
      opacity: 0;
      transition: all 0.3s ease;

      .el-icon {
        font-size: 24px;
        margin-bottom: 8px;
      }

      span {
        font-size: 14px;
      }
    }

    &:hover {
      .avatar-mask {
        opacity: 1;
      }

      .user-avatar {
        transform: scale(1.1);
      }
    }
  }

  .username {
    margin: 20px 0 8px;
    font-size: 24px;
    font-weight: 600;
    color: var(--el-text-color-primary);
  }

  .bio {
    color: var(--el-text-color-secondary);
    font-size: 14px;
    line-height: 1.6;
    padding: 0 20px;
  }
}

.custom-divider {
  margin: 0;
  border-color: var(--el-border-color-lighter);
}

.profile-stats {
  display: flex;
  justify-content: space-around;
  padding: 24px 0;
  background-color: var(--el-bg-color);

  .stat-item {
    text-align: center;
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-2px);
    }

    .stat-value {
      display: block;
      font-size: 24px;
      font-weight: 600;
      color: var(--el-color-primary);
      margin-bottom: 4px;
    }

    .stat-label {
      font-size: 14px;
      color: var(--el-text-color-secondary);
    }
  }
}

.settings-card {
  border-radius: 8px;
  transition: all 0.3s ease;

  &:hover {
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
  }

  .card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 20px;
    border-bottom: 1px solid var(--el-border-color-lighter);

    .header-title {
      font-size: 18px;
      font-weight: 600;
      color: var(--el-text-color-primary);
    }
  }
}

.custom-tabs {
  :deep(.el-tabs__nav-wrap::after) {
    height: 1px;
    background-color: var(--el-border-color-lighter);
  }

  :deep(.el-tabs__item) {
    font-size: 15px;
    padding: 0 24px;
    height: 48px;
    line-height: 48px;
    transition: all 0.3s ease;

    &.is-active {
      font-weight: 600;
    }
  }
}

.custom-form {
  padding: 24px 0;

  :deep(.el-form-item) {
    margin-bottom: 24px;

    &:last-child {
      margin-bottom: 0;
    }
  }

  :deep(.el-form-item__label) {
    font-weight: 500;
    color: var(--el-text-color-primary);
  }
}

.custom-input,
.custom-select,
.custom-textarea {
  width: 100%;
  max-width: 400px;
  transition: all 0.3s ease;

  &:hover,
  &:focus {
    transform: translateY(-1px);
  }
}

.custom-textarea {
  :deep(.el-textarea__inner) {
    min-height: 100px;
    resize: vertical;
  }
}

.custom-switch {
  :deep(.el-switch__core) {
    border-radius: 12px;
  }
}

.submit-btn {
  padding: 12px 32px;
  font-size: 15px;
  border-radius: 6px;
  transition: all 0.3s ease;

  &:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  }
}

.avatar-dialog {
  :deep(.el-dialog__header) {
    padding: 20px;
    margin: 0;
    border-bottom: 1px solid var(--el-border-color-lighter);
  }

  :deep(.el-dialog__body) {
    padding: 24px;
  }

  :deep(.el-dialog__footer) {
    padding: 16px 20px;
    border-top: 1px solid var(--el-border-color-lighter);
  }
}

.cropper-container {
  height: 400px;
  background: var(--el-bg-color-page);
  border-radius: 4px;
  overflow: hidden;
}

.hidden-input {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  opacity: 0;
  cursor: pointer;
}

.user-tags {
  margin-top: 16px;
  display: flex;
  justify-content: center;
  gap: 8px;

  .user-tag {
    padding: 0 12px;
    height: 24px;
    line-height: 24px;
    border-radius: 12px;
  }
}

.activity-card {
  margin-top: 24px;
  border-radius: 8px;
  transition: all 0.3s ease;

  &:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
  }

  :deep(.el-timeline-item__content) {
    color: var(--el-text-color-regular);
    font-size: 14px;
  }

  :deep(.el-timeline-item__timestamp) {
    color: var(--el-text-color-secondary);
    font-size: 12px;
  }
}

.todo-section {
  margin-top: 24px;
}

.todo-card {
  .card-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 16px 20px;
    border-bottom: 1px solid var(--el-border-color-lighter);

    .header-title {
      font-size: 16px;
      font-weight: 600;
      color: var(--el-text-color-primary);
    }

    .todo-header-actions {
      display: flex;
      align-items: center;
      gap: 16px;

      .todo-input {
        width: 300px;
      }
    }
  }

  .todo-tabs {
    padding: 20px;
  }

  .todo-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
  }

  .todo-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 12px;
    background-color: var(--el-bg-color-page);
    border-radius: 8px;
    transition: all 0.3s ease;

    &:hover {
      transform: translateX(4px);
      background-color: var(--el-bg-color);
    }

    .todo-done {
      text-decoration: line-through;
      color: var(--el-text-color-secondary);
    }

    .todo-actions {
      display: flex;
      align-items: center;
      gap: 12px;
    }
  }
}

@media screen and (max-width: 768px) {
  .content-container {
    padding: 16px;
  }

  .profile-card {
    margin-bottom: 24px;
  }

  .custom-form {
    padding: 16px 0;
  }

  .custom-input,
  .custom-select,
  .custom-textarea {
    max-width: 100%;
  }

  .activity-card {
    margin-top: 16px;
  }

  .todo-card {
    .card-header {
      flex-direction: column;
      align-items: flex-start;
      gap: 12px;

      .todo-header-actions {
        width: 100%;

        .todo-input {
          width: 100%;
        }
      }
    }

    .todo-item {
      flex-direction: column;
      align-items: flex-start;
      gap: 8px;

      .todo-actions {
        width: 100%;
        justify-content: space-between;
      }
    }
  }
}
</style>
