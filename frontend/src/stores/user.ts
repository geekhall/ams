import { defineStore } from 'pinia'

export const useUserStore = defineStore('user', {
  state: () => ({
    permissions: [] as number[],
    name: '',
    avatar: ''
  }),

  actions: {
    setPermissions(permissions: number[]) {
      this.permissions = permissions
    },

    clearPermissions() {
      this.permissions = []
    },

    async logout() {
      // TODO: 调用登出 API
      this.permissions = []
      this.name = ''
      this.avatar = ''
    }
  }
})
