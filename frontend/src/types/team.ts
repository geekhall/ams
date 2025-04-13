import { ApiResponse } from "."

export interface Team {
  id: string
  name: string
  code: string
  description: string
  parentId: string
  level: number
  sort: number
  status: string
}
export type TeamListResponse = ApiResponse<{
  items: Team[]
}>
