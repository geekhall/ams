import type { App } from 'vue'
import { defineStore } from 'pinia'
const mainStore = defineStore('main', {
  state: () => ({
    count: 0,
    name: 'Thor',
  }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    increment() {
      this.count++
    },
    decrement() {
      this.count--
    }
  }
})

export default mainStore
