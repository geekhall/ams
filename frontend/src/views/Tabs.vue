<template>
  <div id="tabsPage" class="content-container">
    <el-tabs v-model="activeTab" class="custom-tabs">
      <el-tab-pane :label="`未读消息(${state.unread.length})`" name="unread">
        <el-table :data="state.unread" :show-header="false" style="width: 100%">
          <el-table-column>
            <template #default="scope">
              <span class="message-title">{{ scope.row.title }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="send_time" width="180"></el-table-column>
          <el-table-column width="120">
            <template #default="scope">
              <el-button size="small" @click="handleRead(scope.row)">标为已读</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="handle-row">
          <el-button type="primary" @click="handleReadAll">全部标为已读</el-button>
        </div>
      </el-tab-pane>
      <el-tab-pane :label="`已读消息(${state.read.length})`" name="read">
        <el-table :data="state.read" :show-header="false" style="width: 100%">
          <el-table-column>
            <template #default="scope">
              <span class="message-title">{{ scope.row.title }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="send_time" width="150"></el-table-column>
          <el-table-column width="120">
            <template #default="scope">
              <el-button type="danger" @click="handleDel(scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="handle-row">
          <el-button type="danger" @click="handleDelAll">删除全部</el-button>
        </div>
      </el-tab-pane>
      <el-tab-pane :label="`回收站(${state.recycle.length})`" name="recycle">
        <el-table :data="state.recycle" :show-header="false" style="width: 100%">
          <el-table-column>
            <template #default="scope">
              <span class="message-title">{{ scope.row.title }}</span>
            </template>
          </el-table-column>
          <el-table-column prop="send_time" width="150"></el-table-column>
          <el-table-column width="120">
            <template #default="scope">
              <el-button @click="handleRestore(scope.row)">还原</el-button>
            </template>
          </el-table-column>
        </el-table>
        <div class="handle-row">
          <el-button type="danger" @click="handleClearRecycle">清空回收站</el-button>
        </div>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script setup lang="ts" name="tabs">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useMessage } from '@/hooks/useMessage'
import { MessageDTO } from '@/types/message'
import { useUserStore } from '@/stores/user'

const userStore = useUserStore()
const activeTab = ref('unread')
const { messages, fetchMessages, getMessageCount, updateMessageStatus } = useMessage()

const state = reactive({
  unread: [] as MessageDTO[],
  read: [] as MessageDTO[],
  recycle: [] as MessageDTO[]
})

// 处理单条消息标为已读
const handleRead = async (message: MessageDTO) => {
  const index = state.unread.findIndex((item) => item.id === message.id)
  if (index > -1) {
    const item = state.unread.splice(index, 1)[0]
    console.log('item:', item)

    item.status = 1
    const user_id = userStore.userInfo.id || ''
    // 调用接口更新消息状态
    await updateMessageStatus(user_id, message.id, item.status)

    // 更新本地状态
    state.read.unshift(item)
    ElMessage.success('已标为已读')
  }
}

// 处理全部标为已读
const handleReadAll = () => {
  if (state.unread.length === 0) {
    ElMessage.warning('没有未读消息')
    return
  }

  ElMessageBox.confirm('确定将所有消息标为已读吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  })
    .then(() => {
      const items = state.unread.map((item) => ({ ...item, status: 1 }))
      state.read = [...items, ...state.read]
      state.unread = []
      ElMessage.success('已全部标为已读')
    })
    .catch(() => {})
}

// 处理删除单条消息
const handleDel = (message: MessageDTO) => {
  const index = state.read.findIndex((item) => item.id === message.id)
  if (index > -1) {
    const item = state.read.splice(index, 1)[0]
    item.status = 2
    state.recycle.unshift(item)
    ElMessage.success('已删除')
  }
}

// 处理删除全部消息
const handleDelAll = () => {
  if (state.read.length === 0) {
    ElMessage.warning('没有已读消息')
    return
  }

  ElMessageBox.confirm('确定删除所有已读消息吗？', '提示', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  })
    .then(() => {
      const items = state.read.map((item) => ({ ...item, status: 2 }))
      state.recycle = [...items, ...state.recycle]
      state.read = []
      ElMessage.success('已全部删除')
    })
    .catch(() => {})
}

// 处理还原消息
const handleRestore = (message: MessageDTO) => {
  const index = state.recycle.findIndex((item) => item.id === message.id)
  if (index > -1) {
    const item = state.recycle.splice(index, 1)[0]
    item.status = 1
    state.read.unshift(item)
    ElMessage.success('已还原')
  }
}

// 处理清空回收站
const handleClearRecycle = () => {
  if (state.recycle.length === 0) {
    ElMessage.warning('回收站为空')
    return
  }

  ElMessageBox.confirm('确定清空回收站吗？此操作不可恢复', '警告', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  })
    .then(() => {
      state.recycle = []
      ElMessage.success('回收站已清空')
    })
    .catch(() => {})
}

// 初始化数据
onMounted(async () => {
  try {
    await fetchMessages()
    console.log('messages after fetch:', messages.value)
    state.unread = messages.value.filter((item) => item.status === 0)
    state.read = messages.value.filter((item) => item.status === 1)
    state.recycle = messages.value.filter((item) => item.status === 2)
    console.log('state after filter:', state)
  } catch (error) {
    ElMessage.error('获取消息失败')
    console.error('Failed to fetch messages:', error)
  }
})
</script>

<style lang="less" scoped>
.content-container {
  padding: 24px;
  background-color: var(--el-bg-color-page);
  min-height: calc(100vh - 60px);
}

.message-title {
  cursor: pointer;
  color: var(--el-text-color-primary);
  transition: color 0.3s ease;

  &:hover {
    color: var(--el-color-primary);
  }
}

.handle-row {
  margin-top: 30px;
  text-align: center;
}

/* 优化 Tab 标签样式 */
.custom-tabs {
  width: 100%;
}

:deep(.el-tabs__header) {
  margin-bottom: 20px;
}

:deep(.el-tabs__nav-wrap) {
  padding: 0 4px;
}

:deep(.el-tabs__item) {
  height: 40px;
  line-height: 40px;
  font-size: 14px;
  transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
  min-width: 120px;
  text-align: center;
}

:deep(.el-tabs__item.is-active) {
  font-weight: 500;
}

:deep(.el-tabs__active-bar) {
  transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
}

/* 优化内容区域过渡 */
:deep(.el-tab-pane) {
  transition: opacity 0.3s ease-in-out;
}

/* 防止内容闪烁 */
:deep(.el-tabs__content) {
  overflow: hidden;
  position: relative;
}

/* 优化数字显示 */
:deep(.el-tabs__item) {
  display: inline-flex;
  align-items: center;
  justify-content: center;
}

:deep(.el-tabs__item .el-badge__content) {
  transform: translateY(-50%) translateX(100%);
}

/* 响应式适配 */
@media screen and (max-width: 768px) {
  .content-container {
    padding: 16px;
  }

  :deep(.el-tabs__item) {
    min-width: 100px;
    font-size: 13px;
  }

  .handle-row {
    margin-top: 20px;
  }
}
</style>
