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
  ASSET_CREATE = 'asset:create',
  ASSET_EDIT = 'asset:edit',
  ASSET_DELETE = 'asset:delete',
  ASSET_EXPORT = 'asset:export',
  ASSET_IMPORT = 'asset:import',

  // Budget permissions
  BUDGET_VIEW = 'budget:view',
  BUDGET_MANAGE = 'budget:manage',
  BUDGET_CREATE = 'budget:create',
  BUDGET_EDIT = 'budget:edit',
  BUDGET_DELETE = 'budget:delete',
  BUDGET_APPROVE = 'budget:approve',
  BUDGET_REJECT = 'budget:reject',

  // Department permissions
  DEPARTMENT_VIEW = 'department:view',
  DEPARTMENT_MANAGE = 'department:manage',
  DEPARTMENT_CREATE = 'department:create',
  DEPARTMENT_EDIT = 'department:edit',
  DEPARTMENT_DELETE = 'department:delete',

  // Duty permissions
  DUTY_VIEW = 'duty:view',
  DUTY_MANAGE = 'duty:manage',
  DUTY_CREATE = 'duty:create',
  DUTY_EDIT = 'duty:edit',
  DUTY_DELETE = 'duty:delete',
  DUTY_ASSIGN = 'duty:assign',

  // Message permissions
  MESSAGE_VIEW = 'message:view',
  MESSAGE_MANAGE = 'message:manage',
  MESSAGE_CREATE = 'message:create',
  MESSAGE_EDIT = 'message:edit',
  MESSAGE_DELETE = 'message:delete',
  MESSAGE_SEND = 'message:send',

  // Role permissions
  ROLE_VIEW = 'role:view',
  ROLE_MANAGE = 'role:manage',
  ROLE_CREATE = 'role:create',
  ROLE_EDIT = 'role:edit',
  ROLE_DELETE = 'role:delete',
  ROLE_ASSIGN = 'role:assign',

  // Team permissions
  TEAM_VIEW = 'team:view',
  TEAM_MANAGE = 'team:manage',
  TEAM_CREATE = 'team:create',
  TEAM_EDIT = 'team:edit',
  TEAM_DELETE = 'team:delete',
  TEAM_ASSIGN = 'team:assign',

  // User permissions
  USER_VIEW = 'user:view',
  USER_MANAGE = 'user:manage',
  USER_CREATE = 'user:create',
  USER_EDIT = 'user:edit',
  USER_DELETE = 'user:delete',
  USER_RESET_PWD = 'user:reset-pwd',
  USER_LOCK = 'user:lock',
  USER_UNLOCK = 'user:unlock',

  // Dashboard permissions
  DASHBOARD_VIEW = 'dashboard:view',
  DASHBOARD_MANAGE = 'dashboard:manage',
  DASHBOARD_EXPORT = 'dashboard:export',

  // System permissions
  SYSTEM_VIEW = 'system:view',
  SYSTEM_MANAGE = 'system:manage',
  SYSTEM_CONFIG = 'system:config',
  SYSTEM_LOG = 'system:log',

  // Setting permissions
  SETTING_VIEW = 'setting:view',
  SETTING_MANAGE = 'setting:manage',
  SETTING_PROFILE = 'setting:profile',
  SETTING_SECURITY = 'setting:security',

  // Data permissions
  DATA_ALL = 'data:all',
  DATA_DEPARTMENT = 'data:department',
  DATA_TEAM = 'data:team',
  DATA_PERSONAL = 'data:personal'
}

// Role-Permission mapping
export const rolePermissions: Record<UserRole, PermissionType[]> = {
  [UserRole.ADMIN]: Object.values(PermissionType),
  [UserRole.MANAGER]: [
    // Asset permissions
    PermissionType.ASSET_VIEW,
    PermissionType.ASSET_MANAGE,
    PermissionType.ASSET_CREATE,
    PermissionType.ASSET_EDIT,
    PermissionType.ASSET_DELETE,
    PermissionType.ASSET_EXPORT,
    PermissionType.ASSET_IMPORT,

    // Budget permissions
    PermissionType.BUDGET_VIEW,
    PermissionType.BUDGET_MANAGE,
    PermissionType.BUDGET_CREATE,
    PermissionType.BUDGET_EDIT,
    PermissionType.BUDGET_DELETE,
    PermissionType.BUDGET_APPROVE,
    PermissionType.BUDGET_REJECT,

    // Department permissions
    PermissionType.DEPARTMENT_VIEW,
    PermissionType.DEPARTMENT_MANAGE,
    PermissionType.DEPARTMENT_CREATE,
    PermissionType.DEPARTMENT_EDIT,
    PermissionType.DEPARTMENT_DELETE,

    // Duty permissions
    PermissionType.DUTY_VIEW,
    PermissionType.DUTY_MANAGE,
    PermissionType.DUTY_CREATE,
    PermissionType.DUTY_EDIT,
    PermissionType.DUTY_DELETE,
    PermissionType.DUTY_ASSIGN,

    // Message permissions
    PermissionType.MESSAGE_VIEW,
    PermissionType.MESSAGE_MANAGE,
    PermissionType.MESSAGE_CREATE,
    PermissionType.MESSAGE_EDIT,
    PermissionType.MESSAGE_DELETE,
    PermissionType.MESSAGE_SEND,

    // Role permissions
    PermissionType.ROLE_VIEW,
    PermissionType.ROLE_MANAGE,
    PermissionType.ROLE_CREATE,
    PermissionType.ROLE_EDIT,
    PermissionType.ROLE_DELETE,
    PermissionType.ROLE_ASSIGN,

    // Team permissions
    PermissionType.TEAM_VIEW,
    PermissionType.TEAM_MANAGE,
    PermissionType.TEAM_CREATE,
    PermissionType.TEAM_EDIT,
    PermissionType.TEAM_DELETE,
    PermissionType.TEAM_ASSIGN,

    // User permissions
    PermissionType.USER_VIEW,
    PermissionType.USER_MANAGE,
    PermissionType.USER_CREATE,
    PermissionType.USER_EDIT,
    PermissionType.USER_DELETE,
    PermissionType.USER_RESET_PWD,
    PermissionType.USER_LOCK,
    PermissionType.USER_UNLOCK,

    // Dashboard permissions
    PermissionType.DASHBOARD_VIEW,
    PermissionType.DASHBOARD_MANAGE,
    PermissionType.DASHBOARD_EXPORT,

    // System permissions
    PermissionType.SYSTEM_VIEW,
    PermissionType.SYSTEM_MANAGE,
    PermissionType.SYSTEM_CONFIG,
    PermissionType.SYSTEM_LOG,

    // Setting permissions
    PermissionType.SETTING_VIEW,
    PermissionType.SETTING_MANAGE,
    PermissionType.SETTING_PROFILE,
    PermissionType.SETTING_SECURITY,

    // Data permissions
    PermissionType.DATA_DEPARTMENT,
    PermissionType.DATA_TEAM
  ],
  [UserRole.USER]: [
    // View permissions
    PermissionType.DASHBOARD_VIEW,
    PermissionType.ASSET_VIEW,
    PermissionType.SYSTEM_VIEW,
    PermissionType.BUDGET_VIEW,
    PermissionType.MESSAGE_VIEW,
    PermissionType.TEAM_VIEW,
    PermissionType.DEPARTMENT_VIEW,

    // Basic operations
    PermissionType.MESSAGE_CREATE,
    PermissionType.MESSAGE_SEND,
    PermissionType.SETTING_PROFILE,
    PermissionType.SETTING_SECURITY,

    // Data permissions
    PermissionType.DATA_PERSONAL
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
