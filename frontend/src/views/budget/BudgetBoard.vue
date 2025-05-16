<template>
  <div id="budgetBoardPage" class="content-container">
    <h1>预算概览</h1>
    <div class="chart-container">
      <!-- 第一行：部门预算分布和年度预算执行情况 -->
      <el-row :gutter="24" class="chart-section">
        <el-col :xs="24" :lg="12">
          <el-card shadow="hover" class="chart-card">
            <template #header>
              <div class="card-header">
                <span class="header-title">部门预算分布</span>
              </div>
            </template>
            <PieChart :data="departmentPieData" :options="pieChartOptions" />
          </el-card>

          <el-card shadow="hover" class="chart-card">
            <template #header>
              <div class="card-header">
                <span class="header-title">预算类型分布</span>
              </div>
            </template>
            <PieChart :data="budgetTypeData" :options="pieChartOptions" />
          </el-card>
        </el-col>
        <el-col :xs="24" :lg="12">
          <el-card shadow="hover" class="execution-card">
            <template #header>
              <div class="card-header">
                <span class="header-title">年度预算执行情况</span>
                <el-radio-group v-model="yearRange" size="small">
                  <el-radio-button value="2023">2023年</el-radio-button>
                  <el-radio-button value="2024">2024年</el-radio-button>
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
import { ref, onMounted, onBeforeUnmount, computed } from 'vue'
import BarChart from '@/components/charts/BarChart.vue'
import PieChart from '@/components/charts/PieChart.vue'
import LineChart from '@/components/charts/LineChart.vue'
import { getBudgetList } from '@/api/budget'
import { type Budget } from '@/types/budget'
import { ElMessage } from 'element-plus'
import { useDepartmentBudget } from '@/hooks/useDepartmentBudget'

const tableWidth = ref(window.innerWidth - 50) // 设置初始表格宽度为窗口宽度减去一定的边距

// 监听窗口大小变化
const updateTableWidth = () => {
  tableWidth.value = window.innerWidth - 50 // 根据窗口宽度动态设置表格宽度
}

// 在组件挂载时添加事件监听
onMounted(() => {
  window.addEventListener('resize', updateTableWidth)
  fetchBudgetData()
})

// 在组件卸载时移除事件监听
onBeforeUnmount(() => {
  window.removeEventListener('resize', updateTableWidth)
})
const chartTimeRange = ref('month')
// 获取预算数据
const budgetData = ref<Budget[]>([])

const fetchBudgetData = async () => {
  try {
    const res = await getBudgetDepartmentSummary({
      year: new Date().getFullYear(),
      pageIndex: 1,
      pageSize: 1000,
      innovation: '',
      tech: '1'
    })
    if (res.code === 200) {
      budgetData.value = res.data.items
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('获取预算数据失败')
  }
  // 添加临时数据
  budgetData.value = [
    {
      id: '1',
      year: 2023,
      name: '项目A',
      description: '项目A描述',
      budgetType: '软件',
      budgetCategory: '监管要求落实',
      innovation: '1',
      amount: 10000,
      departmentName: '信息科技部',
      teamName: '核心开发',
      priority: 1,
      businessPriority: '5',
      businessDescription: '业务优先级说明',
      plannedStartDate: '2023-01-15',
      remark: '备注',
      status: '正常'
    },
    {
      id: '2',
      year: 2023,
      name: '项目B',
      description: '项目B描述',
      budgetType: '硬件',
      budgetCategory: '监管要求落实',
      innovation: '0',
      amount: 20000,
      departmentName: '市场部',
      teamName: '市场团队',
      priority: 0,
      businessPriority: '3',
      businessDescription: '业务优先级说明',
      plannedStartDate: '2023-02-20',
      remark: '备注',
      status: '正常'
    },
    {
      id: '3',
      year: 2023,
      name: '项目C',
      description: '项目C描述',
      budgetType: '服务',
      budgetCategory: '监管要求落实',
      innovation: '1',
      amount: 15000,
      departmentName: '财务部',
      teamName: '财务团队',
      priority: 1,
      businessPriority: '4',
      businessDescription: '业务优先级说明',
      plannedStartDate: '2023-03-10',
      remark: '备注',
      status: '正常'
    },
    {
      id: '4',
      year: 2023,
      name: '项目D',
      description: '项目D描述',
      budgetType: '软件',
      budgetCategory: '监管要求落实',
      innovation: '0',
      amount: 12000,
      departmentName: '人事部',
      teamName: '人事团队',
      priority: 0,
      businessPriority: '2',
      businessDescription: '业务优先级说明',
      plannedStartDate: '2023-04-05',
      remark: '备注',
      status: '正常'
    },
    {
      id: '5',
      year: 2023,
      name: '项目E',
      description: '项目E描述',
      budgetType: '硬件',
      budgetCategory: '监管要求落实',
      innovation: '1',
      amount: 18000,
      departmentName: '信息科技部',
      teamName: '核心开发',
      priority: 1,
      businessPriority: '1',
      businessDescription: '业务优先级说明',
      plannedStartDate: '2023-05-15',
      remark: '备注',
      status: '正常'
    }
  ]
}

// 使用部门预算 hook
const { departmentPieData, pieChartOptions } = useDepartmentBudget(budgetData)

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

// 按月份预算趋势图表数据
const monthlyChartData = computed(() => {
  const monthlyMap = new Map<string, number>()
  budgetData.value.forEach((item) => {
    const month = new Date(item.plannedStartDate).getMonth() + 1
    const monthKey = `${month}月`
    const amount = monthlyMap.get(monthKey) || 0
    monthlyMap.set(monthKey, amount + item.amount)
  })
  const months = Array.from({ length: 12 }, (_, i) => `${i + 1}月`)
  const data = months.map((month) => monthlyMap.get(month) || 0)
  return {
    labels: months,
    datasets: [
      {
        label: '预算金额',
        backgroundColor: '#f87979',
        data: data
      }
    ]
  }
})

const yearRange = ref('2024')

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

// 月度预算趋势数据
const monthlyTrendData = computed(() => {
  const months = Array.from({ length: 12 }, (_, i) => `${i + 1}月`)
  const data = Array(12).fill(0)

  budgetData.value.forEach((item) => {
    const month = new Date(item.plannedStartDate).getMonth()
    data[month] += item.amount
  })

  return {
    labels: months,
    datasets: [
      {
        label: '预算金额',
        borderColor: '#409EFF',
        backgroundColor: 'rgba(64, 158, 255, 0.2)',
        data: data,
        fill: true,
        tension: 0.4,
        pointRadius: 4,
        pointHoverRadius: 6
      }
    ]
  }
})

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

// 面积图配置
const areaChartOptions = {
  responsive: true,
  maintainAspectRatio: false,
  plugins: {
    legend: {
      display: false
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
      },
      grid: {
        color: 'rgba(0, 0, 0, 0.05)'
      }
    },
    x: {
      grid: {
        display: false
      }
    }
  },
  elements: {
    line: {
      borderWidth: 2
    },
    point: {
      backgroundColor: '#409EFF',
      borderColor: '#fff',
      borderWidth: 2
    }
  }
}
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
