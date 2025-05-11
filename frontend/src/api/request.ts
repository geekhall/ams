// Axios 请求拦截器和响应拦截器
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> API模块(api/loki.ts) -> Axios

import axios, { AxiosInstance, AxiosRequestConfig, InternalAxiosRequestConfig, AxiosResponse } from 'axios';
import { useAuthStore } from '@/stores/auth';
import router from '~/router';
// axios.defaults.baseURL = '/api'; // 设置默认请求地址
// const API_URL = import.meta.env.VITE_API_BASE_URL || "http://localhost:4000/api"
const API_URL = "/api"

interface RequestConfig extends AxiosRequestConfig {
  skipAuth?: boolean; // 是否跳过认证
  retry?: number; // 重试次数
}

interface ResponseData<T> {
  code: number;
  message: string;
  data: T;
}

class Loki {
  private instance: AxiosInstance;
  private retryDelay: number = 1000;
  private maxRetries: number = 3;

  constructor(config: AxiosRequestConfig) {
    this.instance = axios.create(config);
    this.setupInterceptors();
  }

  private setupInterceptors() {
    // 请求拦截器
    this.instance.interceptors.request.use(
      (config: InternalAxiosRequestConfig) => {
        const conf = config as InternalAxiosRequestConfig & RequestConfig;

        if (!conf.skipAuth) {
          const authStore = useAuthStore();

          if (authStore.token) {
            conf.headers.Authorization = `Bearer ${authStore.token}`;
          }
        }
        return conf;
      },
      (error) => {
        console.log("####### http.ts interceptors.request error #######");
        return Promise.reject(error);
      }
    );

    // 响应拦截器
    this.instance.interceptors.response.use(
      (response) => {
        const { data } = response.data;
        console.log("####### http.ts interceptors.response #######");
        console.log("response.data :::::: " + response.data);
        return response.data;
      },
      async (error) => {
        const config = error.config as RequestConfig;

        // 实现请求重试
        if (config.retry === undefined || config.retry < this.maxRetries) {
          config.retry = config.retry ? config.retry + 1 : 1;
          await new Promise(resolve => setTimeout(resolve, this.retryDelay));
          return this.instance(config);
        }

        this.handleError(error);
        return Promise.reject(error);
      }
    );
  }

  private handleError(error: any) {
    const authStore = useAuthStore();
    const errorMap: Record<number, string> = {
      400: '请求错误',
      401: '未授权，请登录',
      403: '拒绝访问',
      404: '请求地址出错',
      408: '请求超时',
      500: '服务器内部错误',
      502: '网关错误',
      503: '服务不可用',
      504: '网关超时'
    };

    if (error?.response?.status === 401) {
      authStore.logout();
      router.push('/login');
    }

    const status = error?.response?.status;
    error.message = errorMap[status] || '请求失败，请稍后再试';
  }

  public async request<T = any>(config: RequestConfig): Promise<ResponseData<T>> {
    try {
      return await this.instance.request(config);
    } catch (error) {
      return Promise.reject(error);
    }
  }
}

export const loki = new Loki({
  baseURL: API_URL,
  timeout: 5000,
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json',
  }
});
