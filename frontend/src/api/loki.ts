// Axios 请求拦截器和响应拦截器
// 调用顺序：Vue组件 -> Pinia存储模块(store/user.ts) -> API模块(api/loki.ts) -> Axios

import axios from 'axios';
import { useUserStore } from '@/stores/user';
import router from '~/router';
import { ElMessage } from 'element-plus';
// axios.defaults.baseURL = '/api'; // 设置默认请求地址
// const API_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:4000/api"
const API_URL = "/api"

// 创建 axios 全局实例
const loki = axios.create({
  baseURL: API_URL,
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

    const userStore = useUserStore();
    // console.log('userStore.token', userStore.token);
    // console.log("baseURL :::::: " + config.baseURL);

    if (userStore.token) {
      config.headers.Authorization = `Bearer ${userStore.token}`;
    }
    return config;
  },
  (error) => {
    // Do something with request error
    console.error('Request error:', error);
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
    //     !response.request.responseURL.includes('/api/user/login') &&
    //     !window.location.pathname.includes('/login')
    //   ) {
    //     window.location.href = '/user/login?redirect=${window.location.href}';
    //   }
    // }
    return response.data;
  },
  (error) => {
    // 状态码范围为非2xx时，调用此函数
    const userStore = useUserStore();

    // 处理错误响应
    if (error.response) {
      const { status, data } = error.response;

      switch (status) {
        case 401:
          // 未授权，清除用户信息并跳转到登录页
          userStore.logoutAction();
          router.push('/login');
          ElMessage.error('登录已过期，请重新登录');
          break;

        case 403:
          // 权限不足
          router.push('/403');
          ElMessage.error('没有权限访问该资源');
          break;

        case 404:
          ElMessage.error('请求的资源不存在');
          break;

        case 500:
          ElMessage.error('服务器内部错误');
          break;

        default:
          ElMessage.error(data?.message || '请求失败');
      }
    } else if (error.request) {
      // 请求已发出但没有收到响应
      ElMessage.error('网络错误，请检查网络连接');
    } else {
      // 请求配置出错
      ElMessage.error('请求配置错误');
    }

    return Promise.reject(error);
  }
);

export default loki;
