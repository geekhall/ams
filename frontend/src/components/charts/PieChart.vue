<template>
  <Pie :data="chartData" :options="chartOptions" />
</template>

<script lang="ts" setup>
import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'
import { Pie } from 'vue-chartjs'

ChartJS.register(ArcElement, Tooltip, Legend)

const props = defineProps<{
  data?: {
    labels: string[]
    datasets: {
      backgroundColor: string[]
      data: number[]
    }[]
  }
  options?: {
    responsive?: boolean
    maintainAspectRatio?: boolean
    plugins?: {
      legend?: {
        position?: string
        labels?: {
          padding?: number
          font?: {
            size?: number
          }
        }
      }
      tooltip?: {
        callbacks?: {
          label?: (context: any) => string
        }
      }
    }
  }
}>()

const chartData = props.data || {
  labels: ['部门A', '部门B', '部门C'],
  datasets: [
    {
      backgroundColor: ['#409EFF', '#67C23A', '#E6A23C'],
      data: [300, 200, 100]
    }
  ]
}

const chartOptions = props.options || {
  responsive: true,
  maintainAspectRatio: false
}
</script>

<style lang="less" scoped>
</style>
