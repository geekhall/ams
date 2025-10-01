<template>
  <div id="forgotPasswordPage" class="login-container">
    <div class="login-content">
      <div class="login-left">
        <div class="brand-section">
          <h1 class="brand-title">BMS</h1>
          <p class="brand-subtitle">预算管理系统</p>
          <div class="brand-description">
            <p>高效 · 智能 · 安全</p>
            <p>找回您的密码</p>
          </div>
        </div>
      </div>
      <div class="login-right">
        <div class="login-form-container">
          <h2 class="welcome-text">忘记密码</h2>
          <p class="login-subtitle">请输入您的邮箱地址</p>
          
          <el-form
            :model="form"
            :rules="rules"
            ref="formRef"
            label-width="0px"
            class="ms-content"
            v-loading="loading"
          >
            <!-- 步骤1: 输入邮箱 -->
            <div v-if="step === 1">
              <el-form-item prop="email">
                <el-input
                  v-model="form.email"
                  placeholder="请输入邮箱地址"
                  :prefix-icon="Message"
                  class="custom-input"
                />
              </el-form-item>
              <el-form-item prop="captcha">
                <el-input
                  v-model="form.captcha"
                  placeholder="验证码"
                  maxlength="4"
                  class="custom-input"
                >
                  <template #append>
                    <img
                      :src="captchaUrl"
                      alt="验证码"
                      @click="refreshCaptcha"
                      style="cursor: pointer; height: 36px;"
                    />
                  </template>
                </el-input>
              </el-form-item>
              <div class="login-btn">
                <el-button
                  type="primary"
                  @click="sendResetCode"
                  :loading="loading"
                  class="login-btn-submit"
                >
                  发送重置码
                </el-button>
              </div>
            </div>

            <!-- 步骤2: 输入验证码 -->
            <div v-if="step === 2">
              <el-form-item prop="resetCode">
                <el-input
                  v-model="form.resetCode"
                  placeholder="请输入邮箱验证码"
                  :prefix-icon="Key"
                  class="custom-input"
                />
              </el-form-item>
              <p class="reset-hint">
                验证码已发送至 {{ form.email }}，请查收
                <span v-if="countdown > 0">({{ countdown }}s后可重新发送)</span>
                <el-button 
                  v-else 
                  type="text" 
                  @click="sendResetCode"
                  style="padding: 0; margin-left: 8px;"
                >
                  重新发送
                </el-button>
              </p>
              <div class="login-btn">
                <el-button
                  type="primary"
                  @click="verifyResetCode"
                  :loading="loading"
                  class="login-btn-submit"
                >
                  验证
                </el-button>
              </div>
            </div>

            <!-- 步骤3: 重置密码 -->
            <div v-if="step === 3">
              <el-form-item prop="newPassword">
                <el-input
                  v-model="form.newPassword"
                  type="password"
                  placeholder="请输入新密码"
                  :prefix-icon="Lock"
                  class="custom-input"
                  show-password
                />
              </el-form-item>
              <el-form-item prop="confirmPassword">
                <el-input
                  v-model="form.confirmPassword"
                  type="password"
                  placeholder="请确认新密码"
                  :prefix-icon="Lock"
                  class="custom-input"
                  show-password
                />
              </el-form-item>
              <div class="login-btn">
                <el-button
                  type="primary"
                  @click="resetPassword"
                  :loading="loading"
                  class="login-btn-submit"
                >
                  重置密码
                </el-button>
              </div>
            </div>

            <div class="login-tips">
              <el-button type="text" @click="$router.push('/login')">
                返回登录
              </el-button>
            </div>
          </el-form>
        </div>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { Message, Key, Lock } from '@element-plus/icons-vue'
import { sendPasswordResetCode, verifyPasswordResetCode, resetUserPassword } from '@/api/auth'

const router = useRouter()
const loading = ref(false)
const step = ref(1) // 1: 输入邮箱, 2: 输入验证码, 3: 重置密码
const countdown = ref(0)
const captchaUrl = ref('/api/captcha')
const formRef = ref()

const form = reactive({
  email: '',
  captcha: '',
  resetCode: '',
  newPassword: '',
  confirmPassword: '',
  resetToken: ''
})

const rules = {
  email: [
    { required: true, message: '请输入邮箱地址', trigger: 'blur' },
    { type: 'email', message: '请输入正确的邮箱格式', trigger: 'blur' }
  ],
  captcha: [
    { required: true, message: '请输入验证码', trigger: 'blur' }
  ],
  resetCode: [
    { required: true, message: '请输入邮箱验证码', trigger: 'blur' }
  ],
  newPassword: [
    { required: true, message: '请输入新密码', trigger: 'blur' },
    { min: 6, message: '密码长度不能少于6位', trigger: 'blur' }
  ],
  confirmPassword: [
    { required: true, message: '请确认密码', trigger: 'blur' },
    {
      validator: (rule: any, value: any, callback: any) => {
        if (value !== form.newPassword) {
          callback(new Error('两次输入密码不一致'))
        } else {
          callback()
        }
      },
      trigger: 'blur'
    }
  ]
}

// 刷新验证码
const refreshCaptcha = () => {
  captchaUrl.value = `/api/captcha?${Date.now()}`
}

// 发送重置码
const sendResetCode = async () => {
  if (!formRef.value) return
  
  try {
    await formRef.value.validateField(['email', 'captcha'])
    loading.value = true
    
    const res = await sendPasswordResetCode({
      email: form.email,
      captcha: form.captcha
    })
    
    if (res.code === 200) {
      ElMessage.success('验证码已发送到您的邮箱')
      step.value = 2
      startCountdown()
      refreshCaptcha()
    } else {
      ElMessage.error(res.message)
      refreshCaptcha()
    }
  } catch (error) {
    ElMessage.error('发送失败，请检查输入信息')
    refreshCaptcha()
  } finally {
    loading.value = false
  }
}

// 验证重置码
const verifyResetCode = async () => {
  if (!formRef.value) return
  
  try {
    await formRef.value.validateField('resetCode')
    loading.value = true
    
    const res = await verifyPasswordResetCode({
      email: form.email,
      resetCode: form.resetCode
    })
    
    if (res.code === 200) {
      form.resetToken = res.data.resetToken
      step.value = 3
      ElMessage.success('验证成功，请设置新密码')
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error('验证失败')
  } finally {
    loading.value = false
  }
}

// 重置密码
const resetPassword = async () => {
  if (!formRef.value) return
  
  try {
    await formRef.value.validateField(['newPassword', 'confirmPassword'])
    loading.value = true
    
    const res = await resetUserPassword({
      resetToken: form.resetToken,
      newPassword: form.newPassword
    })
    
    if (res.code === 200) {
      ElMessage.success('密码重置成功，请重新登录')
      router.push('/login')
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error('重置失败')
  } finally {
    loading.value = false
  }
}

// 倒计时
const startCountdown = () => {
  countdown.value = 60
  const timer = setInterval(() => {
    countdown.value--
    if (countdown.value <= 0) {
      clearInterval(timer)
    }
  }, 1000)
}

onMounted(() => {
  refreshCaptcha()
})
</script>

<style scoped>
.login-container {
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

.login-content {
  display: flex;
  width: 900px;
  min-height: 500px;
  background: white;
  border-radius: 10px;
  box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
  overflow: hidden;
}

.login-left {
  flex: 1;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  color: white;
  text-align: center;
}

.brand-section h1 {
  font-size: 48px;
  margin-bottom: 16px;
  font-weight: bold;
}

.brand-subtitle {
  font-size: 18px;
  margin-bottom: 24px;
  opacity: 0.9;
}

.brand-description p {
  font-size: 14px;
  margin: 8px 0;
  opacity: 0.8;
}

.login-right {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 40px;
}

.login-form-container {
  width: 100%;
  max-width: 320px;
}

.welcome-text {
  text-align: center;
  margin-bottom: 8px;
  color: #303133;
  font-size: 24px;
  font-weight: 500;
}

.login-subtitle {
  text-align: center;
  margin-bottom: 32px;
  color: #909399;
  font-size: 14px;
}

.custom-input {
  margin-bottom: 20px;
}

.login-btn {
  margin-bottom: 20px;
}

.login-btn-submit {
  width: 100%;
  height: 42px;
  font-size: 16px;
}

.login-tips {
  text-align: center;
}

.reset-hint {
  font-size: 12px;
  color: #909399;
  margin-bottom: 20px;
  text-align: center;
  line-height: 1.5;
}
</style>