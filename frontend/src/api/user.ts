import loki from "./loki";

/**
 * 用户注册
 */
export const userRegister = async (params: any) => {
  return await loki.request({
    url: "/api/auth/register",
    method: "post",
    data: params,
  });
};

/**
 * 用户登录
 */
export const userLogin = async (params: any) => {
  return await loki.request({
    url: "/api/auth/login",
    method: "post",
    data: params,
  });
};

/**
 * 用户退出登录
 */
export const userLogout = async () => {
  return await loki.request({
    url: "/api/auth/logout",
    method: "post",
  });
};

/**
 * 获取当前用户
 */
export const getCurrentUser = async () => {
  return await loki.request({
    url: "/api/user/current",
    method: "get",
  });
};

/**
 * 获取当前用户信息
 */
export const getUserInfo = async () => {
  return await loki.request({
    url: "/api/user/info",
    method: "get",
  });
};
/**
 * 获取用户列表
 */
export const getUserList = async (username: any) => {
  return await loki.request({
    url: "/api/user/list",
    method: "post",
    params: {
      username,
    },
  });
};

/**
 * 删除用户
 */
export const deleteUser = async (id: string) => {
  return await loki.request({
    url: `/api/user/${id}`,
    method: "delete",
    data: id,
    headers: {
      "Content-Type": "application/json",
    }
  });
};
