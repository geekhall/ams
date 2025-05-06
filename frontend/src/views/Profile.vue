<template>
  <div id="profilePage" class="content-container">
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" class="profile-card">
          <div class="profile-header">
            <div class="avatar-container" @click="showAvatarDialog">
              <el-avatar :size="120" :src="userInfo.avatar" />
              <div class="avatar-mask">
                <el-icon><Camera /></el-icon>
                <span>更换头像</span>
              </div>
            </div>
            <h2 class="username">{{ userInfo.username }}</h2>
            <p class="bio">{{ userInfo.bio || '这个人很懒，什么都没留下' }}</p>
          </div>
          <el-divider />
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
      </el-col>
      <el-col :span="16">
        <el-card shadow="hover">
          <template #header>
            <div class="card-header">
              <span>个人设置</span>
            </div>
          </template>

          <el-tabs v-model="activeTab">
            <el-tab-pane label="基本信息" name="basic">
              <el-form
                ref="basicFormRef"
                :model="basicForm"
                :rules="basicRules"
                label-width="100px"
              >
                <el-form-item label="用户名" prop="username">
                  <el-input v-model="basicForm.username" disabled />
                </el-form-item>
                <el-form-item label="姓名" prop="name">
                  <el-input v-model="basicForm.name" />
                </el-form-item>
                <el-form-item label="角色" prop="role">
                  <el-select v-model="basicForm.role" placeholder="请选择角色">
                    <el-option label="管理员" value="admin" />
                    <el-option label="普通用户" value="user" />
                    <el-option label="访客" value="guest" />
                  </el-select>
                </el-form-item>
                <el-form-item label="部门" prop="department">
                  <el-select v-model="basicForm.department" placeholder="请选择部门">
                    <el-option label="技术部" value="tech" />
                    <el-option label="市场部" value="marketing" />
                    <el-option label="人事部" value="hr" />
                    <el-option label="财务部" value="finance" />
                  </el-select>
                </el-form-item>
                <el-form-item label="昵称" prop="nickname">
                  <el-input v-model="basicForm.nickname" />
                </el-form-item>
                <el-form-item label="邮箱" prop="email">
                  <el-input v-model="basicForm.email" />
                </el-form-item>
                <el-form-item label="手机号" prop="phone">
                  <el-input v-model="basicForm.phone" />
                </el-form-item>
                <el-form-item label="个人简介" prop="bio">
                  <el-input
                    v-model="basicForm.bio"
                    type="textarea"
                    :rows="3"
                    placeholder="介绍一下自己吧"
                  />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="handleBasicSubmit">保存修改</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="安全设置" name="security">
              <el-form
                ref="passwordFormRef"
                :model="passwordForm"
                :rules="passwordRules"
                label-width="100px"
              >
                <el-form-item label="当前密码" prop="oldPassword">
                  <el-input v-model="passwordForm.oldPassword" type="password" show-password />
                </el-form-item>
                <el-form-item label="新密码" prop="newPassword">
                  <el-input v-model="passwordForm.newPassword" type="password" show-password />
                </el-form-item>
                <el-form-item label="确认密码" prop="confirmPassword">
                  <el-input v-model="passwordForm.confirmPassword" type="password" show-password />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="handlePasswordSubmit">修改密码</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
            <el-tab-pane label="通知设置" name="notification">
              <el-form label-width="100px">
                <el-form-item label="系统通知">
                  <el-switch v-model="notificationSettings.system" />
                </el-form-item>
                <el-form-item label="消息提醒">
                  <el-switch v-model="notificationSettings.message" />
                </el-form-item>
                <el-form-item label="邮件通知">
                  <el-switch v-model="notificationSettings.email" />
                </el-form-item>
                <el-form-item>
                  <el-button type="primary" @click="handleNotificationSubmit">保存设置</el-button>
                </el-form-item>
              </el-form>
            </el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>
    </el-row>
    <el-dialog v-model="avatarDialogVisible" title="更换头像" width="500px" destroy-on-close>
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
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, FormInstance } from 'element-plus'
import { Camera } from '@element-plus/icons-vue'
import VueCropper from 'vue-cropperjs'
import 'cropperjs/dist/cropper.css'
import { useAuthStore } from '~/store/auth'
import defaultAvatar from '../assets/img/avatar.png'

const authStore = useAuthStore()

// 用户信息
const userInfo = reactive({
  username: authStore.username,
  avatar: defaultAvatar,
  bio: '',
  postCount: 0,
  followers: 0,
  following: 0
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

// 初始化数据
onMounted(() => {
  // TODO: 从API获取用户信息
  // 这里使用模拟数据
  userInfo.bio = '热爱生活，热爱编程'
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
.profile-card {
  .profile-header {
    text-align: center;
    padding: 20px 0;
  }

  .avatar-container {
    position: relative;
    width: 120px;
    height: 120px;
    margin: 0 auto;
    cursor: pointer;

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
      transition: opacity 0.3s;

      .el-icon {
        font-size: 24px;
        margin-bottom: 4px;
      }
    }

    &:hover .avatar-mask {
      opacity: 1;
    }
  }

  .username {
    margin: 16px 0 8px;
    font-size: 20px;
    font-weight: 500;
  }

  .bio {
    color: var(--el-text-color-secondary);
    font-size: 14px;
  }
}

.profile-stats {
  display: flex;
  justify-content: space-around;
  padding: 20px 0;

  .stat-item {
    text-align: center;

    .stat-value {
      display: block;
      font-size: 20px;
      font-weight: 500;
      color: var(--el-text-color-primary);
    }

    .stat-label {
      font-size: 14px;
      color: var(--el-text-color-secondary);
    }
  }
}

.cropper-container {
  height: 400px;
  background: #f5f7fa;
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

:deep(.el-tabs__content) {
  padding: 20px 0;
}
</style>
