import { defineStore } from 'pinia'
import { ref } from 'vue'
import { useAuthStore } from '@/stores/auth'
import { useRoute } from 'vue-router'

interface ObjectList {
  [key: string]: string[]
}

export const usePermissionStore = defineStore('permission', () => {
  // state
  const keys = localStorage.getItem('ms_keys') || ''
  const key = ref<string[]>(keys ? JSON.parse(keys) : [])
  const defaultList = ref<ObjectList>({
    admin: [
      'dashboard', 'environment', 'roster', 'table', 'import', 'export', 'tabs', 'form', 'upload', 'menu', 'editor', 'markdown', 'icon', 'charts', 'permission', 'axios', 'i18n', 'donate', '15', '16', 'message'
    ],
    user: ['dashboard', 'environment', 'roster', 'table', 'import', 'export', 'icon', 'charts', 'permission', 'axios', 'i18n', 'donate', 'message']
  })

  // actions
  const handleSet = (val: string[]) => {
    key.value = val
  }

  const generateRoutes = () => {
    const route = useRoute()
    const userStore = useAuthStore()
    // const roles = userStore.getRoles()
    // const permissions = userStore.getPermissions()
    const routes = route.matched
    // const keys = []
    // routes.forEach((item) => {
    //   if (item.meta && item.meta.permission) {
    //     if (roles.includes('admin')) {
    //       keys.push(item.meta.permission)
    //     } else {
    //       if (permissions.includes(item.meta.permission)) {
    //         keys.push(item.meta.permission)
    //       }
    //     }
    //   }
    // })
    // localStorage.setItem('ms_keys', JSON.stringify(keys))
    // handleSet(keys)
  }

  return {
    // state
    key,
    defaultList,

    // actions
    handleSet,
    generateRoutes
  }
})
