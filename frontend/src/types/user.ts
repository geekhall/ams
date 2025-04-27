import { ApiResponse } from '.';

export interface BaseUser {
  username: string;
  password?: string;
}

export interface User extends BaseUser {
  name: string;
  email?: string;
  sex?: number;
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
