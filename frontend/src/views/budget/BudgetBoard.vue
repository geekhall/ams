<template>
  <div id="budgetBoardPage" class="content-container">
    <h1>预算概览</h1>
    <div class="chart-container">
      <el-row :gutter="20">
        <el-col :span="12">
          <el-card shadow="hover">
            <template #header>
              <div class="card-header">
                <span>按部门预算金额</span>
              </div>
            </template>
            <BarChart :data="departmentChartData" :options="chartOptions" />
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card shadow="hover">
            <template #header>
              <div class="card-header">
                <span>按项目类型预算分布</span>
              </div>
            </template>
            <PieChart :data="typeChartData" :options="chartOptions" />
          </el-card>
        </el-col>
      </el-row>
      <el-row :gutter="20" style="margin-top: 20px">
        <el-col :span="24">
          <el-card shadow="hover">
            <template #header>
              <div class="card-header">
                <span>按月份预算趋势</span>
              </div>
            </template>
            <LineChart :data="monthlyChartData" :options="chartOptions" />
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

// 获取预算数据
const budgetData = ref<Budget[]>([])

const fetchBudgetData = async () => {
  try {
    const res = await getBudgetList({
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

// 按部门预算金额图表数据
const departmentChartData = computed(() => {
  const departmentMap = new Map<string, number>()
  budgetData.value.forEach((item) => {
    const amount = departmentMap.get(item.departmentName) || 0
    departmentMap.set(item.departmentName, amount + item.amount)
  })
  return {
    labels: Array.from(departmentMap.keys()),
    datasets: [
      {
        label: '预算金额',
        backgroundColor: '#f87979',
        data: Array.from(departmentMap.values())
      }
    ]
  }
})

// 按项目类型预算分布图表数据
const typeChartData = computed(() => {
  const typeMap = new Map<string, number>()
  budgetData.value.forEach((item) => {
    const amount = typeMap.get(item.budgetType) || 0
    typeMap.set(item.budgetType, amount + item.amount)
  })
  return {
    labels: Array.from(typeMap.keys()),
    datasets: [
      {
        backgroundColor: ['#41B883', '#E46651', '#00D8FF', '#DD1B16', '#7C8CF8'],
        data: Array.from(typeMap.values())
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

// 图表通用配置
const chartOptions = {
  responsive: true,
  maintainAspectRatio: false
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
</style>
