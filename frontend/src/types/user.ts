import { ApiResponse } from '.';

export interface BaseUser {
  name?: string;
  username: string;
  password?: string;
  gender?: string;
  idCard?: string;
  phone?: string;
  avatar?: string;
  age?: number;
  email?: string;
  department?: string;
  status?: number;
  isLocked?: boolean;
  isActive?: boolean;
  lastLoginTime?: string;
  lastLoginIp?: string;
  address?: string;
  version?: number;
  createTime?: string;
  updateTime?: string;
  confirmPassword?: string;
  rememberPassword?: string;
}

export interface User extends BaseUser {
  id?: string;
}

export interface UserDTO extends BaseUser {
  id?: string;
  roles: string[];
  permissions: string[];
}

export type UserListResponse = ApiResponse<{
  items: UserDTO[]
  total: number
}>;


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
  code: number
  message: string
  token: string
  user: UserDTO
}

export interface AuthState {
  user: { username: string, rememberPassword?: string } | null;
  token: string | null;
}

// User roles enum
export enum UserRole {
  ADMIN = 'admin',
  MANAGER = 'manager',
  USER = 'user'
}

// Permission types enum
export enum PermissionType {
  // System permissions
  DASHBOARD_VIEW = 'dashboard:view',
  USER_MANAGE = 'user:manage',
  SETTING_MANAGE = 'setting:manage',

  // Asset permissions
  ASSET_VIEW = 'asset:view',
  ASSET_MANAGE = 'asset:manage',
  SYSTEM_VIEW = 'system:view',
  SYSTEM_MANAGE = 'system:manage',

  // Budget permissions
  BUDGET_BOARD_VIEW = 'budget:board:view',
  BUDGET_BOARD_MANAGE = 'budget:board:manage',
  BUDGET_DETAIL_VIEW = 'budget:detail:view',
  BUDGET_DETAIL_MANAGE = 'budget:detail:manage',
  BUDGET_QUOTA_VIEW = 'budget:quota:view',
  BUDGET_QUOTA_MANAGE = 'budget:quota:manage',

  // Message permissions
  MESSAGE_VIEW = 'message:view',
  MESSAGE_MANAGE = 'message:manage'
}

// Role-Permission mapping
export const rolePermissions: Record<UserRole, PermissionType[]> = {
  [UserRole.ADMIN]: Object.values(PermissionType),
  [UserRole.MANAGER]: [
    PermissionType.DASHBOARD_VIEW,
    PermissionType.ASSET_VIEW,
    PermissionType.ASSET_MANAGE,
    PermissionType.SYSTEM_VIEW,
    PermissionType.SYSTEM_MANAGE,
    PermissionType.BUDGET_BOARD_VIEW,
    PermissionType.BUDGET_BOARD_MANAGE,
    PermissionType.BUDGET_DETAIL_VIEW,
    PermissionType.BUDGET_DETAIL_MANAGE,
    PermissionType.BUDGET_QUOTA_VIEW,
    PermissionType.BUDGET_QUOTA_MANAGE,
    PermissionType.MESSAGE_VIEW,
    PermissionType.MESSAGE_MANAGE
  ],
  [UserRole.USER]: [
    PermissionType.DASHBOARD_VIEW,
    PermissionType.ASSET_VIEW,
    PermissionType.SYSTEM_VIEW,
    // PermissionType.BUDGET_BOARD_VIEW,
    // PermissionType.BUDGET_DETAIL_VIEW,
    // PermissionType.BUDGET_QUOTA_VIEW,
    PermissionType.MESSAGE_VIEW
  ]
}

// Route permission configuration
export interface RoutePermission {
  path: string
  permissions: PermissionType[]
}

// Route permissions mapping
export const routePermissions: RoutePermission[] = [
  {
    path: '/dashboard',
    permissions: [PermissionType.DASHBOARD_VIEW]
  },
  {
    path: '/asset',
    permissions: [PermissionType.ASSET_VIEW, PermissionType.ASSET_MANAGE]
  },
  {
    path: '/system',
    permissions: [PermissionType.SYSTEM_VIEW, PermissionType.SYSTEM_MANAGE]
  },
  {
    path: '/budget',
    permissions: [PermissionType.BUDGET_VIEW, PermissionType.BUDGET_MANAGE]
  },
  {
    path: '/message',
    permissions: [PermissionType.MESSAGE_VIEW, PermissionType.MESSAGE_MANAGE]
  },
  {
    path: '/user',
    permissions: [PermissionType.USER_MANAGE]
  },
  {
    path: '/setting',
    permissions: [PermissionType.SETTING_MANAGE]
  }
]
