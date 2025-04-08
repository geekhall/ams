import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useSidebarStore = defineStore('sidebar', () => {
  // state
  const collapse = ref(false)
  const backgroundColor = ref('#324455')
  const textColor = ref('#bfc3dd')
  const activeTextColor = ref('#20a0ff')

  // actions
  const handleCollapse = () => {
    collapse.value = !collapse.value
  }

  return {
    // state
    collapse,
    backgroundColor,
    textColor,
    activeTextColor,

    // actions
    handleCollapse,
  }
})
