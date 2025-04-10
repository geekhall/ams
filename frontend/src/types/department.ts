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
export interface DepartmentListResponse {
  code: number
  message: string
  data: Department[]
}
