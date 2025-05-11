import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

export const useMainStore = defineStore('main', () => {
  // state
  const count = ref(0)
  const name = ref('Thor')

  // getters
  const doubleCount = computed(() => count.value * 2)

  // actions
  const increment = () => {
    count.value++
  }

  const decrement = () => {
    count.value--
  }

  return {
    // state
    count,
    name,

    // getters
    doubleCount,

    // actions
    increment,
    decrement,
  }
})
