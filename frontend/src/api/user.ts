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


// // 用户登录
// export const userLogin = async (params: any) => {
//   return await loki.request({
//     url: "/api/auth/login",
//     method: "POST",
//     data: params,
//   });
//
// };
// 用户登录
export const userLogin = async (params: any) => {
  try {
    // 不指定响应类型，axios 会自动推断
    const response = await loki.request({
      url: "/api/auth/login",
      method: "POST",
      data: params,
    });

    // 假设返回的数据包含 token
    const token = response?.data?.token;  // 获取返回的 token

    // 判断是否有 token
    if (token) {
      // 存储 token 到 localStorage
      localStorage.setItem('ams_token', token);
      console.log("Token 已存储");
    } else {
      console.error("登录成功，但没有返回 token");
    }

    // 返回响应
    return response;
  } catch (error) {
    console.error("登录失败", error);
    throw error;  // 将错误抛出，交由调用者处理
  }
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
  const res: UserListResponse = await loki.request({
    url: "/user/list",
    method: "POST",
    data: params || {}, // 如果没有参数，传递空对象
  });
  console.log("res", res);

  return res;

};

// 添加用户
export const addUser = async (user: UserDTO): Promise<ApiResponse<UserDTO>> => {
  return await loki.request({
    url: "/auth/register",
    method: "POST",
    data: user
  });
};

// 更新用户
export const updateUser = async (user: UserDTO): Promise<ApiResponse<UserDTO>> => {
  return await loki.request({
    url: `/user/update`,
    method: "POST",
    data: user,
    headers: {
      "Content-Type": "application/json",
    },
  });
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
