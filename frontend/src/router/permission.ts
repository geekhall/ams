import { Router } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { hasRoutePermission } from '@/utils/permission'

export function setupPermissionGuard(router: Router) {
  router.beforeEach(async (to, from, next) => {
    const userStore = useUserStore()

    // 如果用户未登录，重定向到登录页
    if (!userStore.token && to.path !== '/login') {
      next('/login')
      return
    }

    // 如果用户已登录但未获取用户信息，先获取用户信息
    if (userStore.token && !userStore.userInfo.id) {
      const success = await userStore.fetchUserInfo()
      if (!success) {
        next('/login')
        return
      }
    }

    // 检查路由权限
    if (userStore.userInfo.id && !hasRoutePermission(userStore.userInfo, to)) {
      next('/403')
      return
    }

    next()
  })
}
