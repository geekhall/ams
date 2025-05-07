import { ref, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { type MessageDTO, type CreateMessageDTO } from '@/types/message'
import { getMessageList, sendMessage, updateMessage, deleteMessage } from '@/api/message'
import { useAuthStore } from '@/store/auth'
import dayjs from 'dayjs'

export const useMessage = () => {
  const messages = ref<MessageDTO[]>([])
  const totalMessages = ref(0)
  const loading = ref(false)
  const currentPage = ref(1)
  const pageSize = ref(10)
  const searchQuery = ref('')
  const editingMessage = ref<MessageDTO | null>(null)

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

  // 发送/更新消息
  const handleSendMessage = async (form: any) => {
    try {
      const authStore = useAuthStore()
      const newMessage: CreateMessageDTO = {
        title: form.title,
        content: form.content,
        sender: authStore.$state.user?.username || '系统管理员',
        send_time: dayjs().format('YYYY-MM-DD HH:mm:ss'),
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

  // 删除消息
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
      }
    }
  }

  // 搜索处理
  const handleSearch = () => {
    currentPage.value = 1
    fetchMessages()
  }

  // 分页处理
  const handleSizeChange = (val: number) => {
    pageSize.value = val
    currentPage.value = 1
    fetchMessages()
  }

  const handleCurrentChange = (val: number) => {
    currentPage.value = val
    fetchMessages()
  }

  // 状态处理
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

  // 日期格式化
  const formatDate = (date: string) => {
    if (!date) return '-'
    return dayjs(date).format('YYYY-MM-DD HH:mm:ss')
  }

  return {
    messages,
    totalMessages,
    loading,
    currentPage,
    pageSize,
    searchQuery,
    editingMessage,
    fetchMessages,
    handleSendMessage,
    handleDelete,
    handleSearch,
    handleSizeChange,
    handleCurrentChange,
    getStatusType,
    getStatusText,
    formatDate
  }
}
