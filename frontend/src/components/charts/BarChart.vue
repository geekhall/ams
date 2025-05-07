<template>
  <Bar :data="chartData" :options="chartOptions" />
</template>

<script lang="ts" setup>
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  PointElement,
  LinearScale
} from 'chart.js'

import { Bar } from 'vue-chartjs'
ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, PointElement, Legend)

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
  labels: [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ],
  datasets: [
    {
      label: 'Sales 2022 (M)',
      backgroundColor: '#f87979',
      data: [40, 20, 12, 39, 10, 40, 39, 80, 40, 20, 12, 11]
    }
  ]
}

const chartOptions = props.options || {
  responsive: true
}
</script>

<style lang="less" scoped>
</style>
