import type { Directive } from 'vue'
import { useUserStore } from '@/stores/user'
import { hasPermission } from '@/utils/permission'
import { PermissionType } from '@/types/user'

export const permission: Directive = {
  mounted(el, binding) {
    const userStore = useUserStore()
    const { value } = binding

    if (value) {
      const hasAuth = hasPermission(userStore.userInfo, value as PermissionType | PermissionType[])
      if (!hasAuth) {
        el.parentNode?.removeChild(el)
      }
    }
  }
}
