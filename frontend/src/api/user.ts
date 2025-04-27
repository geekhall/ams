import loki from "./loki";
import { UserListResponse, UserDTO } from "@/types/user";
import { ApiResponse } from "@/types/index";

// 用户注册
export const userRegister = async (params: any) => {
  return await loki.request({
    url: "/auth/register",
    method: "POST",
    data: params,
  });
};


// 用户登录
export const userLogin = async (params: any) => {
  return await loki.request({
    url: "/auth/login",
    method: "POST",
    data: params,
  });
};

// 用户退出登录
export const userLogout = async () => {
  return await loki.request({
    url: "/auth/logout",
    method: "POST",
  });
};

// 获取当前用户
export const getCurrentUser = async () => {
  return await loki.request({
    url: "/api/user/current",
    method: "GET",
  });
};

// 获取当前用户信息
export const getUserInfo = async () => {
  return await loki.request({
    url: "/user/info",
    method: "get",
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
  return await loki.request({
    url: "/user/list",
    method: "POST",
    data: params || {}, // 如果没有参数，传递空对象
  });
};

// 添加用户
export const addUser = async (user: UserDTO): Promise<ApiResponse<UserDTO>> => {
  return await loki.request({
    url: "/auth/register",
    method: "POST",
    data: user,
    headers: {
      "Content-Type": "application/json",
    },
  });
};

// 更新用户
export const updateUser = async (user: UserDTO): Promise<ApiResponse> => {
  try {
    const response = await axios.put(`/api/users/${user.id}`, user);
    return response.data;
  } catch (error) {
    throw new Error(error.response?.data?.message || '更新用户失败');
  }
};


// 删除用户
export const deleteUser = async (id: string) => {
  return await loki.request({
    url: `/user/${id}`,
    method: "DELETE",
    data: id,
    headers: {
      "Content-Type": "application/json",
    }
  });
};
