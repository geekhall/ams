<template>
  <Bubble :data="data" :options="options" />
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
import { Bubble } from 'vue-chartjs'

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, PointElement, Legend)

const data = {
  datasets: [
    {
      label: 'Bubble Data One',
      backgroundColor: '#f87979',
      data: [
        {
          x: 20,
          y: 25,
          r: 5
        },
        {
          x: 40,
          y: 10,
          r: 10
        },
        {
          x: 30,
          y: 22,
          r: 30
        }
      ]
    },
    {
      label: 'Bubble Data Two',
      backgroundColor: '#7C8CF8',
      data: [
        {
          x: 10,
          y: 30,
          r: 15
        },
        {
          x: 20,
          y: 20,
          r: 10
        },
        {
          x: 15,
          y: 8,
          r: 30
        }
      ]
    }
  ]
}

const options = {
  responsive: true
}
</script>

<style lang="less" scoped>
</style>
