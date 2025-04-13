import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import {
  Budget, BudgetDTO,
  BudgetListResponse,
  BudgetTypeNameResponse,
  BudgetCategoryNameResponse,
  BudgetTypeListResponse,
  BudgetCategoryListResponse
} from "~/types/budget";


// 获取预算列表（支持分页和按名称查询）
export const getBudgetList = async (
  params?: { year?: number; pageIndex?: number; pageSize?: number; name?: string }
): Promise<BudgetListResponse> => {

  return await loki.request({
    url: "/budget/list",
    method: "POST",
    data: params || {}, // 如果没有参数，传递空对象
  } as AxiosRequestConfig);

};
// 添加预算
export const addBudget = async (
  budget: BudgetDTO
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/create",
    method: "POST",
    data: {
      ...budget,
    },
  } as AxiosRequestConfig);
};

// 更新预算信息
export const updateBudget = async (
  budget: Budget
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/update",
    method: "POST",
    data: {
      ...budget,
    },
  } as AxiosRequestConfig);
};
// 按照预算ID删除预算
export const deleteBudgetById = async (
  id: string
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
};
// 按照预算ID获取预算信息
export const getBudgetById = async (
  id: string
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/get",
    method: "POST",
    data: {
      id,
    },
  } as AxiosRequestConfig);
};

// 批量删除预算
export const deleteBudgets = async (
  ids: string[]
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/delete/batch",
    method: "POST",
    data: {
      ids,
    },
  } as AxiosRequestConfig);
};

// 批量更新预算
export const updateBudgets = async (
  budgets: Budget[]
): Promise<BudgetListResponse> => {
  return await loki.request({
    url: "/budget/update/batch",
    method: "POST",
    data: {
      budgets,
    },
  } as AxiosRequestConfig);
};

// 获取预算类型名
export const getBudgetTypeNames = async (): Promise<BudgetTypeNameResponse> => {
  return await loki.request({
    url: "/bt/names",
    method: "POST",
  } as AxiosRequestConfig);
};

// 获取预算类型列表
export const getBudgetTypeList = async (): Promise<BudgetTypeListResponse> => {
  return await loki.request({
    url: "/bt/list",
    method: "POST",
  } as AxiosRequestConfig);
};
// 获取预算性质名
export const getBudgetCategoryNames = async (): Promise<BudgetCategoryNameResponse> => {
  return await loki.request({
    url: "/bc/names",
    method: "POST",
  } as AxiosRequestConfig);
};

// 获取预算性质列表
export const getBudgetCategoryList = async (): Promise<BudgetCategoryListResponse> => {
  return await loki.request({
    url: "/bc/list",
    method: "POST",
  } as AxiosRequestConfig);
};
