<template>
  <div class="test-demo">
    <h1>VModelDemo</h1>
    <h2>汽车: {{ car }}</h2>
    <h2 v-show="toy">儿子给的玩具: {{ toy }}</h2>
    <el-button @click="changeCar" type="default">改变汽车</el-button>
    <Child :car="car" :sendToy="getToy" />
  </div>
</template>
<script lang="ts" setup>
import Child from './Child.vue'
import { ref } from 'vue'
const car = ref('Benz')
const toy = ref('')
const changeCar = () => {
  car.value = 'BMW'
}
const getToy = (value: string) => {
  console.log('getToy', value)
  toy.value = value
}
</script>

<style scoped>
.test-demo {
  display: flex;
  flex-direction: column;
  justify-content: center;
  border: 1px solid #ccc;
  padding: 20px;
  background-color: #c3d9ec;
}
.test-demo .el-button {
  margin: 10px 0;
  max-width: 100px;
}
</style>
