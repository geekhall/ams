// Pinia存储模块
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> API模块(api/loki.ts) -> Axios
import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import { User, AuthResponse } from '~/types/auth'
import axios from 'axios'
import loki from '~/api/loki'
export const useUserStore = defineStore('auth', () => {
  // state
  const token = ref<string | null>(localStorage.getItem('token') || null)
  const user = ref<User | null>(null)

  // getters
  const isAuthenticated = computed(() => !!token.value)
  const getToken = computed(() => token.value)
  const username = computed(() => user.value?.username || null)
  const rememberedPassword = computed(() => user.value?.rememberPassword || null)
  const isLoggedIn = computed(() => token.value !== null)
  const getUser = computed(() => user.value)

  // actions
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

  const logout = () => {
    token.value = null
    user.value = null
    localStorage.removeItem('token')
    localStorage.removeItem('AMSCurrentAssetPageIndex')
    delete axios.defaults.headers.common['Authorization']
  }

  // 初始化时从本地存储中加载认证数据
  const initialize = () => {
    const storedToken = localStorage.getItem('token')
    // console.log('token', storedToken)
    if (storedToken) {
      token.value = storedToken
    }
  }

  return {
    // state
    token,
    user,

    // getters
    isAuthenticated,
    getToken,
    username,
    rememberedPassword,
    isLoggedIn,
    getUser,

    // actions
    login,
    register,
    setAuthData,
    setRememberPassword,
    logout,
    initialize,
  }
})

