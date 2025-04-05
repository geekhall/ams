<template>
  <div class="content-container">
    <h1>系统设置</h1>
    <div>
      <p>{{ name }}</p>
      <p>{{ age }}</p>
      <p>{{ a }}</p>
      <p>{{ c }}</p>
    </div>
    <button class="btn" @click="changeName">changeName</button>
    <button class="btn" @click="changeAge">changeAge</button>
    <button class="btn" @click="showTel">showTel</button>
    <button class="btn" @click="test">test</button>
  </div>
</template>

<script lang="ts">
import { ref, onMounted } from 'vue'

export default {
  name: 'Setting',
  beforeCreate() {
    console.log('Setting beforeCreate')
  },
  data() {
    return {
      name: 'Vue2',
      a: 100,
      c: this.name
    }
  },
  methods: {
    test() {
      console.log('test b')
    }
  },
  setup() {
    console.log(this)
    let name = ref('张三 in setup')
    let age = ref(18)
    let tel = '123456789'
    function changeName() {
      console.log('changeName')
      name.value = 'Vue3'
    }
    function changeAge() {
      console.log('changeAge')
      age.value++
    }
    function showTel() {
      console.log('showTel')
      console.log(tel)
    }
    return {
      name,
      age,
      tel,
      changeName,
      changeAge,
      showTel
    }
  }
}
</script>

<style lang="less" scoped>
.info {
  text-align: center;
  padding: 35px 0;
}
.info-image {
  position: relative;
  margin: auto;
  width: 100px;
  height: 100px;
  background: #f8f8f8;
  border: 1px solid #eee;
  border-radius: 50px;
  overflow: hidden;
}

.info-edit {
  display: flex;
  justify-content: center;
  align-items: center;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, 0.5);
  opacity: 0;
  transition: opacity 0.3s ease;
}
.info-edit i {
  color: #eee;
  font-size: 25px;
}
.info-image:hover .info-edit {
  opacity: 1;
}
.info-name {
  margin: 15px 0 10px;
  font-size: 24px;
  font-weight: 500;
  color: #262626;
}
.crop-demo-btn {
  position: relative;
}
.crop-input {
  position: absolute;
  width: 100px;
  height: 40px;
  left: 0;
  top: 0;
  opacity: 0;
  cursor: pointer;
}
.btn {
  margin: 0 10px;
  padding: 10px 20px;
  border: none;
  border-radius: 5px;
  background: #409eff;
  color: #fff;
  cursor: pointer;
}
</style>
