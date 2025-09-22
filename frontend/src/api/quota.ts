import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Quota, QuotaDTO, QuotaListResponse , DepartmentQuotaResponse} from "~/types/quota";


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
// 新增：根据部门名称和年份获取额度
export const getDepartmentQuota = async (
    departmentName: string,
    year: number
): Promise<DepartmentQuotaResponse> => {  // 改为单个额度的返回类型
  return await loki.request({
    url: "/quota/department",
    method: "GET",  // 注意：如果后端接口是GET，参数用params；如果是POST，用data
    params: { departmentName, year }  // 与其他GET接口保持参数传递方式一致
  } as AxiosRequestConfig);
};
