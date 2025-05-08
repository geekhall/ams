<template>
  <el-dialog
    v-model="dialogVisible"
    :title="editMessage ? '编辑消息' : '发送消息'"
    width="50%"
    :before-close="handleClose"
  >
    <el-form ref="formRef" :model="form" :rules="rules" label-width="100px" class="message-form">
      <el-form-item label="消息标题" prop="title">
        <el-input v-model="form.title" placeholder="请输入消息标题" />
      </el-form-item>

      <el-form-item label="消息内容" prop="content">
        <el-input v-model="form.content" type="textarea" :rows="4" placeholder="请输入消息内容" />
      </el-form-item>
    </el-form>

    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" @click="handleSubmit">
          {{ editMessage ? '保存' : '发送' }}
        </el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script setup lang="ts">
import { ref, reactive, watch } from 'vue'
import type { FormInstance, FormRules } from 'element-plus'

interface Message {
  id: number
  title: string
  content: string
  sender: string
  send_time: string
}

interface MessageForm {
  title: string
  content: string
}

const props = defineProps<{
  visible: boolean
  editMessage: Message | null
}>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'submit', form: MessageForm): void
}>()

const dialogVisible = ref(props.visible)
const formRef = ref<FormInstance>()

const form = reactive<MessageForm>({
  title: '',
  content: ''
})

const resetForm = () => {
  form.title = ''
  form.content = ''
}
const rules = reactive<FormRules>({
  title: [{ required: true, message: '请输入消息标题', trigger: 'blur' }],
  content: [{ required: true, message: '请输入消息内容', trigger: 'blur' }]
})

// 监听编辑消息变化
watch(
  () => props.editMessage,
  (newMessage) => {
    if (newMessage) {
      form.title = newMessage.title
      form.content = newMessage.content
    } else {
      resetForm()
    }
  },
  { immediate: true }
)

// 监听visible属性变化
watch(
  () => props.visible,
  (val: boolean) => {
    dialogVisible.value = val
  }
)

const handleClose = () => {
  emit('update:visible', false)
  formRef.value?.resetFields()
  resetForm()
}

const handleSubmit = async () => {
  if (!formRef.value) return

  await formRef.value.validate((valid) => {
    if (valid) {
      emit('submit', { ...form })
      handleClose()
    }
  })
}
</script>

<style scoped>
.message-form {
  padding: 20px;
}
.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}
</style>
