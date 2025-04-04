// Axios 全局配置(废止，迁移至utils/http.ts)
// 调用顺序：Vue组件 -> Pinia存储模块(store/auth.ts) -> 服务模块(services/auth-service.ts) -> API模块(api/loki.ts) -> Axios
import { AxiosRequestConfig } from 'axios'
import request from './loki'
import { MethodType } from '~/utils/types'

export const getLokiData = async (api_url: string, api_method: MethodType) => {
  return await request({
    url: api_url,
    method: api_method
  } as AxiosRequestConfig)
}

export const asyncLogin = async (username: string, password: string) => {
  return await request({
    url: '/api/auth/login',
    method: MethodType.POST,
    data: {
      username,
      password
    }
  } as AxiosRequestConfig);
}
