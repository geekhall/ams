import { Router, RouteLocationNormalized } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { hasRoutePermission, hasPermission } from '@/utils/permission'
import { PermissionType } from '@/types/user'
import { ElMessage } from 'element-plus'

// 白名单路由
const whiteList = ['/login', '/register', '/403', '/404', '/500']

// 需要重定向的路由
const redirectRoutes: Record<string, string> = {
  '/': '/dashboard',
  '/index': '/dashboard'
}

export function setupPermissionGuard(router: Router) {
  router.beforeEach(async (to: RouteLocationNormalized, from: RouteLocationNormalized, next) => {
    const userStore = useUserStore()
    const token = userStore.token

    // 设置页面标题
    document.title = `${to.meta.title || 'AMS'} | Asset Management System`

    // 处理重定向
    const redirectPath = redirectRoutes[to.path]
    if (redirectPath) {
      next(redirectPath)
      return
    }

    // 白名单路由直接放行
    if (whiteList.includes(to.path)) {
      next()
      return
    }

    // 检查登录状态
    if (!token) {
      // 保存原始目标路由
      next({
        path: '/login',
        query: { redirect: to.fullPath }
      })
      return
    }

    try {
      // 获取用户信息
      if (!userStore.userInfo.id) {
        const username = localStorage.getItem('username')
        if (!username) {
          ElMessage.error('用户信息已失效，请重新登录')
          next('/login')
          return
        }

        const success = await userStore.fetchUserInfo(username)
        if (!success) {
          ElMessage.error('获取用户信息失败，请重新登录')
          next('/login')
          return
        }
      }

      // 检查路由权限
      if (!hasRoutePermission(userStore.userInfo, to)) {
        // 检查是否有meta.permission
        if (to.meta.permission) {
          const permission = to.meta.permission as PermissionType | PermissionType[]
          if (!hasPermission(userStore.userInfo, permission)) {
            ElMessage.error('您没有权限访问该页面')
            next('/403')
            return
          }
        } else {
          ElMessage.error('您没有权限访问该页面')
          next('/403')
          return
        }
      }

      // 检查token是否过期
      const tokenExp = localStorage.getItem('tokenExp')
      if (tokenExp && Date.now() > parseInt(tokenExp)) {
        ElMessage.error('登录已过期，请重新登录')
        next('/login')
        return
      }

      next()
    } catch (error) {
      console.error('Route guard error:', error)
      ElMessage.error('系统错误，请稍后重试')
      next('/500')
    }
  })

  // 路由错误处理
  router.onError((error) => {
    console.error('Router error:', error)
    ElMessage.error('路由加载失败，请刷新页面重试')
  })
}
