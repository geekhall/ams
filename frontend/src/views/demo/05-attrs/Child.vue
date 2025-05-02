<template>
  <div class="child">
    <h1>Child</h1>
    <p>玩具: {{ toy }}</p>
    <p>父亲给的汽车: {{ car }}</p>
    <el-button @click="sendToy" type="default">发送玩具</el-button>
  </div>
</template>
<script lang="ts" setup>
import { ref } from 'vue'
const toy = ref('奥特曼')
const car = ref('Benz')
const props = defineProps(['car', 'sendToy'])
const sendToy = () => {
  props.sendToy(toy.value)
}
</script>

<style scoped>
.child {
  border: 1px solid #ccc;
  padding: 20px;
  background-color: #a0c2b5;
  width: 100%;
}
</style>
