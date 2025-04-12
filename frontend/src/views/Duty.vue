<template>
  <div id="dutyPage" class="content-container">
    <h1>值班表</h1>
    <!-- <el-calendar ref="calendar">
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
    </el-calendar> -->
    <el-calendar>
      <template #date-cell="{ data }">
        <p :class="data.isSelected ? 'is-selected' : ''">
          {{ data.day.split('-').slice(1).join('/') }}
          <br />
          {{ getDutyInfo(data.day)?.day || '无白班信息' }}
          <br />
          {{ getDutyInfo(data.day)?.night || '无夜班信息' }}
          <br />
          {{ getDutyInfo(data.day)?.core || '无值班信息' }}
        </p>
      </template>
    </el-calendar>
  </div>
</template>

<script lang="ts" setup>
import { ref, computed } from 'vue'
import type { CalendarDateType, CalendarInstance } from 'element-plus'
const dutyData = ref([
  {
    date: '2025-04-06',
    day: '白班：张三',
    night: '夜班：李四',
    core: '核心值班：银洋'
  },
  {
    date: '2025-04-07',
    day: '白班：王五',
    night: '夜班：赵六',
    core: '核心值班：银洋'
  },
  {
    date: '2025-04-08',
    day: '白班：钱七',
    night: '夜班：孙八'
  },
  {
    date: '2025-04-09',
    day: '白班：周九',
    night: '夜班：吴十'
  },
  {
    date: '2025-04-10',
    day: '白班：郑十一',
    night: '夜班：冯十二'
  },
  {
    date: '2025-04-11',
    day: '白班：陈十三',
    night: '夜班：褚十四'
  },
  {
    date: '2025-04-12',
    day: '白班：卫十五',
    night: '夜班：蒋十六'
  },
  {
    date: '2025-04-13',
    day: '白班：沈十七',
    night: '夜班：韩十八'
  },
  {
    date: '2025-04-14',
    day: '白班：杨十九',
    night: '夜班：朱二十'
  }
])
const getDutyInfo = (date: string) => {
  return dutyData.value.find((item) => item.date === date)
}

const selectedDate = ref(new Date())
const isSpecialDate = (date: Date) => {
  const specialDates = [3, 15, 20] // 特定日期数组
  return specialDates.includes(date.getDate())
}
const isWeekend = (date: Date) => {
  const day = date.getDay()
  return day === 0 || day === 6 // 周末
}
const isToday = (date: Date) => {
  const today = new Date()
  return (
    date.getDate() === today.getDate() &&
    date.getMonth() === today.getMonth() &&
    date.getFullYear() === today.getFullYear()
  )
}

const calendar = ref<CalendarInstance>()
const selectDate = (val: CalendarDateType) => {
  if (!calendar.value) return
  calendar.value.selectDate(val)
}
</script>
<style lang="less" scoped>
.is-selected {
  color: #1989fa;
}
</style>
