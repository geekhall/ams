<template>
  <div id="dutyPage" class="content-container">
    <h1>值班表</h1>
    <el-calendar ref="calendar">
      <template #header="{ date }">
        <span>值班表</span>
        <span>{{ date }}</span>
        <el-button-group>
          <el-button size="small" @click="selectDate('prev-year')"> 去年 </el-button>
          <el-button size="small" @click="selectDate('prev-month')"> 上月 </el-button>
          <el-button size="small" @click="selectDate('today')">今天</el-button>
          <el-button size="small" @click="selectDate('next-month')"> 下月 </el-button>
          <el-button size="small" @click="selectDate('next-year')"> 来年 </el-button>
        </el-button-group>
      </template>
    </el-calendar>
  </div>
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import type { CalendarDateType, CalendarInstance } from 'element-plus'

const calendar = ref<CalendarInstance>()
const selectDate = (val: CalendarDateType) => {
  if (!calendar.value) return
  calendar.value.selectDate(val)
}
</script>
<style lang="less" scoped>
</style>
