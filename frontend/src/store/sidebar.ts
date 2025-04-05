import { defineStore } from 'pinia'

export const useSidebarStore = defineStore('sidebar', {
  state: () => {
    return {
      collapse: false,
      backgroundColor: '#324455',
      textColor: '#bfc3dd',
      activeTextColor: '#20a0ff',
    }
  },
  getters: {},
  actions: {
    handleCollapse() {
      this.collapse = !this.collapse
    }
  }
})
