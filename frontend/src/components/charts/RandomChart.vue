<template>
  <Bar :data="data" :options="options" />
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue'
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
  ChartData
} from 'chart.js'
import { Bar } from 'vue-chartjs'

function getRandomInt() {
  return Math.floor(Math.random() * (50 - 5 + 1)) + 5
}

const randomData = () => ({
  labels: [
    'January' + getRandomInt(),
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
      label: 'Data One',
      backgroundColor: '#f87979',
      data: [
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt(),
        getRandomInt()
      ]
    }
  ]
})

const options = {
  responsive: true
}

ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

const data = ref<ChartData<'bar'>>({
  datasets: []
})

onMounted(() => {
  setInterval(() => {
    data.value = randomData()
  }, 3000)
})
</script>

<style lang="less" scoped>
</style>
