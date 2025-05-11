// 调用顺序：Vue组件 -> Pinia存储模块(store/user.ts) -> API模块(api/user.ts) -> Axios
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { UserInfo, UserRole, User, AuthResponse } from '@/types/auth'
import { login, getUserInfo } from '@/api/auth'
import { ElMessage } from 'element-plus'
import loki from '~/api/loki'
import axios from 'axios'
// import { getUserList } from '~/api/user'

export const useUserStore = defineStore('user', () => {
  // state
  const name = ref<string>('')
  // const username = ref<string>('')
  const email = ref<string>('')
  const password = ref<string>('')
  const gender = ref<number>(0)
  const idCard = ref<string>('')
  const phone = ref<string>('')
  const avatar = ref<string>('')
  const age = ref<number>(0)
  const status = ref<number>(0)
  const version = ref<number>(0)
  const permissions = ref<string[]>([])
  const roles = ref<string[]>([])
  // const token = ref<string | null>(null)
  const token = ref<string | null>(localStorage.getItem('token') || null)
  const user = ref<User | null>(null)
  const userInfo = ref<UserInfo>({
    id: 0,
    username: '',
    role: UserRole.USER,
    permissions: []
  })

  // getters
  const getName = computed(() => name.value || null)
  const getUsername = computed(() => username.value)
  const getEmail = computed(() => email.value || null)
  const getPassword = computed(() => password.value || null)
  const getGender = computed(() => gender.value || null)
  const getIdCard = computed(() => idCard.value || null)
  const getPhone = computed(() => phone.value || null)
  const getAvatar = computed(() => avatar.value || null)
  const getAge = computed(() => age.value || null)
  const getStatus = computed(() => status.value || null)
  const getVersion = computed(() => version.value || null)
  const getPermissions = computed(() => permissions.value || null)
  const getRoles = computed(() => roles.value || null)
  const isAuthenticated = computed(() => !!token.value)
  const getToken = computed(() => token.value)
  const username = computed(() => user.value?.username || null)
  const rememberedPassword = computed(() => user.value?.rememberPassword || null)
  const isLoggedIn = computed(() => token.value !== null)
  const getUser = computed(() => user.value)

  // actions
  async function loginAction(username: string, password: string) {
    try {
      const res = await login(username, password)
      const response = res as unknown as { code: number; data: { token: string } }
      if (response.code === 200) {
        token.value = response.data.token
        return true
      }
      return false
    } catch (error) {
      console.error('Login error:', error)
      ElMessage.error('登录失败')
      return false
    }
  }
  const login = async (credentials: User) => {
    console.log('credentials in authStore ::::: ', credentials)
    const response: AuthResponse = await loki.post('/auth/login', credentials)
    console.log('response in authStore ::::: ', response)
    setAuthData(response)
  }
  // 用户注册
  const register = async (newUser: User) => {
    const response = await loki.post('/auth/register', newUser)
    user.value = { username: newUser.username, rememberPassword: newUser.password }
  }

  const setAuthData = (data: AuthResponse) => {
    console.log('data in setAuthData ::::: ', data)
    if (data.code === 200 && data.token) {
      token.value = data.token
      if (token.value) {
        localStorage.setItem('token', token.value)
      }
      user.value = { username: data.user.username }
      return { success: true, message: data.message }
    } else {
      // 处理无效 token 情况
      localStorage.removeItem('token')
      return { success: false, message: data.message }
    }
  }


  const setRememberPassword = (password: string) => {
    if (user.value) {
      user.value.rememberPassword = password
    }
  }

  // 初始化时从本地存储中加载认证数据
  const initialize = () => {
    const storedToken = localStorage.getItem('token')
    // console.log('token', storedToken)
    if (storedToken) {
      token.value = storedToken
    }
  }

  async function fetchUserInfo() {
    try {
      const res = await getUserInfo()
      const response = res as unknown as { code: number; data: UserInfo }
      if (response.code === 200) {
        userInfo.value = response.data
        return true
      }
      return false
    } catch (error) {
      console.error('Error fetching user info:', error)
      ElMessage.error('获取用户信息失败')
      return false
    }
  }

  function logout() {
    token.value = null
    userInfo.value = {
      id: 0,
      username: '',
      role: UserRole.USER,
      permissions: []
    }
    localStorage.removeItem('token')
    localStorage.removeItem('AMSCurrentAssetPageIndex')
    delete axios.defaults.headers.common['Authorization']
  }

  return {
    // state
    name,
    username,
    email,
    password,
    gender,
    idCard,
    phone,
    avatar,
    age,
    status,
    version,
    permissions,
    roles,
    token,
    userInfo,
    user,

    // getters
    getName,
    getUsername,
    getEmail,
    getPassword,
    getGender,
    getIdCard,
    getPhone,
    getAvatar,
    getAge,
    getStatus,
    getVersion,
    getPermissions,
    getRoles,
    isAuthenticated,
    getToken,
    rememberedPassword,
    isLoggedIn,
    getUser,

    // actions
    loginAction,
    fetchUserInfo,
    logout,
    login,
    register,
    setAuthData,
    setRememberPassword,
    initialize,
    // getUserList,
  }
})
