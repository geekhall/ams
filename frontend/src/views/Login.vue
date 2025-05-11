<template>
  <div id="loginPage" class="login-container">
    <div class="login-content">
      <div class="login-left">
        <div class="brand-section">
          <h1 class="brand-title">AMS</h1>
          <p class="brand-subtitle">资产管理系统</p>
          <div class="brand-description">
            <p>高效 · 智能 · 安全</p>
            <p>让资产管理更简单</p>
          </div>
        </div>
      </div>
      <div class="login-right">
        <div class="login-form-container">
          <h2 class="welcome-text">欢迎回来</h2>
          <p class="login-subtitle">请登录您的账号</p>
          <el-form
            :model="param"
            :rules="rules"
            ref="loginForm"
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
            <el-form-item prop="password">
              <el-input
                type="password"
                placeholder="密码"
                v-model="param.password"
                @keyup.enter="handleLogin()"
                show-password
                :prefix-icon="Lock"
                class="custom-input"
              />
            </el-form-item>
            <div class="form-options">
              <el-checkbox v-model="param.rememberMe">记住密码</el-checkbox>
              <a href="#" class="forgot-password">忘记密码？</a>
            </div>
            <div class="login-btn">
              <el-button type="primary" @click="handleLogin" :loading="loading" class="submit-btn">
                {{ loading ? '登录中...' : '登录' }}
              </el-button>
            </div>
            <div class="register-link">
              <span>还没有账号？</span>
              <router-link to="/register" class="register-btn">立即注册</router-link>
            </div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { useTagsStore } from '../stores/tags'
import { usePermissionStore } from '../stores/permission'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import type { FormInstance, FormRules } from 'element-plus'
import { Lock, User as UserIcon } from '@element-plus/icons-vue'
import { useAuthStore } from '@/stores/auth'

const loading = ref(false)
const authStore = useAuthStore()
const router = useRouter()
const param = reactive({
  username: authStore.username,
  password: authStore.rememberedPassword,
  rememberMe: false
})
const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }]
}
const loginForm = ref<FormInstance>()
const permission = usePermissionStore()
const login = ref<FormInstance>()

onMounted(() => {
  if (authStore.isLoggedIn) {
    console.log('login success onMounted')
    router.push('/dashboard')
  }
})

const handleLogin = async () => {
  console.log(' ##### Login.vue handleLogin ##### ')
  if (!loginForm.value) return
  console.log(loginForm.value)
  await loginForm.value.validate(async (valid: boolean) => {
    if (valid) {
      console.log(' ##### Login.vue handleLogin valid ok ##### ')
      const user = {
        username: param.username || '',
        password: param.password || ''
      }
      try {
        loading.value = true
        const response = await authStore.login(user)
        router.push('/dashboard')
      } catch (error) {
        console.log('login error 001')
        console.log(error)
        ElMessage.error('登录失败，请检查用户名和密码')
        loading.value = false
      }
    } else {
      console.log('login error 003')
      ElMessage.error('登录失败，验证未通过')
      loading.value = false
    }
  })
}

const tags = useTagsStore()
tags.clearTags()
</script>

<style scoped>
.login-container {
  position: relative;
  width: 100%;
  height: 100vh;
  background: linear-gradient(135deg, #1a237e, #0d47a1);
  display: flex;
  justify-content: center;
  align-items: center;
  overflow: hidden;
}

.login-container::before {
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

.login-content {
  display: flex;
  width: 900px;
  height: 600px;
  background: rgba(255, 255, 255, 0.95);
  border-radius: 20px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
  overflow: hidden;
  backdrop-filter: blur(10px);
}

.login-left {
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

.login-left::before {
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

.login-right {
  flex: 1;
  padding: 40px;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.login-form-container {
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

.login-subtitle {
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

.forgot-password {
  color: #1a237e;
  text-decoration: none;
  font-size: 14px;
  transition: color 0.3s ease;
}

.forgot-password:hover {
  color: #0d47a1;
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

.register-link {
  text-align: center;
  margin-top: 20px;
  color: #666;
}

.register-btn {
  color: #1a237e;
  text-decoration: none;
  font-weight: 600;
  margin-left: 5px;
  transition: color 0.3s ease;
}

.register-btn:hover {
  color: #0d47a1;
}

@media (max-width: 768px) {
  .login-content {
    width: 100%;
    height: 100%;
    border-radius: 0;
    flex-direction: column;
  }

  .login-left {
    display: none;
  }

  .login-right {
    padding: 20px;
  }
}
</style>
