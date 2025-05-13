import type { Directive, DirectiveBinding } from 'vue'
import { useUserStore } from '@/stores/user'
import { hasPermission, hasAnyPermission, hasAllPermissions } from '@/utils/permission'
import { PermissionType } from '@/types/user'

interface PermissionBinding extends DirectiveBinding {
  value: PermissionType | PermissionType[] | {
    permission: PermissionType | PermissionType[]
    mode?: 'any' | 'all'
    fallback?: boolean
    disabled?: boolean
  }
}

export const permission: Directive = {
  mounted(el: HTMLElement, binding: PermissionBinding) {
    const userStore = useUserStore()
    const { value } = binding

    if (!value) return

    let hasAuth = false
    let permission: PermissionType | PermissionType[]
    let mode: 'any' | 'all' = 'any'
    let fallback = false
    let disabled = false

    if (typeof value === 'object' && 'permission' in value) {
      permission = value.permission
      mode = value.mode || 'any'
      fallback = value.fallback || false
      disabled = value.disabled || false
    } else {
      permission = value as PermissionType | PermissionType[]
    }

    switch (mode) {
      case 'any':
        hasAuth = hasAnyPermission(userStore.userInfo, Array.isArray(permission) ? permission : [permission])
        break
      case 'all':
        hasAuth = hasAllPermissions(userStore.userInfo, Array.isArray(permission) ? permission : [permission])
        break
      default:
        hasAuth = hasPermission(userStore.userInfo, permission)
    }

    if (!hasAuth) {
      if (fallback) {
        if (disabled) {
          el.setAttribute('disabled', 'disabled')
          el.classList.add('is-disabled')
        } else {
          el.style.display = 'none'
        }
      } else {
        el.parentNode?.removeChild(el)
      }
    }
  },

  updated(el: HTMLElement, binding: PermissionBinding) {
    // 当权限值更新时重新检查权限
    const userStore = useUserStore()
    const { value } = binding

    if (!value) return

    let hasAuth = false
    let permission: PermissionType | PermissionType[]
    let mode: 'any' | 'all' = 'any'
    let fallback = false
    let disabled = false

    if (typeof value === 'object' && 'permission' in value) {
      permission = value.permission
      mode = value.mode || 'any'
      fallback = value.fallback || false
      disabled = value.disabled || false
    } else {
      permission = value as PermissionType | PermissionType[]
    }

    switch (mode) {
      case 'any':
        hasAuth = hasAnyPermission(userStore.userInfo, Array.isArray(permission) ? permission : [permission])
        break
      case 'all':
        hasAuth = hasAllPermissions(userStore.userInfo, Array.isArray(permission) ? permission : [permission])
        break
      default:
        hasAuth = hasPermission(userStore.userInfo, permission)
    }

    if (!hasAuth) {
      if (fallback) {
        if (disabled) {
          el.setAttribute('disabled', 'disabled')
          el.classList.add('is-disabled')
        } else {
          el.style.display = 'none'
        }
      } else {
        el.parentNode?.removeChild(el)
      }
    } else {
      // 恢复元素状态
      if (fallback) {
        if (disabled) {
          el.removeAttribute('disabled')
          el.classList.remove('is-disabled')
        } else {
          el.style.display = ''
        }
      }
    }
  }
}
