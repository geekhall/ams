<template>
  <Scatter :data="data" :options="options" />
</template>

<script lang="ts" setup>
import { Chart as ChartJS, LinearScale, PointElement, LineElement, Tooltip, Legend } from 'chart.js'
import { Scatter } from 'vue-chartjs'

ChartJS.register(LinearScale, PointElement, LineElement, Tooltip, Legend)

const getRandomInt = (max: number) => {
  return Math.floor(Math.random() * (max - 5 + 1)) + 5
}
const getRandomPoint = () => {
  return { x: getRandomInt(50), y: getRandomInt(50) }
}
const points1 = []
const points2 = []

for (let i = 0; i < 50; i++) {
  points1.push(getRandomPoint())
  points2.push(getRandomPoint())
}
const data = {
  datasets: [
    {
      label: 'Scatter Dataset 1',
      fill: false,
      borderColor: '#f87979',
      backgroundColor: '#f87979',
      data: points1
    },
    {
      label: 'Scatter Dataset 2',
      fill: false,
      borderColor: '#7acbf9',
      backgroundColor: '#7acbf9',
      data: points2
    }
  ]
}

const options = {
  responsive: true
}
</script>

<style lang="less" scoped>
</style>
