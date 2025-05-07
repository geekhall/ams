<template>
  <Line :data="chartData" :options="chartOptions" />
</template>

<script lang="ts" setup>
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
} from 'chart.js'
import { Line } from 'vue-chartjs'

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend)

const props = defineProps<{
  data?: {
    labels: string[]
    datasets: {
      label: string
      backgroundColor: string
      data: number[]
    }[]
  }
  options?: {
    responsive?: boolean
    [key: string]: any
  }
}>()

const chartData = props.data || {
  labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August'],
  datasets: [
    {
      label: 'Tesla Model S',
      backgroundColor: '#f87979',
      data: [40, 39, 25, 40, 39, 80, 40, 47]
    },
    {
      label: 'BYD Tang',
      backgroundColor: '#7C8CF8',
      data: [10, 20, 22, 25, 28, 30, 45, 62]
    }
  ]
}

const chartOptions = props.options || {
  responsive: true
}
</script>

<style lang="less" scoped>
</style>
