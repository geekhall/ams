import { ApiResponse } from "."

export interface Role {
  id: string
  name: string
  description: string
  code?: string
  sort?: number
  version: number
}

export type RoleListResponse = ApiResponse<Role[]>
