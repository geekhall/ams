import { ref, computed, toRef } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { type MessageDTO, type CreateMessageDTO } from '@/types/message'
import { getMessageList, sendMessage, updateMessage, deleteMessage, updateMessageStatusById } from '@/api/message'
import { useUserStore } from '@/stores/user'
import dayjs from 'dayjs'

export const useMessage = () => {
  const messages = ref<MessageDTO[]>([])
  const total = ref(0)
  const loading = ref(false)
  const pageNum = ref(1)
  const pageSize = ref(10)
  const searchQuery = ref('')
  const editingMessage = ref<MessageDTO | null>(null)

  // 获取消息列表
  const fetchMessages = async () => {
    loading.value = true
    try {
      const userStore = useUserStore()
      const response = await getMessageList({
        pageIndex: pageNum.value,
        pageSize: pageSize.value,
        userId: userStore.userInfo.id || '',
        search: searchQuery.value
      })
      if (response.code === 200) {
        console.log('获取消息列表成功:', response.data);
        messages.value = response.data.items
        total.value = response.data.total
      }
    } catch (error) {
      ElMessage.error('获取消息列表失败')
      console.error('获取消息列表失败:', error)
    } finally {
      loading.value = false
    }
  }

  // 发送/更新消息
  const handleSendMessage = async (form: any) => {
    try {
      const userStore = useUserStore()
      const newMessage: CreateMessageDTO = {
        title: form.title,
        content: form.content,
        sender: userStore.$state.user?.username || '系统管理员',
        send_time: dayjs().format('YYYY-MM-DD HH:mm:ss'),
        type: form.type,
        status: 0,
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
    pageNum.value = 1
    fetchMessages()
  }

  // 分页处理
  const handleSizeChange = (val: number) => {
    pageSize.value = val
    pageNum.value = 1
    fetchMessages()
  }

  const handleCurrentChange = (val: number) => {
    pageNum.value = val
    fetchMessages()
  }

  const getMessageCount = async () => {
    await fetchMessages()
    return total.value
  }

  const updateMessageStatus = async (user_id: string, message_id: string, status: number) => {
    try {
      const userStore = useUserStore()
      const response = await updateMessageStatusById(
        user_id,
        message_id,
        status
      )
      if (response.code === 200) {
        ElMessage.success('消息状态更新成功')
        await fetchMessages()
      }
    } catch (error) {
      ElMessage.error('消息状态更新失败')
      console.error('消息状态更新失败:', error)
    }
  }

  return {
    messages,
    total,
    loading,
    pageNum,
    pageSize,
    searchQuery,
    editingMessage,
    fetchMessages,
    handleSendMessage,
    handleDelete,
    handleSearch,
    handleSizeChange,
    handleCurrentChange,
    getMessageCount,
    updateMessageStatus,
  }
}
