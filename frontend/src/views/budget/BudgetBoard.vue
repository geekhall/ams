<template>
  <div id="budgetBoardPage" class="content-container">
    <h1>预算概览</h1>
    <div class="chart-container">
      <!-- 第一行：部门预算分布和年度预算执行情况 -->
      <el-row :gutter="24" class="chart-section">
        <el-col :xs="24" :lg="12">
          <el-card shadow="hover" class="chart-card" v-loading="loading">
            <template #header>
              <div class="card-header">
                <span class="header-title">部门预算分布</span>
              </div>
            </template>
            <PieChart :data="departmentPieData" :options="pieChartOptions" />
          </el-card>

          <el-card shadow="hover" class="chart-card" v-loading="loading">
            <template #header>
              <div class="card-header">
                <span class="header-title">预算类型分布</span>
              </div>
            </template>
            <PieChart :data="budgetTypeData" :options="pieChartOptions" />
          </el-card>
        </el-col>
        <el-col :xs="24" :lg="12">
          <el-card shadow="hover" class="execution-card" v-loading="loading">
            <template #header>
              <div class="card-header">
                <span class="header-title">年度预算执行情况</span>
                <el-radio-group v-model="yearRange" size="small" @change="handleYearChange">
                  <el-radio-button value="2023">2024年</el-radio-button>
                  <el-radio-button value="2024">2025年</el-radio-button>
                </el-radio-group>
              </div>
            </template>
            <LineChart :data="yearlyExecutionData" :options="lineChartOptions" />
          </el-card>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import PieChart from '@/components/charts/PieChart.vue'
import LineChart from '@/components/charts/LineChart.vue'
import { type Budget } from '@/types/budget'
import { ElMessage } from 'element-plus'
import { getBudgetList } from '@/api/budget'

const loading = ref(false)
const yearRange = ref('2025')
const budgetData = ref<Budget[]>([])

// 获取预算数据
const fetchBudgetData = async () => {
  loading.value = true
  try {
    const res = await getBudgetList({
      year: parseInt(yearRange.value),
      pageIndex: 1,
      pageSize: 1000,
      innovation: '',
      tech: '1'
    })
    if (res.code === 200) {
      budgetData.value = res.data.items
      console.log('budgetData ', budgetData.value)
    } else {
      ElMessage.error(res.message || '获取预算数据失败')
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '获取预算数据失败')
  } finally {
    loading.value = false
  }
}

// 年份变化处理
const handleYearChange = () => {
  fetchBudgetData()
}

// 部门预算分布数据
const departmentPieData = computed(() => {
  if (!budgetData.value || budgetData.value.length === 0) {
    return {
      labels: ['暂无数据'],
      datasets: [
        {
          backgroundColor: ['#909399'],
          data: [1]
        }
      ]
    }
  }

  const departmentMap = new Map<string, number>()
  budgetData.value.forEach((item) => {
    if (item.departmentName && item.amount) {
      const amount = departmentMap.get(item.departmentName) || 0
      departmentMap.set(item.departmentName, amount + item.amount)
    }
  })

  const filteredData = Array.from(departmentMap.entries())
    .filter(([_, amount]) => amount > 0)
    .sort((a, b) => b[1] - a[1])

  if (filteredData.length === 0) {
    return {
      labels: ['暂无数据'],
      datasets: [
        {
          backgroundColor: ['#909399'],
          data: [1]
        }
      ]
    }
  }

  const colors = [
    '#409EFF',
    '#67C23A',
    '#E6A23C',
    '#F56C6C',
    '#909399',
    '#8E44AD',
    '#16A085',
    '#D35400',
    '#2C3E50',
    '#7F8C8D'
  ]

  return {
    labels: filteredData.map(([name]) => name),
    datasets: [
      {
        backgroundColor: colors.slice(0, filteredData.length),
        data: filteredData.map(([_, amount]) => amount)
      }
    ]
  }
})

// 按项目类型预算分布图表数据
const budgetTypeData = computed(() => {
  if (!budgetData.value || budgetData.value.length === 0) {
    return {
      labels: ['暂无数据'],
      datasets: [
        {
          backgroundColor: ['#909399'],
          data: [1]
        }
      ]
    }
  }

  const typeMap = new Map<string, number>()
  budgetData.value.forEach((item) => {
    if (item.budgetType && item.amount) {
      const amount = typeMap.get(item.budgetType) || 0
      typeMap.set(item.budgetType, amount + item.amount)
    }
  })

  const filteredData = Array.from(typeMap.entries())
    .filter(([_, amount]) => amount > 0)
    .sort((a, b) => b[1] - a[1])

  if (filteredData.length === 0) {
    return {
      labels: ['暂无数据'],
      datasets: [
        {
          backgroundColor: ['#909399'],
          data: [1]
        }
      ]
    }
  }

  return {
    labels: filteredData.map(([name]) => name),
    datasets: [
      {
        backgroundColor: [
          '#409EFF',
          '#67C23A',
          '#E6A23C',
          '#F56C6C',
          '#909399',
          '#8E44AD',
          '#16A085',
          '#D35400',
          '#2C3E50',
          '#7F8C8D'
        ],
        data: filteredData.map(([_, amount]) => amount)
      }
    ]
  }
})

// 年度预算执行情况数据
const yearlyExecutionData = computed(() => {
  const months = Array.from({ length: 12 }, (_, i) => `${i + 1}月`)
  const plannedData = Array(12).fill(0)
  const actualData = Array(12).fill(0)

  budgetData.value.forEach((item) => {
    const month = new Date(item.plannedStartDate).getMonth()
    plannedData[month] += item.amount
    // 模拟实际执行数据（实际项目中应该从后端获取）
    actualData[month] = plannedData[month] * (0.7 + Math.random() * 0.3)
  })

  return {
    labels: months,
    datasets: [
      {
        label: '计划预算',
        borderColor: '#409EFF',
        backgroundColor: 'rgba(64, 158, 255, 0.1)',
        data: plannedData,
        fill: true
      },
      {
        label: '实际执行',
        borderColor: '#67C23A',
        backgroundColor: 'rgba(103, 194, 58, 0.1)',
        data: actualData,
        fill: true
      }
    ]
  }
})

// 饼图配置
const pieChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'right' as const,
      labels: {
        padding: 20,
        font: {
          size: 12
        }
      }
    },
    tooltip: {
      callbacks: {
        label: function (context: any) {
          const label = context.label
          const value = context.raw
          const total = context.dataset.data.reduce((a: number, b: number) => a + b, 0)
          const percentage = ((value / total) * 100).toFixed(1)
          return `${label}: ${value.toLocaleString()}元 (${percentage}%)`
        }
      }
    }
  }
}

// 折线图配置
const lineChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      position: 'top'
    },
    tooltip: {
      callbacks: {
        label: function (context: any) {
          return `${context.dataset.label}: ${context.raw.toLocaleString()}元`
        }
      }
    }
  },
  scales: {
    y: {
      beginAtZero: true,
      ticks: {
        callback: function (value: any) {
          return value.toLocaleString() + '元'
        }
      }
    }
  }
}

// 在组件挂载时获取数据
onMounted(() => {
  fetchBudgetData()
})
</script>

<style scoped>
.chart-container {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.table-container {
  max-width: 100%;
  overflow-x: auto;
  padding: 10px 0;
}

.el-table {
  width: 100%;
}

.execution-card {
  margin-top: 20px;
  margin-bottom: 20px;
  min-height: 400px;
}

.chart-card {
  margin-top: 20px;
  margin-bottom: 20px;
  min-height: 400px;
}

:deep(.el-card__body) {
  height: 350px;
  padding: 20px;
}

@media screen and (max-width: 1200px) {
  .execution-card,
  .chart-card {
    min-height: 350px;
  }

  :deep(.el-card__body) {
    height: 300px;
  }
}
</style>
