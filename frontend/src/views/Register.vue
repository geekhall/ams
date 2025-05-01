<template>
  <div id="registerPage" class="register-wrap">
    <div class="ms-register">
      <div class="ms-title">AMS资产管理系统</div>
      <el-form
        :model="param"
        :rules="rules"
        ref="registerForm"
        label-width="0px"
        class="ms-content"
      >
        <el-form-item prop="username">
          <el-input v-model="param.username" placeholder="请输入用户名">
            <template #prepend>
              <el-button tabindex="-1"
                ><el-icon><UserIcon /> </el-icon
              ></el-button>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item prop="email">
          <el-input v-model="param.email" placeholder="请输入Email">
            <template #prepend>
              <el-button tabindex="-1"
                ><el-icon><EmailIcon /> </el-icon
              ></el-button>
            </template>
          </el-input>
        </el-form-item>
        <el-form-item prop="password">
          <el-input type="password" placeholder="请输入密码" v-model="param.password">
            <template #prepend>
              <el-button tabindex="-1">
                <el-icon><Lock /> </el-icon>
              </el-button>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item prop="password">
          <el-input type="password" placeholder="请确认密码" v-model="param.confirm">
            <template #prepend>
              <el-button tabindex="-1">
                <el-icon><Lock /> </el-icon>
              </el-button>
            </template>
          </el-input>
        </el-form-item>

        <el-form-item>
          <el-checkbox v-model="param.remember">记住密码</el-checkbox>
        </el-form-item>

        <div class="register-btn">
          <el-button type="primary" @click="handleRegister">注册</el-button>
        </div>
        <p class="register-tips">已有账号？<router-link to="/login">立即登录</router-link></p>
      </el-form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive } from 'vue'
import { useTagsStore } from '../store/tags'
import { usePermissionStore } from '../store/permission'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import type { FormInstance, FormRules } from 'element-plus'
import { Loading, Lock, User as UserIcon, Message as EmailIcon } from '@element-plus/icons-vue'
import { User, RegisterInfo } from '~/types/auth'
import { useAuthStore } from '~/store/auth'

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
const authStore = useAuthStore()

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
        const response = await authStore.register(user)
        // 将保存的密码自动填充到登录表单
        if (param.remember) {
          authStore.setRememberPassword(param.password)
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
.register-wrap {
  position: relative;
  width: 100%;
  /* height: 100%; */
  height: 100%;
  background: linear-gradient(to right, #c056f9, #6b56f9);
  /* background-image: url(../assets/img/login-bg.jpg); */
  background-size: 100%;
  background-color: rebeccapurple;
}
.ms-title {
  width: 100%;
  line-height: 50px;
  text-align: center;
  font-size: 20px;
  color: #fff;
  border-bottom: 1px solid #ddd;
}
.ms-register {
  position: absolute;
  left: 50%;
  top: 50%;
  width: 350px;
  margin: -190px 0 0 -175px;
  border-radius: 5px;
  background: rgba(255, 255, 255, 0.3);
  overflow: hidden;
}
.ms-content {
  padding: 30px 30px;
}
.register-btn {
  text-align: center;
}
.register-btn button {
  width: 100%;
  height: 36px;
  margin-bottom: 10px;
}
.register-tips {
  font-size: 12px;
  line-height: 30px;
  color: #fff;
}
.chapta-container {
  display: flex;
  justify-content: space-between;
}
</style>
