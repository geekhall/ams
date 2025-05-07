import { AxiosRequestConfig } from "axios";
import loki from "./loki";
import { Role, RoleListResponse } from "~/types/role";
// 获取团队列表
export const getRoleList = async (): Promise<RoleListResponse> => {
  return await loki.request({
    url: "/role/list",
    method: "POST",
  } as AxiosRequestConfig);
};
