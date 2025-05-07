<template>
  <div id="messagePage" class="content-container">
    <div class="page-header">
      <h1>消息管理</h1>
      <el-button type="primary" @click="handleOpenMessageDialog">发送新消息</el-button>
    </div>

    <el-card class="message-list">
      <template #header>
        <div class="card-header">
          <span>消息列表</span>
          <el-input
            v-model="searchQuery"
            placeholder="搜索消息"
            style="width: 200px"
            clearable
            @clear="handleSearch"
            @input="handleSearch"
          >
            <template #prefix>
              <el-icon><Search /></el-icon>
            </template>
          </el-input>
        </div>
      </template>

      <el-table :data="filteredMessages" style="width: 100%">
        <el-table-column prop="title" label="标题" min-width="200">
          <template #default="{ row }">
            <el-tooltip :content="row.content" placement="top" :show-after="500">
              <span class="message-title">{{ row.title }}</span>
            </el-tooltip>
          </template>
        </el-table-column>
        <el-table-column prop="sender" label="发送者" width="120" />
        <el-table-column prop="send_time" label="发送时间" width="180">
          <template #default="{ row }">
            {{ dayjs(row.send_time).format('YYYY-MM-DD HH:mm:ss') }}
          </template>
        </el-table-column>

        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button-group>
              <el-button
                text
                :icon="Edit"
                @click="handleEdit(row)"
                :disabled="row.status === 'deleted'"
              >
                编辑
              </el-button>
              <el-button
                text
                :icon="Delete"
                class="red"
                @click="handleDelete(row)"
                :disabled="row.status === 'deleted'"
              >
                删除
              </el-button>
            </el-button-group>
          </template>
        </el-table-column>
      </el-table>

      <div class="pagination-container">
        <el-pagination
          v-model:current-page="currentPage"
          v-model:page-size="pageSize"
          :page-sizes="[10, 20, 50, 100]"
          :total="totalMessages"
          layout="total, sizes, prev, pager, next"
          @size-change="handleSizeChange"
          @current-change="handleCurrentChange"
        />
      </div>
    </el-card>

    <MessageDialog
      v-model:visible="messageDialogVisible"
      :edit-message="editingMessage"
      @submit="handleSendMessage"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { Delete, Edit, Search } from '@element-plus/icons-vue'
import MessageDialog from '@/views/message/MessageDialog.vue'
import { type MessageDTO } from '@/types/message'
import { useMessage } from '@/hooks/useMessage'
import dayjs from 'dayjs'
// 状态管理
const messageDialogVisible = ref(false)
const {
  messages,
  totalMessages,
  currentPage,
  pageSize,
  searchQuery,
  editingMessage,
  fetchMessages,
  handleSendMessage,
  handleDelete,
  handleSearch,
  handleSizeChange,
  handleCurrentChange
} = useMessage()

// 计算属性
const filteredMessages = computed(() => messages.value)

// 方法
const handleOpenMessageDialog = () => {
  editingMessage.value = null
  messageDialogVisible.value = true
}

const handleEdit = (message: MessageDTO) => {
  editingMessage.value = { ...message }
  messageDialogVisible.value = true
}

// 生命周期钩子
onMounted(async () => {
  await fetchMessages()
})
</script>

<style scoped>
.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.message-list {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.message-title {
  cursor: pointer;
  color: #409eff;
}

.message-title:hover {
  text-decoration: underline;
}

.pagination-container {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
.red {
  color: #f56c6c;
}
</style>
