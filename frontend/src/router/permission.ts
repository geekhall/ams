import { Router } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { hasRoutePermission } from '@/utils/permission'

export function setupPermissionGuard(router: Router) {
  router.beforeEach(async (to, from, next) => {
    const userStore = useUserStore()

    // Public routes that don't require authentication
    const publicRoutes = ['/login', '/register', '/403', '/404', '/500']
    if (publicRoutes.includes(to.path)) {
      next()
      return
    }

    // Check if user is logged in
    if (!userStore.token) {
      next('/login')
      return
    }

    // Fetch user info if not already loaded
    if (!userStore.userInfo.id) {
      console.log('fetchUserInfo')
      const username = localStorage.getItem('username')
      if (username) {
        userStore.userInfo.username = username
      } else {
        next('/login')
        return
      }
      const success = await userStore.fetchUserInfo(username)
      if (!success) {
        next('/login')
        return
      }
    }

    // Check route permission
    if (!hasRoutePermission(userStore.userInfo, to)) {
      next('/403')
      return
    }

    next()
  })
}
