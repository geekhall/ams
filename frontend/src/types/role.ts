import { ApiResponse } from "."

export interface Role {
  id: number
  name: string
  description: string
  code?: string
  sort?: number
  version: number
}

export type RoleListResponse = ApiResponse<Role[]>
