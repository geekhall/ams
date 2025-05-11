import { ApiResponse } from '.';

export interface BaseUser {
  username: string;
  password?: string;
  confirmPassword?: string;
}

export interface User extends BaseUser {
  name: string;
  email?: string;
  gender?: number;
  idCard?: string;
  phone?: string;
  avatar?: string;
  age?: number;
  status?: number;
  version?: number;
}

export interface UserDTO extends BaseUser {
  id?: string;
  name: string;
  phone?: string;
  avatar?: string;
  email?: string;
  age?: number;
  status?: number;
  gender?: string;
  address?: string;
  department?: string;
  isActive?: boolean;
  isLocked?: boolean;
  lastLoginTime?: string;
  lastLoginIp?: string;
  createTime?: string;
  updateTime?: string;
  roles: string[];
  permissions: string[];
}

export type UserListResponse = ApiResponse<{
  items: UserDTO[]
  total: number
}>;

export interface User {
  username: string;
  email?: string;
  password?: string;
  rememberPassword?: string;
  phone?: string;
  avatar?: string;
  status?: number;
}
export interface RegisterInfo {
  username: string
  email: string
  password: string
  confirm: string
  phone?: string
  smsChapta?: string
  chapta?: string
  remember?: boolean
  idCard?: string
}

export interface AuthResponse {
  code: number;
  message: string;
  token: string;
  user: {
    password: any;
    id: number;
    username: string;
    email?: string;
    avatar?: string;
  }
}

export interface AuthState {
  user: { username: string, rememberPassword?: string } | null;
  token: string | null;
}

// 用户角色枚举
export enum UserRole {
  ADMIN = 'admin',
  MANAGER = 'manager',
  USER = 'user'
}

// 用户信息接口
export interface UserInfo {
  id: number
  username: string
  role: UserRole
  permissions: string[]
}

// 路由权限配置接口
export interface RoutePermission {
  path: string
  roles: UserRole[]
}

// 路由权限配置
export const routePermissions: RoutePermission[] = [
  {
    path: '/dashboard',
    roles: [UserRole.ADMIN, UserRole.MANAGER, UserRole.USER]
  },
  {
    path: '/asset',
    roles: [UserRole.ADMIN, UserRole.MANAGER]
  },
  {
    path: '/budget',
    roles: [UserRole.ADMIN, UserRole.MANAGER]
  },
  {
    path: '/user',
    roles: [UserRole.ADMIN]
  }
]
