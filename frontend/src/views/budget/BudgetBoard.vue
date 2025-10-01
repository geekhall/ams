<template>
  <!-- 仅管理员可见预算概览内容 -->
  <div id="budgetBoardPage" class="content-container" v-if="isAdmin">
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
                <span class="header-title">年度预算使用情况</span>
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
  <!-- 非管理员显示无权限提示 -->
  <div v-else class="no-permission">
    <p>您没有权限查看预算概览页面，仅管理员可访问。</p>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted, computed } from 'vue'
import PieChart from '@/components/charts/PieChart.vue'
import LineChart from '@/components/charts/LineChart.vue'
import { type Budget } from '@/types/budget'
import { ElMessage } from 'element-plus'
import { getBudgetList } from '@/api/budget'
// 导入用户状态和权限类型
import { useUserStore } from '@/stores/user'
import { PermissionType, UserRole  } from '@/types/user'
import { hasPermission } from '@/utils/permission'

const loading = ref(false)
const yearRange = ref('2025')
const budgetData = ref<Budget[]>([])


// 用户状态
const userStore = useUserStore()

// 判断是否有“查看所有数据”的权限
const hasAllDataPermission  = computed(() => {
  return hasPermission(userStore.userInfo, PermissionType.DATA_ALL)
})

// 0928新增：判断用户是否为管理员（ROLE_ADMIN角色）
const isAdmin = computed(() => {
  // 检查用户角色列表是否包含ROLE_ADMIN（管理员标识）
  return userStore.userInfo?.roles?.includes(UserRole.ADMIN) || false
})

// 获取当前用户所属部门
const userDepartment = computed(() => {
  return userStore.userInfo?.department || ''
})

// 获取预算数据
const fetchBudgetData = async () => {
  loading.value = true
  try {
    const res = await getBudgetList({
      year: parseInt(yearRange.value),
      pageIndex: 1,
      pageSize: 1000,
      innovation: '',
      tech: '',
      // 概览页面无需筛选器，直接按用户权限自动筛选，普通用户仅看本部门数据。
      departmentName: hasAllDataPermission.value ? '' : userDepartment.value
    })
    if (res.code === 200) {
      budgetData.value = res.data.items
      // console.log('budgetData ', budgetData.value)
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

  // 使用更现代的配色方案
  const colors = [
    '#3B82F6', // 蓝色
    '#10B981', // 绿色
    '#F59E0B', // 橙色
    '#EF4444', // 红色
    '#8B5CF6', // 紫色
    '#EC4899', // 粉色
    '#06B6D4', // 青色
    '#F97316', // 深橙色
    '#6366F1', // 靛蓝色
    '#14B8A6' // 青绿色
  ]

  return {
    labels: filteredData.map(([name]) => name),
    datasets: [
      {
        backgroundColor: colors.slice(0, filteredData.length),
        data: filteredData.map(([_, amount]) => amount),
        borderWidth: 2,
        borderColor: '#ffffff'
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
        borderColor: '#3B82F6',
        backgroundColor: 'rgba(59, 130, 246, 0.1)',
        data: plannedData,
        fill: true
      },
      {
        label: '实际执行',
        borderColor: '#10B981',
        backgroundColor: 'rgba(16, 185, 129, 0.1)',
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
  cutout: '60%',
  animation: {
    animateScale: true,
    animateRotate: true,
    duration: 1000,
    easing: 'easeOutQuart' as const
  },
  plugins: {
    legend: {
      position: 'right' as const,
      labels: {
        padding: 20,
        font: {
          size: 13,
          family: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
          weight: 'bold' as const
        },
        usePointStyle: true,
        pointStyle: 'circle'
      }
    },
    tooltip: {
      backgroundColor: 'rgba(0, 0, 0, 0.8)',
      padding: 12,
      titleFont: {
        size: 14,
        weight: 'bold' as const
      },
      bodyFont: {
        size: 13
      },
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
  animation: {
    duration: 1000,
    easing: 'easeOutQuart' as const
  },
  interaction: {
    intersect: false,
    mode: 'index' as const
  },
  plugins: {
    legend: {
      position: 'top' as const,
      labels: {
        padding: 20,
        font: {
          size: 13,
          family: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif",
          weight: 'bold' as const
        },
        usePointStyle: true,
        pointStyle: 'circle'
      }
    },
    tooltip: {
      backgroundColor: 'rgba(0, 0, 0, 0.8)',
      padding: 12,
      titleFont: {
        size: 14,
        weight: 'bold' as const
      },
      bodyFont: {
        size: 13
      },
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
      grid: {
        color: 'rgba(0, 0, 0, 0.05)',
        drawBorder: false
      },
      ticks: {
        padding: 10,
        font: {
          size: 12,
          family: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
        },
        callback: function (value: any) {
          return value.toLocaleString() + '元'
        }
      }
    },
    x: {
      grid: {
        display: false
      },
      ticks: {
        padding: 10,
        font: {
          size: 12,
          family: "'Helvetica Neue', 'Helvetica', 'Arial', sans-serif"
        }
      }
    }
  },
  elements: {
    line: {
      tension: 0.4,
      borderWidth: 2
    },
    point: {
      radius: 4,
      hoverRadius: 6,
      borderWidth: 2
    }
  }
}

// 在组件挂载时获取数据（仅管理员加载0928）
// onMounted(() => {
//   fetchBudgetData()
// })
onMounted(() => {
  if (isAdmin.value) { // 仅当用户是管理员时，才加载数据
    fetchBudgetData()
  }
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
  padding: 16px 20px;
  border-bottom: 1px solid #f0f0f0;
}

.header-title {
  font-size: 16px;
  font-weight: 600;
  color: #1f2937;
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
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.execution-card:hover {
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.chart-card {
  margin-top: 20px;
  margin-bottom: 20px;
  min-height: 400px;
  border-radius: 8px;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  transition: all 0.3s ease;
}

.chart-card:hover {
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

:deep(.el-card__body) {
  height: 350px;
  padding: 20px;
}

:deep(.el-card__header) {
  padding: 0;
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
/* 新增：无权限提示样式 */
.no-permission {
  padding: 60px 20px;
  text-align: center;
  color: #666;
  font-size: 16px;
  background-color: #fff;
  border-radius: 8px;
  margin: 20px;
  min-height: 400px;
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
