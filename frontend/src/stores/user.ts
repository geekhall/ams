// 调用顺序：Vue组件 -> Pinia存储模块(store/user.ts) -> API模块(api/user.ts) -> Axios
import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { UserDTO, UserRole, User, AuthResponse, PermissionType } from '@/types/user'
import { userLogin, getUserInfo, userLogout } from '@/api/user'
import { ElMessage } from 'element-plus'
import loki from '~/api/loki'
import { getRolePermissions } from '@/utils/permission'
import { ApiResponse } from "@/types/index";

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
  const userInfo = ref<UserDTO>({
    id: "0",
    username: '',
    roles: [],
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
  const hasPermission = computed(() => (permission: PermissionType | PermissionType[]) => {
    if (!userInfo.value) return false
    if (userInfo.value.roles.includes(UserRole.ADMIN)) return true
    if (Array.isArray(permission)) {
      return permission.some(p => userInfo.value.permissions.includes(p))
    }
    return userInfo.value.permissions.includes(permission)
  })

  // actions
  async function loginAction(username: string, password: string) {
    try {
      const response = await userLogin({ username, password })
      if (response.code === 200 && response.token) {
        token.value = response.token
        localStorage.setItem('token', response.token)
        localStorage.setItem('username', username)
        setAuthData(response)
        await fetchUserInfo(username)
        return true
      }
      ElMessage.error(response.message || '登录失败')
      return false
    } catch (error) {
      console.error('Login error:', error)
      ElMessage.error(error instanceof Error ? error.message : '登录失败')
      return false
    }
  }

  // 用户注册
  const register = async (newUser: User) => {
    await loki.post('/user/register', newUser)
    user.value = { username: newUser.username, rememberPassword: newUser.password }
  }

  const setAuthData = (data: AuthResponse) => {
    console.log('data in setAuthData ::::: ', data)
    if (data.code === 200 && data.token) {
      token.value = data.token
      if (token.value) {
        localStorage.setItem('token', token.value)
        localStorage.setItem('username', data.user.username)
      }
      user.value = { username: data.user.username }
      return { success: true, message: data.message }
    } else {
      // 处理无效 token 情况
      localStorage.removeItem('token')
      localStorage.removeItem('username')
      return { success: false, message: data.message }
    }
  }

  const setRememberPassword = (password: string) => {
    if (user.value) {
      user.value.rememberPassword = password
    }
  }

  // 初始化时从本地存储中加载认证数据
  const initialize = async () => {
    const storedToken = localStorage.getItem('token')
    const storedUsername = localStorage.getItem('username')
    if (storedToken && storedUsername) {
      token.value = storedToken
      await fetchUserInfo(storedUsername)
    }
  }

  async function fetchUserInfo(username: string) {
    try {
      const response: ApiResponse<UserDTO> = await getUserInfo(username)
      console.log('获取用户信息响应:', response)
      userInfo.value = response.data
      console.log('设置用户信息:', userInfo.value)
      console.log('用户角色:', userInfo.value.roles)
      console.log('用户权限:', userInfo.value.permissions)
      return true
    } catch (error) {
      console.error('Error fetching user info:', error)
      ElMessage.error(error instanceof Error ? error.message : '获取用户信息失败')
      return false
    }
  }

  async function logoutAction() {
    try {
      await userLogout()
    } catch (error) {
      console.error('Logout error:', error)
      ElMessage.error(error instanceof Error ? error.message : '登出失败')
    } finally {
      // 清除用户状态
      token.value = null
      userInfo.value = {
        id: "0",
        username: '',
        roles: [],
        permissions: []
      }
      localStorage.removeItem('token')
    }
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
    hasPermission,

    // actions
    loginAction,
    fetchUserInfo,
    logoutAction,

    register,
    setAuthData,
    setRememberPassword,
    initialize,
    // getUserList,
  }
})
