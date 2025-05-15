import { computed } from 'vue'
import type { Budget } from '@/types/budget'

export const useDepartmentBudget = (budgetData: Budget[]) => {
  // 部门预算分布数据
  const departmentPieData = computed(() => {
    const departmentMap = new Map<string, number>()
    budgetData.forEach((item) => {
      const amount = departmentMap.get(item.departmentName) || 0
      departmentMap.set(item.departmentName, amount + item.amount)
    })

    const filteredData = Array.from(departmentMap.entries())
      .filter(([_, amount]) => amount > 0)
      .sort((a, b) => b[1] - a[1])

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

  // 饼图配置
  const pieChartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: 'right',
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
            const label = context.label || ''
            const value = context.raw || 0
            const total = context.dataset.data.reduce((a: number, b: number) => a + b, 0)
            const percentage = ((value / total) * 100).toFixed(1)
            return `${label}: ${value.toLocaleString()}元 (${percentage}%)`
          }
        }
      }
    }
  }

  return {
    departmentPieData,
    pieChartOptions
  }
}
