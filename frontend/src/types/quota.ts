import { ApiResponse } from "."

export interface QuotaDTO {
  year: number
  departmentName: string
  quota: number
}

export interface Quota extends QuotaDTO {
  id: string
}

export type QuotaListResponse = ApiResponse<{
  items: Quota[]
  count: number
  total: number
}>
