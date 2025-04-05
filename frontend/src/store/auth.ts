// Pinia存储模块
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> 服务模块(services/auth-service.ts) -> API模块(api/loki.ts) -> Axios
import { defineStore } from 'pinia'
import { User, AuthState, AuthResponse } from '~/models/auth'
import axios from 'axios'
import loki from '~/api/loki'
export const useAuthStore = defineStore('auth', {
  state: (): AuthState => ({
    token: localStorage.getItem('token') || null,
    user: null,
  }),
  getters: {
    isAuthenticated: (state): boolean => !!state.token,
    getToken: (state): string | null => state.token,
    username: (state): string | null => state.user?.username || null,
    // desc: (state): string | null => state.user?.desc || null,
    rememberedPassword: (state): string | null => state.user?.rememberPassword || null,
    isLoggedIn(): boolean {
      return this.token !== null
    },
    getUser(): User | null {
      return this.user
    }
  },
  actions: {
    async login(credentials: User) {
      console.log('credentials in authStore ::::: ', credentials);
      const response: AuthResponse = await loki.post("/auth/login", credentials);
      console.log('response in authStore ::::: ', response);
      this.setAuthData(response);
    },

    // 用户注册
    async register(user: User) {
      await loki.post("/auth/register", user);
      this.$state.user = { username: user.username, rememberPassword: user.password }
    },

    //设置认证数据
    setAuthData(data: AuthResponse) {
      console.log('data in setAuthData ::::: ', data);
      console.log('data.code in setAuthData ::::: ', data.code);
      console.log('data.code === 200 in setAuthData ::::: ', data.code === 200);

      if (data.code === 200) {
        console.log('data.token in setAuthData ::::: ', data.token);

        this.$state.token = data.token
        console.log('this.token in setAuthData ::::: ', this.$state.token);


        if (this.$state.token) {
          localStorage.setItem('token', this.$state.token)
        }
        this.user = { username: data.user.username }
        console.log('this.user in setAuthData ::::: ', this.user);

        // axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`
        return { success: true, message: data.message }
      } else {
        return { success: false, message: data.message }
      }
    },

    // 设置记住的用户密码
    setRememberPassword(password: string) {
      if (this.$state.user) {
        this.$state.user.rememberPassword = password
      }
    },

    // 退出登录
    logout() {
      this.$state.token = null
      this.$state.user = null
      localStorage.removeItem('token')
      delete axios.defaults.headers.common['Authorization']
    },

    // 初始化时从本地存储中加载认证数据
    initialize() {
      const token = localStorage.getItem('token')
      console.log('token', token)
      if (token) {
        this.$state.token = token
      }
    }
  }
})

