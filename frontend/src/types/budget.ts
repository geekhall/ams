import { ApiResponse } from "."

export interface BudgetDTO {
  year: number,
  name: string,
  description: string,
  budgetType: string,
  budgetCategory: string,
  inno: string,
  amount: number,
  departmentName: string,
  teamName: string,
  priority: number,
  businessPriority: string,
  businessDescription: string,
  plannedStartDate: string,
  remark: string,
  status: string,
}

export interface Budget extends BudgetDTO {
  id: string
}

export type BudgetListResponse = ApiResponse<{
  items: Budget[]
  total: number
}>

export type BudgetTypeNameResponse = ApiResponse<{
  names: string[]
}>

export interface BudgetType {
  id: string
  name: string
}

export type BudgetTypeListResponse = ApiResponse<BudgetType[]>

export type BudgetCategoryNameResponse = ApiResponse<{
  names: string[]
}>

export interface BudgetCategory {
  id: string
  name: string
}

export type BudgetCategoryListResponse = ApiResponse<BudgetCategory[]>
