<template>
  <div id="settingPage" class="content-container">
    <h1>系统设置</h1>
    <div>
      <div class="darkLabel">Dark Mode</div>
      <div class="darkSwitch">
        <el-switch v-model="darkMode" class="mb-2" active-text="On" inactive-text="Off" />
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { ref, onMounted } from 'vue'
let darkMode = ref(false)
</script>

<style lang="less" scoped>
.darkLabel {
  display: inline-block;
  font-size: 20px;
  margin-right: 20px;
  text-align: center;
  vertical-align: middle;
  line-height: 40px;
}
.darkSwitch {
  display: inline-block;
  margin-left: 20px;
  text-align: center;
  vertical-align: middle;
  line-height: 40px;
}
</style>
