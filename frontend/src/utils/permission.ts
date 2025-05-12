import { UserRole, UserDTO, RoutePermission, routePermissions, PermissionType, rolePermissions } from '@/types/user'
import { RouteLocationNormalized } from 'vue-router'

// Check if user has a specific role
export const hasRole = (userInfo: UserDTO, role: UserRole | UserRole[]): boolean => {
  if (!userInfo) return false
  if (Array.isArray(role)) {
    return role.includes(userInfo.roles[0] as UserRole)
  }
  return userInfo.roles[0] === role
}

// Check if user has a specific permission
export const hasPermission = (userInfo: UserDTO, permission: PermissionType | PermissionType[]): boolean => {
  if (!userInfo) return false

  // If user has admin role, they have all permissions
  if (userInfo.roles.includes(UserRole.ADMIN)) return true

  // Check if user has the specific permission
  if (Array.isArray(permission)) {
    return permission.some(p => userInfo.permissions.includes(p))
  }
  return userInfo.permissions.includes(permission)
}

// Check if user has permission to access a route
export const hasRoutePermission = (userInfo: UserDTO, route: RouteLocationNormalized): boolean => {
  if (!userInfo) return false

  // Find route permission configuration
  const permission = routePermissions.find(p => route.path.startsWith(p.path))
  if (!permission) return true // If no permission config, allow access

  return hasPermission(userInfo, permission.permissions)
}

// Get all permissions for a role
export const getRolePermissions = (roles: UserRole[]): PermissionType[] => {
  return rolePermissions[roles[0]] || [] // TODO: 需要根据角色获取权限
}

// Check if user has any of the required permissions
export const hasAnyPermission = (userInfo: UserDTO, permissions: PermissionType[]): boolean => {
  return permissions.some(permission => hasPermission(userInfo, permission))
}

// Check if user has all of the required permissions
export const hasAllPermissions = (userInfo: UserDTO, permissions: PermissionType[]): boolean => {
  return permissions.every(permission => hasPermission(userInfo, permission))
}
