import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    permissions: [] as number[]
  }),

  actions: {
    setPermissions(permissions: number[]) {
      this.permissions = permissions
    },

    clearPermissions() {
      this.permissions = []
    }
  }
})
