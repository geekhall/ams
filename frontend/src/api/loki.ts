// Axios 请求拦截器和响应拦截器
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> API模块(api/loki.ts) -> Axios

import axios from 'axios';
import { useAuthStore } from '~/store/auth';
const API_URL = "http://localhost:4000/api"

// 创建 axios 全局实例
const loki = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL || API_URL,
  timeout: 5000,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json',
  }
});

// Request interceptor
// 请求拦截器：在请求发送之前拦截，自动添加 token
loki.interceptors.request.use(
  (config) => {
    // Do something before request is sent
    // console.log("####### http.ts interceptors.request #######");

    const authStore = useAuthStore();
    // console.log('authStore.token', authStore.token);

    if (authStore.token) {
      config.headers.Authorization = `Bearer ${authStore.token}`;
    }
    return config;
  },
  (error) => {
    // Do something with request error
    console.log("####### http.ts interceptors.request error #######");
    return Promise.reject(error);
  }
);

// 响应拦截器：在响应之后拦截，统一处理错误信息，处理Token过期
loki.interceptors.response.use(
  (response) => {
    // 状态码范围为2xx时，调用此函数
    // Do something with response data
    // console.log("####### http.ts interceptors.response #######");
    // console.log("response.data :::::: " + response.data);
    const { data } = response.data;
    // TODO : 未登录跳转到登录页
    // console.log(" data ", data);
    // if (data.code === 40010) {
    //   console.log('未登录跳转到登录页');
    //   if (
    //     !response.request.responseURL.includes('/api/auth/login') &&
    //     !window.location.pathname.includes('/login')
    //   ) {
    //     window.location.href = '/user/login?redirect=${window.location.href}';
    //   }
    // }
    return response.data;
  },
  (error) => {
    // 状态码范围为非2xx时，调用此函数
    const authStore = useAuthStore();
    if (error?.response) {
      switch (error.response.status) {
        case 400:
          error.message = '请求错误';
          break;
        case 401:
          error.message = '未授权，请登录';
          authStore.logout();
          // router.push('/login');
          break;
        case 403:
          error.message = '拒绝访问';
          break;
        case 404:
          error.message = `请求地址出错: ${error.response.config.url}`;
          break;
        case 408:
          error.message = '请求超时';
          break;
        case 500:
          error.message = '服务器内部错误';
          break;
        case 501:
          error.message = '服务未实现';
          break;
        case 502:
          error.message = '网关错误';
          break;
        case 503:
          error.message = '服务不可用';
          break;
        case 504:
          error.message = '网关超时';
          break;
        case 505:
          error.message = 'HTTP版本不受支持';
          break;
        default:
          error.message = '请求失败，请稍后再试';
          break;
      }
      const message = error.response?.data?.message || error.message;
      console.log(error.message);
      return Promise.reject(new Error(message));
    } else {
      if (error.message.includes('timeout')) {
        error.message = '请求超时';
      }
      if (error.message.includes('Network Error')) {
        error.message = '网络错误';
      }
      const message = error.response?.data?.message || error.message;
      console.log(error.message);
      return Promise.reject(new Error(message));
    }
  }
);

export default loki;
