<template>
  <Pie :data="chartData" :options="chartOptions" />
</template>

<script lang="ts" setup>
import { Chart as ChartJS, ArcElement, Tooltip, Legend, type ChartOptions } from 'chart.js'
import { Pie } from 'vue-chartjs'
import { computed } from 'vue'

ChartJS.register(ArcElement, Tooltip, Legend)

const props = defineProps<{
  data?: {
    labels: string[]
    datasets: {
      backgroundColor: string[]
      data: number[]
    }[]
  }
  options?: ChartOptions<'pie'>
}>()

const chartData = computed(() => {
  if (!props.data) {
    return {
      labels: ['暂无数据'],
      datasets: [
        {
          backgroundColor: ['#909399'],
          data: [1]
        }
      ]
    }
  }
  return props.data
})

const chartOptions = computed(() => {
  return (
    props.options || {
      responsive: true,
      maintainAspectRatio: false
    }
  )
})
</script>

<style lang="less" scoped>
</style>
