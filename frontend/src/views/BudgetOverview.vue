<template>
  <div id="budgetOverviewPage" class="content-container">
    <h1>预算概览</h1>
    <div class="table-container">
      <el-table :data="tableData" :style="{ width: tableWidth + 'px' }" border>
        <el-table-column prop="date" label="日期"></el-table-column>
        <el-table-column prop="name" label="姓名"></el-table-column>
        <el-table-column prop="address" label="地址"></el-table-column>
        <el-table-column prop="phone" label="电话"></el-table-column>
        <el-table-column prop="email" label="邮箱"></el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onBeforeUnmount } from 'vue'

const tableData = ref([
  {
    date: '2023-01-01',
    name: '张三',
    address: '北京',
    phone: '123456789',
    email: 'zhangsan@example.com'
  },
  {
    date: '2023-02-01',
    name: '李四',
    address: '上海',
    phone: '987654321',
    email: 'lisi@example.com'
  }
  // 更多数据...
])

const tableWidth = ref(window.innerWidth - 50) // 设置初始表格宽度为窗口宽度减去一定的边距

// 监听窗口大小变化
const updateTableWidth = () => {
  tableWidth.value = window.innerWidth - 50 // 根据窗口宽度动态设置表格宽度
}

// 在组件挂载时添加事件监听
onMounted(() => {
  window.addEventListener('resize', updateTableWidth)
})

// 在组件卸载时移除事件监听
onBeforeUnmount(() => {
  window.removeEventListener('resize', updateTableWidth)
})
</script>

<style scoped>
.table-container {
  max-width: 100%;
  overflow-x: auto;
  padding: 10px 0;
}

.el-table {
  width: 100%;
}
</style>
