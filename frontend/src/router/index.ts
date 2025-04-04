import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import { usePermissionStore } from '~/store/permission'
import Home from '~/views/Home.vue'
import { useAuthStore } from '~/store/auth'

// 1. Define route components.
const Dashboard = () => import('../views/Dashboard.vue')
const Asset = () => import('../views/Asset.vue')
const Project = () => import('../views/Project.vue')
const System = () => import('../views/System.vue')
const Duty = () => import('../views/Duty.vue')
const User = () => import('../views/User.vue')

const About = () => import('../views/About.vue')
const Login = () => import('../views/Login.vue')
const Register = () => import('../views/Register.vue')
const NoPermission = () => import('../views/403.vue')
const NotFound = () => import('../views/404.vue')
const Profile = () => import('../views/Profile.vue')
const Setting = () => import('../views/Setting.vue')
const Tabs = () => import('../views/Tabs.vue')


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
        path: '/user', name: "user",
        meta: { title: '用户管理', permission: 'user' },
        component: User
      },
      {
        path: '/setting', name: "setting",
        meta: { title: '系统设置', permission: 'setting' },
        component: Setting
      },
      {
        path: '/profile', name: "Profile",
        meta: { title: 'Profile', permission: 'profile' },
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
        meta: { title: 'Tabs', permission: 'tabs' },
        component: Tabs
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
  // createWebHashHistory // (hash路由)
  // createWebHistory // (history路由)
  // createMemoryHistory // (内存路由)
  // 添加baseUrl， createWebHistory({ base: '/base/' })
  history: createWebHistory(),
  routes // short for `routes: routes`
})

// 4. Add route guards（路由守卫）
router.beforeEach((to, from, next) => {
  const publicPages = ['/login', '/register', '/403', '/404', '/500']
  const authRequired = !publicPages.includes(to.path)
  const authStore = useAuthStore();
  const token = localStorage.getItem('token') || authStore.$state.token

  // const role = localStorage.getItem('ms_username')
  const permission = usePermissionStore();
  console.log('permission', permission)
  console.log('authRequired', authRequired)
  console.log('token in route.ts ############# ', token)

  document.title = `${to.meta.title} | AMS`

  if (authRequired && !token) {
    console.log('no login, redirect to login page.')
    next('/login')
    // } else if (to.meta.permission && !permission.key.includes(to.meta.permission)) {
    //   // no permission, redirect to 403 page.
    //   console.log('no permission, redirect to 403 page.')
    //   next('/403')
  } else {
    console.log('next to page.')
    next()
    // validate token and permission
    // axios.get('/api/user/info').then(res => {
    //   if (res.data.code === 200) {
    //     next()
    //   } else {
    //     next('/login')
    //   }
    // }).catch(err => {
    //   console.log(err)
    //   next('/login')
    // })
  }
})

export default router
