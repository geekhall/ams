import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Quota, QuotaDTO, QuotaListResponse } from "~/types/quota";


// 获取部门额度列表（支持分页和按名称查询）
export const getQuotaList = async (
  params?: { pageIndex?: number; pageSize?: number; name?: string; year?: number }
): Promise<QuotaListResponse> => {
  return await loki.request({
    url: "/quota/list",
    method: "POST",
    data: params || {}, // 如果没有参数，传递空对象
  } as AxiosRequestConfig);
};
// 添加部门额度
export const addQuota = async (
  quota: QuotaDTO
): Promise<QuotaListResponse> => {
  return await loki.request({
    url: "/quota/create",
    method: "POST",
    data: {
      ...quota,
    },
  } as AxiosRequestConfig);
};

// 更新部门额度信息
export const updateQuota = async (
  quota: Quota
): Promise<QuotaListResponse> => {
  return await loki.request({
    url: "/quota/update",
    method: "POST",
    data: {
      ...quota,
    },
  } as AxiosRequestConfig);
};
// 按照部门额度ID删除部门额度
export const deleteQuotaById = async (
  id: string
): Promise<QuotaListResponse> => {
  return await loki.request({
    url: "/quota/delete/" + id,
    method: "DELETE",
  } as AxiosRequestConfig);
};
// 按照部门额度ID获取部门额度信息
export const getQuotaById = async (
  id: string
): Promise<QuotaListResponse> => {
  return await loki.request({
    url: "/quota/get",
    method: "POST",
    data: {
      id,
    },
  } as AxiosRequestConfig);
};
