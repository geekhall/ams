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

  // Asset permissions
  ASSET_VIEW = 'asset:view',
  ASSET_MANAGE = 'asset:manage',

  // Budget permissions
  BUDGET_VIEW = 'budget:view',
  BUDGET_MANAGE = 'budget:manage',

  // Department permissions
  DEPARTMENT_VIEW = 'department:view',
  DEPARTMENT_MANAGE = 'department:manage',

  // Duty permissions
  DUTY_VIEW = 'duty:view',
  DUTY_MANAGE = 'duty:manage',

  // Message permissions
  MESSAGE_VIEW = 'message:view',
  MESSAGE_MANAGE = 'message:manage',

  // Role permissions
  ROLE_VIEW = 'role:view',
  ROLE_MANAGE = 'role:manage',

  // Team permissions
  TEAM_VIEW = 'team:view',
  TEAM_MANAGE = 'team:manage',

  // User permissions
  USER_VIEW = 'user:view',
  USER_MANAGE = 'user:manage',

  // Dashboard permissions
  DASHBOARD_VIEW = 'dashboard:view',
  DASHBOARD_MANAGE = 'dashboard:manage',

  // System permissions
  SYSTEM_VIEW = 'system:view',
  SYSTEM_MANAGE = 'system:manage',

  // Setting permissions
  SETTING_VIEW = 'setting:view',
  SETTING_MANAGE = 'setting:manage',
}

// Role-Permission mapping
export const rolePermissions: Record<UserRole, PermissionType[]> = {
  [UserRole.ADMIN]: Object.values(PermissionType),
  [UserRole.MANAGER]: [
    PermissionType.ASSET_VIEW,
    PermissionType.ASSET_MANAGE,
    PermissionType.BUDGET_VIEW,
    PermissionType.BUDGET_MANAGE,
    PermissionType.DEPARTMENT_VIEW,
    PermissionType.DEPARTMENT_MANAGE,
    PermissionType.DUTY_VIEW,
    PermissionType.DUTY_MANAGE,
    PermissionType.SYSTEM_VIEW,
    PermissionType.SYSTEM_MANAGE,
    PermissionType.MESSAGE_VIEW,
    PermissionType.MESSAGE_MANAGE,
    PermissionType.ROLE_VIEW,
    PermissionType.ROLE_MANAGE,
    PermissionType.TEAM_VIEW,
    PermissionType.TEAM_MANAGE,
    PermissionType.USER_VIEW,
    PermissionType.USER_MANAGE,
    PermissionType.DASHBOARD_VIEW,
    PermissionType.DASHBOARD_MANAGE,
    PermissionType.SYSTEM_VIEW,
    PermissionType.SYSTEM_MANAGE,
    PermissionType.SETTING_VIEW,
    PermissionType.SETTING_MANAGE
  ],
  [UserRole.USER]: [
    PermissionType.DASHBOARD_VIEW,
    PermissionType.ASSET_VIEW,
    PermissionType.SYSTEM_VIEW,
    PermissionType.BUDGET_VIEW,
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
