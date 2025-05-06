import { useUserStore } from '@/stores/user'

export const hasPermission = (permissionId: number): boolean => {
  const userStore = useUserStore()
  return userStore.permissions.includes(permissionId)
}
