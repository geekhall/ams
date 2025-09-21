import { createRouter, createWebHistory, RouteRecordRaw, RouteLocationNormalized } from 'vue-router'
import Home from '@/views/Home.vue'
import { useUserStore } from '@/stores/user'
import { ElMessage } from 'element-plus'
import { hasRoutePermission, hasPermission } from '@/utils/permission'
import type { PermissionType } from '@/types/user'

// 1. Define route components.
const Dashboard = () => import('@/views/Dashboard.vue')
const Asset = () => import('@/views/asset/Asset.vue')
const BudgetBoard = () => import('@/views/budget/BudgetBoard.vue')
const BudgetDetail = () => import('@/views/budget/BudgetDetail.vue')
const BudgetQuota = () => import('@/views/budget/BudgetQuota.vue')
const Project = () => import('@/views/Project.vue')
const System = () => import('@/views/asset/System.vue')
const Duty = () => import('@/views/Duty.vue')
const UserManagement = () => import('@/views/UserManagement.vue')

const About = () => import('@/views/About.vue')
const Login = () => import('@/views/Login.vue')
const Register = () => import('@/views/Register.vue')
const NoPermission = () => import('@/views/error/403.vue')
const NotFound = () => import('@/views/error/404.vue')
const Profile = () => import('@/views/Profile.vue')
const Setting = () => import('@/views/Setting.vue')
const Tabs = () => import('@/views/Tabs.vue')
const Message = () => import('@/views/message/Message.vue')
const IconSample = () => import('@/views/IconSample.vue')

// 白名单路由
const whiteList = ['/login', '/register', '/403', '/404', '/500']

// 需要重定向的路由
const redirectRoutes: Record<string, string> = {
  '/': '/dashboard',
  '/index': '/dashboard'
}

// 2. Define some routes
const routes: RouteRecordRaw[] = [
  { path: '/', redirect: '/dashboard' },
  {
    path: '/', name: "home", component: Home, children: [
      {
        path: '/dashboard', name: "dashboard",
        meta: { title: '首页', permission: 'dashboard:view' },
        component: Dashboard
      },
      {
        path: '/asset', name: "asset",
        meta: { title: '资产管理', permission: 'asset:view' },
        component: Asset
      },
      {
        path: '/budget', name: "budget",
        meta: { title: '预算管理', permission: 'budget:view' },
        component: BudgetBoard,
      },
      {
        path: '/budget/board', name: "budgetBoard",
        meta: { title: '预算概览', permission: 'budget:board:view' },
        component: BudgetBoard,
      },
      {
        path: '/budget/quota', name: "budgetQuota",
        meta: { title: '部门额度', permission: 'budget:quota:view' },
        component: BudgetQuota,
      },
      {
        path: '/budget/detail', name: "budgetDetail",
        meta: { title: '预算明细', permission: 'budget:detail:view' },
        component: BudgetDetail,
      },
      {
        path: '/project', name: "project",
        meta: { title: '项目清单', permission: 'project:view' },
        component: Project
      },
      {
        path: '/system', name: "system",
        meta: { title: '系统清单', permission: 'system:view' },
        component: System
      },
      {
        path: '/duty', name: "duty",
        meta: { title: '值班管理', permission: 'duty:view' },
        component: Duty
      },
      {
        path: '/user', name: "userManagement",
        meta: { title: '用户管理', permission: 'user:view' },
        component: UserManagement
      },
      {
        path: '/setting', name: "setting",
        meta: { title: '系统设置', permission: 'setting:view' },
        component: Setting
      },
      {
        path: '/profile', name: "profile",
        meta: { title: '个人中心', permission: 'profile:view' },
        component: Profile
      },
      {
        path: '/setting', name: "setting",
        meta: { title: '设置', permission: 'setting:view' },
        component: Setting
      },
      {
        path: '/about', name: "about",
        meta: { title: '关于', permission: 'about:view' },
        component: About
      },
      {
        path: '/tabs', name: "tabs",
        meta: { title: '消息', permission: 'tabs:view' },
        component: Tabs
      },
      {
        path: '/message', name: "message",
        meta: { title: '消息管理', permission: 'message:view' },
        component: Message
      },
      {
        path: '/icon', name: "iconSample",
        meta: { title: 'icon', permission: 'icon:view' },
        component: IconSample
      },
    ]
  },
  {
    path: '/login', name: "login",
    meta: { title: '登录' },
    component: Login
  },
  {
    path: '/register', name: "register",
    meta: { title: '注册' },
    component: Register
  },
  {
    path: '/403', name: "403",
    meta: { title: '没有权限' },
    component: NoPermission
  },
  {
    path: '/:pathMatch(.*)*', name: "404",
    meta: { title: '404' },
    component: NotFound
  },
]

// 3. Create the router instance and pass the `routes` option
const router = createRouter({
  history: createWebHistory(),
  routes
})

// 4. Add route guards（路由守卫）
router.beforeEach(async (to: RouteLocationNormalized, from: RouteLocationNormalized, next) => {

  const publicPages = ['/login', '/register', '/403', '/404', '/500']
  const authRequired = !publicPages.includes(to.path)
  const userStore = useUserStore();
  const token = localStorage.getItem('token') || userStore.token
  // console.log('authRequired', authRequired)
  // console.log('token in route.ts ############# ', token)

  // 设置页面标题
  document.title = `${to.meta.title || 'AMS'}`

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
  // 如果需要认证且没有token，则重定向到登录页面
  if (authRequired && !token) {
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
    console.log('用户信息:', userStore.userInfo)
    console.log('目标路由:', to.path)
    console.log('路由权限检查结果:', hasRoutePermission(userStore.userInfo, to))

    if (!hasRoutePermission(userStore.userInfo, to)) {
      // 检查是否有meta.permission
      if (to.meta.permission) {
        const permission = to.meta.permission as PermissionType | PermissionType[]
        console.log('需要权限:', permission)
        console.log('用户权限:', userStore.userInfo.permissions)
        if (!hasPermission(userStore.userInfo, permission)) {
          ElMessage.error('您没有权限访问该页面')
          next('/403')
          return
        }
      } else {
        console.log('路由没有配置权限，但hasRoutePermission返回false')
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
    ElMessage.error(error instanceof Error ? error.message : '系统错误，请稍后重试')
    next('/500')
  }
})

export default router
