<template>
  <el-dialog
    :title="isEdit ? '编辑预算' : '新增预算'"
    v-model="visible"
    width="30%"
    @close="handleClose"
  >
    <el-form label-width="140px" :model="formData" ref="formRef">
      <el-form-item label="ID" v-show="false">
        <el-input v-model="formData.id" disabled></el-input>
      </el-form-item>
      <el-form-item label="项目类型">
        <el-select v-model="formData.budgetType" placeholder="请选择">
          <el-option
            v-for="item in budgetTypes"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="项目性质">
        <el-select v-model="formData.budgetCategory" placeholder="请选择">
          <el-option
            v-for="item in budgetCategories"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否信创">
        <el-select v-model="formData.innovation">
          <el-option label="是" value="1"></el-option>
          <el-option label="否" value="0"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="项目名称">
        <el-input v-model="formData.name"></el-input>
      </el-form-item>
      <el-form-item label="项目概述">
        <el-input v-model="formData.description"></el-input>
      </el-form-item>
      <el-form-item label="部门">
        <el-select v-model="formData.departmentName">
          <el-option
            v-for="item in departments"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="预算金额">
        <el-input v-model="formData.amount"></el-input>
      </el-form-item>

      <el-form-item label="团队">
        <el-select v-model="formData.teamName">
          <el-option
            v-for="item in teams"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="优先级" v-if="!isTech">
        <el-select v-model="formData.priority">
          <el-option label="0-默认" value="0"></el-option>
          <el-option label="1-优先" value="1"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="业务优先级" v-if="!isTech">
        <el-select v-model="formData.businessPriority">
          <el-option label="0-默认" value="0"></el-option>
          <el-option label="1-A" value="1"></el-option>
          <el-option label="2-B" value="2"></el-option>
          <el-option label="3-C" value="3"></el-option>
          <el-option label="4-D" value="4"></el-option>
          <el-option label="5-已立项" value="5"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="业务优先级情况说明" v-if="!isTech">
        <el-input v-model="formData.businessDescription"></el-input>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="formData.remark"></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="handleSave">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { Budget } from '@/types/budget'
import { addBudget, updateBudget } from '@/api/budget'

const props = defineProps<{
  visible: boolean
  isEdit: boolean
  isTech: boolean
  formData: Budget
  budgetTypes: Array<{ name: string }>
  budgetCategories: Array<{ name: string }>
  departments: Array<{ name: string }>
  teams: Array<{ name: string }>
}>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'save', formData: Budget): void
}>()

const formRef = ref()

const handleClose = () => {
  emit('update:visible', false)
}

const handleSave = async () => {
  try {
    const res = props.isEdit ? await updateBudget(props.formData) : await addBudget(props.formData)
    if (res.code === 200) {
      ElMessage.success(props.isEdit ? '修改成功' : '新增成功')
      emit('save', props.formData)
      handleClose()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(error instanceof Error ? error.message : '操作失败')
  }
}

// 监听 visible 变化，当对话框关闭时重置表单
watch(
  () => props.visible,
  (newVal) => {
    if (!newVal && formRef.value) {
      formRef.value.resetFields()
    }
  }
)
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}
</style>
