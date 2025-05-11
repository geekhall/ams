import type { Directive } from 'vue'
import { useUserStore } from '@/stores/user'
import { hasRole } from '@/utils/permission'

export const permission: Directive = {
  mounted(el, binding) {
    const userStore = useUserStore()
    const { value } = binding

    if (value) {
      const hasAuth = hasRole(userStore.userInfo, value)
      if (!hasAuth) {
        el.parentNode?.removeChild(el)
      }
    }
  }
}
