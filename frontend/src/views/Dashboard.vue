<template>
  <div id="dashboardPage" class="content-container">
    <!-- 顶部数据概览 -->
    <el-row :gutter="24" class="data-overview">
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card shadow="hover" class="overview-card" @click="router.push('/asset')">
          <div class="overview-item">
            <div class="overview-icon" style="background: var(--el-color-primary-light-8)">
              <el-icon><Box /></el-icon>
            </div>
            <div class="overview-info">
              <div class="overview-title">资产总数</div>
              <div class="overview-value">{{ formatNumber(assetStats.totalCount) }}</div>
              <div class="overview-footer">
                <span :class="assetStats.monthlyCountGrowth >= 0 ? 'trend-up' : 'trend-down'">
                  <el-icon>
                    <component :is="assetStats.monthlyCountGrowth >= 0 ? 'ArrowUp' : 'ArrowDown'" />
                  </el-icon>
                  {{ Math.abs(assetStats.monthlyCountGrowth).toFixed(1) }}%
                </span>
                较上月
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card shadow="hover" class="overview-card" @click="router.push('/asset')">
          <div class="overview-item">
            <div class="overview-icon" style="background: var(--el-color-success-light-8)">
              <el-icon><Money /></el-icon>
            </div>
            <div class="overview-info">
              <div class="overview-title">资产总值</div>
              <div class="overview-value">{{ formatCurrency(assetStats.totalValue) }}</div>
              <div class="overview-footer">
                <span :class="assetStats.monthlyValueGrowth >= 0 ? 'trend-up' : 'trend-down'">
                  <el-icon>
                    <component :is="assetStats.monthlyValueGrowth >= 0 ? 'ArrowUp' : 'ArrowDown'" />
                  </el-icon>
                  {{ Math.abs(assetStats.monthlyValueGrowth).toFixed(1) }}%
                </span>
                较上月
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card shadow="hover" class="overview-card" @click="router.push('/profile')">
          <div class="overview-item">
            <div class="overview-icon" style="background: var(--el-color-warning-light-8)">
              <el-icon><Warning /></el-icon>
            </div>
            <div class="overview-info">
              <div class="overview-title">待处理事项</div>
              <div class="overview-value">12</div>
              <div class="overview-footer">
                <span class="trend-down">
                  <el-icon><ArrowDown /></el-icon>
                  3.2%
                </span>
                较上周
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :xs="24" :sm="12" :md="6" :lg="6" :xl="6">
        <el-card shadow="hover" class="overview-card" @click="router.push('/message')">
          <div class="overview-item">
            <div class="overview-icon" style="background: var(--el-color-danger-light-8)">
              <el-icon><Bell /></el-icon>
            </div>
            <div class="overview-info">
              <div class="overview-title">系统消息</div>
              <div class="overview-value">{{ totalMessage }}</div>
              <div class="overview-footer">
                <span class="trend-up">
                  <el-icon><ArrowUp /></el-icon>
                  5.6%
                </span>
                较昨日
              </div>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 图表区域 -->
    <el-row :gutter="24" class="chart-section">
      <el-col :xs="24" :lg="12">
        <el-card shadow="hover" class="chart-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">资产类型分布</span>
            </div>
          </template>
          <div ref="typeChartRef" class="chart"></div>
        </el-card>
      </el-col>
      <el-col :xs="24" :lg="12">
        <el-card shadow="hover" class="chart-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">资产部门分布</span>
            </div>
          </template>
          <div ref="statusChartRef" class="chart"></div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 待办事项和系统公告 -->
    <el-row :gutter="24" class="bottom-section">
      <el-col :xs="24" :lg="12">
        <el-card shadow="hover" class="todo-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">待办事项</span>
              <el-button type="primary" link>
                <el-icon><Plus /></el-icon>
                添加
              </el-button>
            </div>
          </template>
          <el-table :data="todoList" style="width: 100%" :show-header="false">
            <el-table-column width="50">
              <template #default="scope">
                <el-checkbox v-model="scope.row.status" />
              </template>
            </el-table-column>
            <el-table-column>
              <template #default="scope">
                <div class="todo-item" :class="{ 'todo-item-done': scope.row.status }">
                  {{ scope.row.title }}
                </div>
              </template>
            </el-table-column>
            <el-table-column width="100">
              <template #default="scope">
                <el-tag size="small" :type="scope.row.priority" effect="plain">
                  {{ scope.row.priorityText }}
                </el-tag>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
      <el-col :xs="24" :lg="12">
        <el-card shadow="hover" class="notice-card">
          <template #header>
            <div class="card-header">
              <span class="header-title">系统公告</span>
              <el-button type="primary" link>更多</el-button>
            </div>
          </template>
          <div class="notice-list">
            <div v-for="notice in notices" :key="notice.id" class="notice-item">
              <el-tag size="small" :type="notice.type" effect="plain">{{ notice.tag }}</el-tag>
              <span class="notice-title">{{ notice.title }}</span>
              <span class="notice-time">{{ notice.time }}</span>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 快捷操作区 -->
    <el-row :gutter="24" class="quick-actions">
      <el-col
        :xs="24"
        :sm="12"
        :md="8"
        :lg="6"
        :xl="4"
        v-for="action in quickActions"
        :key="action.title"
      >
        <el-card shadow="hover" class="action-card" @click="handleQuickAction(action)">
          <el-icon class="action-icon" :style="{ background: action.bgColor }">
            <component :is="action.icon" />
          </el-icon>
          <span class="action-title">{{ action.title }}</span>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted, onUnmounted } from 'vue'
import * as echarts from 'echarts'
import { useMessage } from '@/hooks/useMessage'
import { getAssetSummary, getAssetTypeSummaryList, getDepartmentSummary } from '@/api/asset'
import {
  AssetSummaryResponse,
  AssetTypeSummary,
  DepartmentSummaryResponse,
  DepartmentSummary
} from '@/types/asset'
import { Box, Money, Warning, Bell, ArrowUp, ArrowDown, Plus } from '@element-plus/icons-vue'
import { useRouter } from 'vue-router'

const { getMessageCount } = useMessage()
const totalMessage = ref(0)
const departmentSummary = ref<DepartmentSummary[]>([])

// 资产统计数据
const assetStats = reactive({
  totalCount: 0,
  totalValue: 0,
  monthlyCountGrowth: 0,
  monthlyValueGrowth: 0
})

// 待办事项数据
const todoList = reactive([
  {
    title: '审核资产采购申请',
    status: false,
    priority: 'danger',
    priorityText: '紧急'
  },
  {
    title: '更新资产分类信息',
    status: false,
    priority: 'warning',
    priorityText: '重要'
  },
  {
    title: '处理资产调拨申请',
    status: false,
    priority: 'info',
    priorityText: '普通'
  },
  {
    title: '完成月度资产盘点',
    status: false,
    priority: 'warning',
    priorityText: '重要'
  }
])

// 系统公告数据
const notices = reactive([
  {
    id: 1,
    title: '系统将于本周六进行例行维护',
    type: 'warning',
    tag: '系统维护',
    time: '2024-03-20'
  },
  {
    id: 2,
    title: '新版资产管理系统使用指南已发布',
    type: 'success',
    tag: '更新通知',
    time: '2024-03-19'
  },
  {
    id: 3,
    title: '关于资产盘点工作的通知',
    type: 'info',
    tag: '工作通知',
    time: '2024-03-18'
  },
  {
    id: 4,
    title: '系统功能优化公告',
    type: 'success',
    tag: '更新通知',
    time: '2025-03-18'
  }
])

// 快捷操作数据
const quickActions = reactive([
  {
    title: '资产登记',
    icon: 'Document',
    bgColor: 'var(--el-color-primary-light-8)',
    route: '/asset'
  },
  {
    title: '资产查询',
    icon: 'Search',
    bgColor: 'var(--el-color-success-light-8)',
    route: '/asset'
  },
  {
    title: '资产盘点',
    icon: 'List',
    bgColor: 'var(--el-color-warning-light-8)',
    route: '/asset'
  },
  {
    title: '数据导入',
    icon: 'Upload',
    bgColor: 'var(--el-color-info-light-8)',
    route: '/asset'
  },
  {
    title: '用户管理',
    icon: 'User',
    bgColor: 'var(--el-color-danger-light-8)',
    route: '/user'
  },
  {
    title: '系统设置',
    icon: 'Setting',
    bgColor: 'var(--el-color-primary-light-8)',
    route: '/setting'
  }
])

// 图表相关
const typeChartRef = ref<HTMLElement>()
const statusChartRef = ref<HTMLElement>()
let typeChart: echarts.ECharts | null = null
let statusChart: echarts.ECharts | null = null

// 初始化资产类型分布图表
const initTypeChart = (data: AssetTypeSummary[]) => {
  if (!typeChartRef.value) return

  typeChart = echarts.init(typeChartRef.value)
  const option = {
    tooltip: {
      trigger: 'item',
      formatter: '{b}: {c} ({d}%)'
    },
    legend: {
      orient: 'vertical',
      left: '5%',
      top: 'center',
      itemWidth: 12,
      itemHeight: 12,
      textStyle: {
        fontSize: 13,
        color: '#606266'
      },
      itemGap: 15
    },
    series: [
      {
        type: 'pie',
        radius: ['40%', '65%'],
        center: ['65%', '50%'],
        avoidLabelOverlap: false,
        itemStyle: {
          borderRadius: 8,
          borderColor: '#fff',
          borderWidth: 2
        },
        label: {
          show: true,
          position: 'outside',
          formatter: '{b}\n{d}%',
          fontSize: 13,
          color: '#606266',
          lineHeight: 18
        },
        emphasis: {
          scale: true,
          scaleSize: 5,
          label: {
            show: true,
            fontSize: 14,
            fontWeight: 'bold',
            color: '#303133'
          }
        },
        data: data.map((item) => ({
          name: item.name,
          value: item.assetCount || 0
        }))
      }
    ]
  }
  typeChart.setOption(option)
}

// 初始化资产状态分布图表
const initStatusChart = () => {
  if (!statusChartRef.value) return

  // 过滤掉资产数量为0的部门
  const filteredData = departmentSummary.value.filter((item) => item.assetCount > 0)

  statusChart = echarts.init(statusChartRef.value)
  const option = {
    tooltip: {
      trigger: 'axis',
      axisPointer: {
        type: 'shadow'
      },
      formatter: '{b}: {c} 台'
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '15%',
      top: '8%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: filteredData.map((item) => item.name),
      axisLabel: {
        interval: 0,
        rotate: 45,
        fontSize: 12,
        color: '#606266',
        margin: 15,
        width: 80,
        overflow: 'truncate'
      },
      axisLine: {
        lineStyle: {
          color: '#DCDFE6'
        }
      }
    },
    yAxis: {
      type: 'value',
      name: '资产数量',
      nameTextStyle: {
        fontSize: 13,
        color: '#606266',
        padding: [0, 0, 0, 40]
      },
      axisLabel: {
        fontSize: 13,
        color: '#606266'
      },
      splitLine: {
        lineStyle: {
          color: '#EBEEF5'
        }
      }
    },
    series: [
      {
        type: 'bar',
        data: filteredData.map((item) => item.assetCount),
        barWidth: '30%',
        itemStyle: {
          color: function (params: any) {
            const colors = ['#409EFF', '#67C23A', '#E6A23C', '#F56C6C', '#909399']
            return colors[params.dataIndex % colors.length]
          },
          borderRadius: [4, 4, 0, 0]
        },
        label: {
          show: true,
          position: 'top',
          fontSize: 12,
          color: '#606266',
          formatter: '{c} 台',
          distance: 5
        }
      }
    ]
  }
  statusChart.setOption(option)
}

// 获取资产类型数据并更新图表
const fetchAssetTypeData = async () => {
  try {
    const res = await getAssetTypeSummaryList()
    if (res.code === 200) {
      initTypeChart(res.data)
    }
  } catch (error) {
    console.error('获取资产类型数据失败:', error)
  }
}

// 监听窗口大小变化
const handleResize = () => {
  typeChart?.resize()
  statusChart?.resize()
}

// 格式化数字
const formatNumber = (num: number) => {
  return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}

// 格式化金额
const formatCurrency = (num: number) => {
  if (num >= 100000000) {
    return `¥ ${(num / 100000000).toFixed(2)}亿`
  } else if (num >= 10000) {
    return `¥ ${(num / 10000).toFixed(2)}万`
  }
  return `¥ ${num.toFixed(2)}`
}

// 获取资产统计数据
const fetchAssetSummary = async () => {
  try {
    const res: AssetSummaryResponse = await getAssetSummary()
    if (res.code === 200) {
      Object.assign(assetStats, res.data)
    }
  } catch (error) {
    console.error('获取资产统计数据失败:', error)
  }
}

// 获取部门统计数据
const fetchDepartmentSummary = async () => {
  try {
    const res: DepartmentSummaryResponse = await getDepartmentSummary()
    if (res.code === 200) {
      departmentSummary.value = res.data
    }
  } catch (error) {
    console.error('获取部门统计数据失败:', error)
  }
}

// 处理快捷操作点击
const router = useRouter()
const handleQuickAction = (action: any) => {
  if (action.route) {
    router.push(action.route)
  }
}

onMounted(async () => {
  await Promise.all([
    getMessageCount().then((count) => (totalMessage.value = count)),
    fetchAssetSummary(),
    fetchAssetTypeData(),
    fetchDepartmentSummary()
  ])

  initStatusChart()
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  typeChart?.dispose()
  statusChart?.dispose()
})
</script>

<style lang="less" scoped>
.content-container {
  padding: 24px;
  background-color: var(--el-bg-color-page);
  min-height: calc(100vh - 60px);
}

// 数据概览卡片样式
.data-overview {
  margin-bottom: 24px;

  .overview-card {
    height: 120px;
    transition: all 0.3s ease;
    cursor: pointer;

    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }
  }

  .overview-item {
    display: flex;
    align-items: center;
    height: 100%;
    padding: 0 20px;
  }

  .overview-icon {
    width: 64px;
    height: 64px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 16px;

    .el-icon {
      font-size: 32px;
      color: var(--el-text-color-primary);
    }
  }

  .overview-info {
    flex: 1;
  }

  .overview-title {
    font-size: 14px;
    color: var(--el-text-color-secondary);
    margin-bottom: 8px;
  }

  .overview-value {
    font-size: 24px;
    font-weight: 600;
    color: var(--el-text-color-primary);
    margin-bottom: 8px;
  }

  .overview-footer {
    font-size: 12px;
    color: var(--el-text-color-secondary);

    .trend-up {
      color: var(--el-color-success);
      margin-right: 4px;
    }

    .trend-down {
      color: var(--el-color-danger);
      margin-right: 4px;
    }
  }
}

// 图表区域样式
.chart-section {
  margin-bottom: 24px;

  .chart-card {
    .card-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px 20px;
      border-bottom: 1px solid var(--el-border-color-lighter);

      .header-title {
        font-size: 16px;
        font-weight: 600;
        color: var(--el-text-color-primary);
      }
    }
  }

  .chart {
    height: 350px;
    padding: 20px;
  }
}

// 底部区域样式
.bottom-section {
  margin-bottom: 24px;

  .todo-card,
  .notice-card {
    .card-header {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 16px 20px;
      border-bottom: 1px solid var(--el-border-color-lighter);

      .header-title {
        font-size: 16px;
        font-weight: 600;
        color: var(--el-text-color-primary);
      }
    }
  }

  .todo-item {
    font-size: 14px;
    color: var(--el-text-color-primary);
    transition: all 0.3s ease;

    &:hover {
      color: var(--el-color-primary);
    }

    &.todo-item-done {
      text-decoration: line-through;
      color: var(--el-text-color-secondary);
    }
  }

  .notice-list {
    padding: 0 20px;

    .notice-item {
      display: flex;
      align-items: center;
      padding: 12px 0;
      border-bottom: 1px solid var(--el-border-color-lighter);

      &:last-child {
        border-bottom: none;
      }

      .notice-title {
        flex: 1;
        margin: 0 12px;
        font-size: 14px;
        color: var(--el-text-color-primary);
      }

      .notice-time {
        font-size: 12px;
        color: var(--el-text-color-secondary);
      }
    }
  }
}

// 快捷操作区样式
.quick-actions {
  .action-card {
    height: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: all 0.3s ease;

    &:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    }

    .action-icon {
      width: 48px;
      height: 48px;
      border-radius: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
      margin-bottom: 12px;

      .el-icon {
        font-size: 24px;
        color: var(--el-text-color-primary);
      }
    }

    .action-title {
      font-size: 14px;
      color: var(--el-text-color-primary);
    }
  }
}

// 响应式适配
@media screen and (max-width: 768px) {
  .content-container {
    padding: 16px;
  }

  .overview-card {
    margin-bottom: 16px;
  }

  .chart {
    height: 300px;
  }

  .action-card {
    margin-bottom: 16px;
  }
}
</style>
