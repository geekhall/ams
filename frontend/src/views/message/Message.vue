<template>
  <div id="messagePage" class="content-container">
    <div class="page-header">
      <h2>消息管理</h2>
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
        <el-table-column prop="date" label="发送时间" width="180" />
        <el-table-column prop="receiverType" label="接收类型" width="100">
          <template #default="{ row }">
            <el-tag :type="row.receiverType === 'all' ? 'success' : 'info'">
              {{ row.receiverType === 'all' ? '全体用户' : '指定角色' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getStatusType(row.status)">
              {{ getStatusText(row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button-group>
              <el-button
                size="small"
                type="primary"
                @click="handleEdit(row)"
                :disabled="row.status === 'deleted'"
              >
                编辑
              </el-button>
              <el-button
                size="small"
                type="danger"
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
      :role-list="roles"
      :edit-message="editingMessage"
      @submit="handleSendMessage"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search } from '@element-plus/icons-vue'
import MessageDialog from '@/views/message/MessageDialog.vue'
import { type MessageDTO, type CreateMessageDTO } from '@/types/message'
import { getMessageList, sendMessage, updateMessage, deleteMessage } from '@/api/message'
import { useAuthStore } from '@/store/auth'
import { useRole } from '@/hooks/useRole'

// 状态管理
const messageDialogVisible = ref(false)
const searchQuery = ref('')
const currentPage = ref(1)
const pageSize = ref(10)
const editingMessage = ref<MessageDTO | null>(null)
const messages = ref<MessageDTO[]>([])
const totalMessages = ref(0)
const loading = ref(false)
const { roles, fetchRoles } = useRole()

// 获取消息列表
const fetchMessages = async () => {
  loading.value = true
  try {
    const response = await getMessageList({
      page: currentPage.value,
      pageSize: pageSize.value,
      search: searchQuery.value
    })
    if (response.code === 200) {
      messages.value = response.data.list
      totalMessages.value = response.data.total
    }
  } catch (error) {
    console.error('获取消息列表失败:', error)
    ElMessage.error('获取消息列表失败')
  } finally {
    loading.value = false
  }
}

// 计算属性
const filteredMessages = computed(() => messages.value)

// 方法
const handleOpenMessageDialog = () => {
  editingMessage.value = null
  messageDialogVisible.value = true
}

const handleSendMessage = async (form: any) => {
  try {
    const authStore = useAuthStore()
    const newMessage: CreateMessageDTO = {
      title: form.title,
      content: form.content,
      sender: authStore.$state.user?.username || '系统管理员',
      date: new Date().toLocaleString(),
      receiverType: form.receiverType,
      receivers: form.receiverType === 'all' ? [] : form.receivers,
      status: 'active'
    }

    if (editingMessage.value) {
      // 更新现有消息
      const response = await updateMessage({
        ...newMessage,
        id: editingMessage.value.id
      })
      if (response.code === 200) {
        ElMessage.success('消息更新成功')
      }
    } else {
      // 发送新消息
      const response = await sendMessage(newMessage)
      if (response.code === 200) {
        ElMessage.success('消息发送成功')
      }
    }
    await fetchMessages()
  } catch (error) {
    ElMessage.error(editingMessage.value ? '消息更新失败' : '消息发送失败')
    console.error('操作失败:', error)
  }
}

const handleEdit = (message: MessageDTO) => {
  editingMessage.value = { ...message }
  messageDialogVisible.value = true
}

const handleDelete = async (message: MessageDTO) => {
  try {
    await ElMessageBox.confirm('确定要删除这条消息吗？', '警告', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })

    const response = await deleteMessage(message.id)
    if (response.code === 200) {
      ElMessage.success('消息已删除')
      await fetchMessages()
    }
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
      console.error('删除消息失败:', error)
    }
  }
}

const handleSearch = () => {
  currentPage.value = 1
  fetchMessages()
}

const handleSizeChange = (val: number) => {
  pageSize.value = val
  currentPage.value = 1
  fetchMessages()
}

const handleCurrentChange = (val: number) => {
  currentPage.value = val
  fetchMessages()
}

// 生命周期钩子
onMounted(async () => {
  await Promise.all([fetchRoles(), fetchMessages()])
  console.log('roles = ', roles)
})

const getStatusType = (status: string) => {
  switch (status) {
    case 'active':
      return 'success'
    case 'deleted':
      return 'danger'
    default:
      return 'info'
  }
}

const getStatusText = (status: string) => {
  switch (status) {
    case 'active':
      return '已发送'
    case 'deleted':
      return '已删除'
    default:
      return '未知'
  }
}
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
</style>
