<template>
  <div id="registerPage" class="register-container">
    <div class="register-content">
      <div class="register-left">
        <div class="brand-section">
          <h1 class="brand-title">AMS</h1>
          <p class="brand-subtitle">资产管理系统</p>
          <div class="brand-description">
            <p>加入我们</p>
            <p>开启智能资产管理之旅</p>
          </div>
        </div>
      </div>
      <div class="register-right">
        <div class="register-form-container">
          <h2 class="welcome-text">创建账号</h2>
          <p class="register-subtitle">请填写以下信息完成注册</p>
          <el-form
            :model="param"
            :rules="rules"
            ref="registerForm"
            label-width="0px"
            class="ms-content"
          >
            <el-form-item prop="username">
              <el-input
                v-model="param.username"
                placeholder="用户名"
                :prefix-icon="UserIcon"
                class="custom-input"
              />
            </el-form-item>
            <el-form-item prop="email">
              <el-input
                v-model="param.email"
                placeholder="邮箱"
                :prefix-icon="EmailIcon"
                class="custom-input"
              />
            </el-form-item>
            <el-form-item prop="password">
              <el-input
                type="password"
                placeholder="密码"
                v-model="param.password"
                :prefix-icon="Lock"
                class="custom-input"
              />
            </el-form-item>
            <el-form-item prop="confirm">
              <el-input
                type="password"
                placeholder="确认密码"
                v-model="param.confirm"
                :prefix-icon="Lock"
                class="custom-input"
              />
            </el-form-item>
            <el-form-item prop="phone">
              <el-input v-model="param.phone" placeholder="手机号码" class="custom-input">
                <template #prefix>
                  <el-icon><Phone /></el-icon>
                </template>
              </el-input>
            </el-form-item>
            <div class="form-options">
              <el-checkbox v-model="param.remember">记住密码</el-checkbox>
            </div>
            <div class="register-btn">
              <el-button
                type="primary"
                @click="handleRegister"
                :loading="loading"
                class="submit-btn"
              >
                {{ loading ? '注册中...' : '注册' }}
              </el-button>
            </div>
            <div class="login-link">
              <span>已有账号？</span>
              <router-link to="/login" class="login-btn">立即登录</router-link>
            </div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useTagsStore } from '../stores/tags'
import { usePermissionStore } from '../stores/permission'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import type { FormInstance, FormRules } from 'element-plus'
import {
  Loading,
  Lock,
  User as UserIcon,
  Message as EmailIcon,
  Phone
} from '@element-plus/icons-vue'
import { User, RegisterInfo } from '~/types/auth'
import { useUserStore } from '@/stores/user'

const permission = usePermissionStore()
const registerForm = ref<FormInstance>()

const router = useRouter()
const validatePassword = (rule: any, value: string, callback: any) => {
  if (value === '') {
    ElMessage.error('请输入密码')
  } else if (value.length < 6) {
    ElMessage.error('密码长度不能小于6位')
  } else {
    callback()
  }
}

const validateConfirmPassword = (rule: any, value: string, callback: any) => {
  if (value === '') {
    ElMessage.error('请再次输入密码')
  } else if (value !== param.password) {
    ElMessage.error('两次输入密码不一致!')
  } else {
    callback()
  }
}

const param = reactive<RegisterInfo>({
  username: 'user10',
  email: 'user10@gmail.com',
  password: 'password',
  confirm: 'password',
  phone: '13900010001',
  chapta: '',
  smsChapta: '',
  idCard: '',
  remember: true
})

const rules: FormRules = {
  username: [
    {
      required: true,
      message: '请输入用户名',
      trigger: 'blur'
    }
  ],
  password: [
    { required: true, message: '请输入密码', trigger: 'blur' },
    { validator: validatePassword, trigger: 'blur' }
  ],
  confirm: [
    { required: true, message: '请再次输入密码', trigger: 'blur' },
    { validator: validateConfirmPassword, trigger: 'blur' }
  ],
  email: [
    {
      required: true,
      message: '请输入邮箱',
      trigger: 'blur'
    },
    {
      type: 'email',
      message: '请输入正确的邮箱地址',
      trigger: ['blur', 'change']
    }
  ],
  phone: [
    {
      required: true,
      message: '请输入电话号码',
      trigger: 'blur'
    },
    {
      pattern: /^1[3456789]\d{9}$/,
      message: '请输入正确的电话号码',
      trigger: ['blur', 'change']
    }
  ],
  chapta: [
    {
      required: true,
      message: '请输入验证码',
      trigger: 'blur'
    }
  ]
}
const loading = ref(false)
const message = ref('')
const userStore = useUserStore()

const handleRegister = async () => {
  console.log(' ##### Register.vue handleRegister ##### ')
  if (!registerForm.value) return
  console.log(registerForm.value)

  let user: User = {
    username: param.username,
    email: param.email,
    password: param.password
  }
  await registerForm.value.validate(async (valid: boolean) => {
    if (valid) {
      console.log(' ##### Register.vue handleRegister valid ok ##### ')
      try {
        loading.value = true
        const response = await userStore.register(user)
        // 将保存的密码自动填充到登录表单
        if (param.remember) {
          userStore.setRememberPassword(param.password)
        }

        ElMessage.success('注册成功')
        loading.value = false
        router.push('/login')
      } catch (error) {
        ElMessage.error(error instanceof Error ? error.message : '注册失败')
        loading.value = false
      }
    } else {
      console.log('register error 003')
      ElMessage.error('注册失败，验证未通过')
      loading.value = false
    }
  })
}

const tags = useTagsStore()
tags.clearTags()
</script>

<style scoped>
.register-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background: linear-gradient(135deg, #1a237e, #0d47a1);
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.register-container::before {
  content: '';
  position: absolute;
  width: 200%;
  height: 200%;
  background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, rgba(255, 255, 255, 0) 60%);
  animation: rotate 20s linear infinite;
}

@keyframes rotate {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

.register-content {
  display: flex;
  width: 900px;
  height: 700px;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  backdrop-filter: blur(10px);
}

.register-left {
  flex: 1;
  background: linear-gradient(135deg, #1a237e, #0d47a1);
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  color: white;
  position: relative;
  overflow: hidden;
}

.register-left::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><circle cx="50" cy="50" r="40" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="2"/></svg>')
    center/cover;
  opacity: 0.1;
}

.brand-section {
  position: relative;
  z-index: 1;
}

.brand-title {
  font-size: 48px;
  font-weight: 700;
  margin: 0;
  letter-spacing: 2px;
}

.brand-subtitle {
  font-size: 24px;
  margin: 10px 0 30px;
  opacity: 0.9;
}

.brand-description {
  font-size: 16px;
  line-height: 1.6;
  opacity: 0.8;
}

.register-right {
  flex: 1;
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.register-form-container {
  max-width: 360px;
  margin: 0 auto;
  width: 100%;
}

.welcome-text {
  font-size: 28px;
  font-weight: 600;
  color: #1a237e;
  margin: 0 0 10px;
}

.register-subtitle {
  color: #666;
  margin-bottom: 30px;
}

.custom-input :deep(.el-input__wrapper) {
  padding: 12px 15px;
  border-radius: 8px;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.05);
  transition: all 0.3s ease;
}

.custom-input :deep(.el-input__wrapper:hover) {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.custom-input :deep(.el-input__wrapper.is-focus) {
  box-shadow: 0 0 0 2px rgba(26, 35, 126, 0.2);
}

.form-options {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.submit-btn {
  width: 100%;
  padding: 12px;
  font-size: 16px;
  border-radius: 8px;
  background: linear-gradient(135deg, #1a237e, #0d47a1);
  border: none;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.submit-btn:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(26, 35, 126, 0.3);
}

.login-link {
  text-align: center;
  margin-top: 20px;
  color: #666;
}

.login-btn {
  color: #1a237e;
  text-decoration: none;
  font-weight: 600;
  margin-left: 5px;
  transition: color 0.3s ease;
}

.login-btn:hover {
  color: #0d47a1;
}

@media (max-width: 768px) {
  .register-content {
    width: 100%;
    height: 100%;
    border-radius: 0;
    flex-direction: column;
  }

  .register-left {
    display: none;
  }

  .register-right {
    padding: 20px;
  }
}
</style>
