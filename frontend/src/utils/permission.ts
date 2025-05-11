import { UserRole, UserInfo, RoutePermission, routePermissions } from '@/types/auth'
import { RouteLocationNormalized } from 'vue-router'

// 检查用户是否具有指定角色
export const hasRole = (userInfo: UserInfo, role: UserRole | UserRole[]): boolean => {
  if (!userInfo) return false
  if (Array.isArray(role)) {
    return role.includes(userInfo.role)
  }
  return userInfo.role === role
}

// 检查用户是否具有指定权限
export const hasPermission = (userInfo: UserInfo, permission: string): boolean => {
  if (!userInfo) return false
  return userInfo.permissions.includes(permission)
}

// 检查用户是否有权限访问指定路由
export const hasRoutePermission = (userInfo: UserInfo, route: RouteLocationNormalized): boolean => {
  if (!userInfo) return false

  // 查找路由对应的权限配置
  const permission = routePermissions.find(p => route.path.startsWith(p.path))
  if (!permission) return true // 如果没有配置权限，默认允许访问

  return hasRole(userInfo, permission.roles)
}
