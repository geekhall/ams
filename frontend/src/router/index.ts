import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import Home from '@/views/Home.vue'
import { useUserStore } from '@/stores/user'

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
const NoPermission = () => import('@/views/403.vue')
const NotFound = () => import('@/views/404.vue')
const Profile = () => import('@/views/Profile.vue')
const Setting = () => import('@/views/Setting.vue')
const Tabs = () => import('@/views/Tabs.vue')
const Message = () => import('@/views/message/Message.vue')
const IconSample = () => import('@/views/IconSample.vue')

// 2. Define some routes
const routes: RouteRecordRaw[] = [
  { path: '/', redirect: '/dashboard' },
  {
    path: '/', name: "home", component: Home, children: [
      {
        path: '/dashboard', name: "dashboard",
        meta: { title: '首页', permission: 'dashboard' },
        component: Dashboard
      },
      {
        path: '/asset', name: "asset",
        meta: { title: '资产管理', permission: 'asset' },
        component: Asset
      },
      {
        path: '/budget', name: "budget",
        meta: { title: '预算管理', permission: 'budget' },
        component: BudgetBoard,
      },
      {
        path: '/budget/board', name: "budgetBoard",
        meta: { title: '预算概览', permission: 'budget' },
        component: BudgetBoard,
      },
      {
        path: '/budget/quota', name: "budgetQuota",
        meta: { title: '部门额度', permission: 'budget' },
        component: BudgetQuota,
      },
      {
        path: '/budget/detail', name: "budgetDetail",
        meta: { title: '预算明细', permission: 'budget' },
        component: BudgetDetail,
      },
      {
        path: '/project', name: "project",
        meta: { title: '项目清单', permission: 'project' },
        component: Project
      },
      {
        path: '/system', name: "system",
        meta: { title: '系统清单', permission: 'system' },
        component: System
      },
      {
        path: '/duty', name: "duty",
        meta: { title: '值班管理', permission: 'duty' },
        component: Duty
      },
      {
        path: '/user', name: "userManagement",
        meta: { title: '用户管理', permission: 'userManagement' },
        component: UserManagement
      },
      {
        path: '/setting', name: "setting",
        meta: { title: '系统设置', permission: 'setting' },
        component: Setting
      },
      {
        path: '/profile', name: "profile",
        meta: { title: '个人中心', permission: 'profile' },
        component: Profile
      },
      {
        path: '/setting', name: "setting",
        meta: { title: '设置', permission: 'setting' },
        component: Setting
      },
      {
        path: '/about', name: "about",
        meta: { title: '关于', permission: 'about' },
        component: About
      },
      {
        path: '/tabs', name: "tabs",
        meta: { title: '消息', permission: 'tabs' },
        component: Tabs
      },
      {
        path: '/message', name: "message",
        meta: { title: '消息管理', permission: 'message' },
        component: Message
      },
      {
        path: '/icon', name: "iconSample",
        meta: { title: 'icon', permission: 'icon' },
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
router.beforeEach(async (to, from, next) => {

  const publicPages = ['/login', '/register', '/403', '/404', '/500']
  const authRequired = !publicPages.includes(to.path)
  const userStore = useUserStore();
  const token = localStorage.getItem('token') || userStore.$state.token

  // console.log('authRequired', authRequired)
  // console.log('token in route.ts ############# ', token)
  document.title = `${to.meta.title} | AMS`
  // 如果需要认证且没有token，则重定向到登录页面
  if (authRequired && !token) {
    console.log('no login, redirect to login page.')
    next('/login')
    // TODO: Permission check
    // } else if (to.meta.permission && !permission.key.includes(to.meta.permission)) {
    //   // no permission, redirect to 403 page.
    //   console.log('no permission, redirect to 403 page.')
    //   next('/403')
  } else {
    next()
  }
})

export default router
