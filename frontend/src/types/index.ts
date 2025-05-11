import axios, { AxiosResponse } from 'axios'

// API 响应接口
export interface ApiResponse<T = any> {
  code: number
  message: string
  data: T
}

// 分页请求参数
export interface PaginationParams {
  pageIndex: number
  pageSize: number
}

// 分页响应数据
export interface PaginationData<T> {
  items: T[]
  total: number
}

// 分页响应
export type PaginationResponse<T> = ApiResponse<PaginationData<T>>
