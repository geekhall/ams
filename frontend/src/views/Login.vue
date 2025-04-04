<template>
  <div class="login-container">
    <div class="login-form">
      <div class="ms-title">AMS资产管理系统</div>
      <el-form :model="param" :rules="rules" ref="loginForm" label-width="0px" class="ms-content">
        <el-form-item prop="username">
          <el-input v-model="param.username" placeholder="username">
            <template #prepend>
              <el-button tabindex="-1">
                <el-icon><UserIcon /></el-icon>
              </el-button>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input
            type="password"
            placeholder="password"
            v-model="param.password"
            @keyup.enter="handleLogin()"
            show-password
          >
            <template #prepend>
              <el-button tabindex="-1">
                <el-icon><Lock /></el-icon>
              </el-button>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item>
          <el-checkbox v-model="param.rememberMe">记住密码</el-checkbox>
        </el-form-item>
        <div class="login-btn">
          <el-button type="primary" @click="handleLogin">登录</el-button>
        </div>
        <p class="login-tips">
          <span>没有账号？</span> <router-link to="/register">立即注册</router-link>
        </p>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { useTagsStore } from '../store/tags'
import { usePermissionStore } from '../store/permission'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import type { FormInstance, FormRules } from 'element-plus'
import { Lock, User as UserIcon } from '@element-plus/icons-vue'
import { useAuthStore } from '~/store/auth'

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
  height: 100%;
  background: linear-gradient(270deg, #0788f1, #6b56f9);
  background-size: 400% 400%;
  animation: gradientAnimation 15s ease infinite;
}

@keyframes gradientAnimation {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}

.login-title {
  width: 100%;
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  color: #fff;
  border-bottom: 1px solid #ddd;
}
.login-form {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 350px;
  margin: -190px 0 0 -175px;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  overflow: hidden;
}
.ms-title {
  width: 100%;
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  color: #fff;
  border-bottom: 1px solid #ddd;
}
.ms-content {
  padding: 30px 30px;
}
.login-btn {
  text-align: center;
}
.login-btn button {
  width: 100%;
  height: 36px;
  margin-bottom: 10px;
}
.login-tips {
  font-size: 14px;
  line-height: 30px;
  color: #fff;
}
</style>
