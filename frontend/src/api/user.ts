import loki from "./loki";
import { UserListResponse, UserDTO, AuthResponse } from "@/types/user";
import { ApiResponse } from "@/types/index";

// 用户注册
export const userRegister = async (params: any) => {
  return await loki.request({
    url: "/user/register",
    method: "POST",
    data: params,
  });
};

// 用户登录
export const userLogin = async (credentials: { username: string; password: string }): Promise<AuthResponse> => {

  const response: AuthResponse = await loki.request({
    url: "/user/login",
    method: "POST",
    data: credentials,
  });

  return response;
};


// 获取当前用户信息
export const getUserInfo = async (username: string): Promise<ApiResponse<UserDTO>> => {
  const response: ApiResponse<UserDTO> = await loki.request({
    url: "/user/info",
    method: "POST",
    data: { username },
  });
  return response;
};

// 用户退出登录
export const userLogout = async (): Promise<ApiResponse<void>> => {

  const response = await loki.request({
    url: "/user/logout",
    method: "POST",
  });
  return response.data;
};

// 获取当前用户
export const getCurrentUser = async () => {
  return await loki.request({
    url: "/api/user/current",
    method: "GET",
  });
};

// 获取用户列表(支持分页和按用户名搜索)
export const getUserList = async (
  params?: {
    username?: string;
    pageIndex: number;
    pageSize: number;
  }
): Promise<UserListResponse> => {
  const response = await loki.request({
    url: "/user/list",
    method: "POST",
    data: params || {},
  });
  return response.data;
};

// 添加用户
export const addUser = async (user: UserDTO): Promise<ApiResponse<UserDTO>> => {
  const response = await loki.request({
    url: "/user/add",
    method: "POST",
    data: user
  });
  return response.data;
};

// 更新用户
export const updateUser = async (user: UserDTO): Promise<ApiResponse<UserDTO>> => {
  const response = await loki.request({
    url: `/user/update`,
    method: "POST",
    data: user,
  });
  return response.data;
};

// 删除用户
export const deleteUser = async (id: string): Promise<ApiResponse<void>> => {
  const response = await loki.request({
    url: `/user/delete/${id}`,
    method: "DELETE",
    data: id,
    headers: {
      "Content-Type": "application/json",
    }
  });
  return response.data;
};

// 搜索用户（用于自动完成）
export const searchUsers = async (query: string): Promise<UserListResponse> => {
  const response = await loki.request({
    url: "/user/search",
    method: "POST",
    data: {
      query,
      pageIndex: 1,
      pageSize: 10
    }
  });
  return response.data;
};
