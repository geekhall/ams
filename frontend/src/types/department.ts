import { ApiResponse } from "."

export interface Department {
  id: string
  name: string
  code: string
  description: string
  parentId: string
  level: number
  sort: number
  status: string
}
export type DepartmentListResponse = ApiResponse<Department[]>
