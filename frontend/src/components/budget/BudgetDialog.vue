<template>
  <el-dialog
    :title="mode === 'add' ? '新增预算' : '编辑预算'"
    v-model="dialogVisible"
    width="30%"
    @close="handleClose"
  >
    <el-form label-width="140px">
      <el-form-item label="项目类型">
        <el-select v-model="form.budgetType" placeholder="请选择">
          <el-option
            v-for="item in budgetTypes"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="项目性质">
        <el-select v-model="form.budgetCategory" placeholder="请选择">
          <el-option
            v-for="item in budgetCategories"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="是否信创">
        <el-select v-model="form.innovation">
          <el-option label="是" value="1"></el-option>
          <el-option label="否" value="0"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="项目名称">
        <el-input v-model="form.name"></el-input>
      </el-form-item>
      <el-form-item label="项目概述">
        <el-input v-model="form.description"></el-input>
      </el-form-item>
      <el-form-item label="部门">
        <el-select v-model="form.departmentName">
          <el-option
            v-for="item in departments"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="预算金额">
        <el-input v-model="form.amount"></el-input>
      </el-form-item>
      <el-form-item label="团队">
        <el-select v-model="form.teamName">
          <el-option
            v-for="item in teams"
            :key="item.name"
            :label="item.name"
            :value="item.name"
          ></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="优先级" v-if="!isTech">
        <el-select v-model="form.priority">
          <el-option label="0-默认" value="0"></el-option>
          <el-option label="1-优先" value="1"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="业务优先级" v-if="!isTech">
        <el-select v-model="form.businessPriority">
          <el-option label="0-默认" value="0"></el-option>
          <el-option label="1-A" value="1"></el-option>
          <el-option label="2-B" value="2"></el-option>
          <el-option label="3-C" value="3"></el-option>
          <el-option label="4-D" value="4"></el-option>
          <el-option label="5-已立项" value="5"></el-option>
        </el-select>
      </el-form-item>
      <el-form-item label="业务优先级情况说明" v-if="!isTech">
        <el-input v-model="form.businessDescription"></el-input>
      </el-form-item>
      <el-form-item label="备注">
        <el-input v-model="form.remark"></el-input>
      </el-form-item>
    </el-form>
    <template #footer>
      <span class="dialog-footer">
        <el-button @click="handleClose">取 消</el-button>
        <el-button type="primary" @click="handleSubmit">确 定</el-button>
      </span>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import { ref, reactive, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { addBudget, updateBudget } from '@/api/budget'
import type { Budget } from '@/types/budget'
import dayjs from 'dayjs'
import { hasPermission } from '@/utils/permission'
import { useUserStore } from '@/stores/user'
import { PermissionType } from '@/types/user'

const userStore = useUserStore()

const props = defineProps<{
  visible: boolean
  mode: 'add' | 'edit'
  budgetTypes: { name: string }[]
  budgetCategories: { name: string }[]
  departments: { name: string }[]
  teams: { name: string }[]
  isTech: boolean
  selectedYear: Date
  budget?: Budget
}>()

const emit = defineEmits<{
  (e: 'update:visible', value: boolean): void
  (e: 'success'): void
  (e: 'approval-required', form: Budget): void
}>()

const dialogVisible = ref(props.visible)

watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
  }
)

watch(dialogVisible, (newVal) => {
  emit('update:visible', newVal)
})

const form = reactive({
  id: '',
  year: props.selectedYear.getFullYear(),
  name: '',
  description: '',
  budgetType: '',
  budgetCategory: '',
  innovation: '',
  amount: 0,
  departmentName: '',
  teamName: '',
  priority: 1,
  businessPriority: '5',
  businessDescription: '',
  plannedStartDate: dayjs().format('YYYY-MM-DD'),
  remark: '',
  status: ''
})

// 监听 budget prop 的变化，用于编辑模式
watch(
  () => props.budget,
  (newVal) => {
    if (newVal) {
      Object.assign(form, newVal)
    }
  },
  { immediate: true }
)

const handleClose = () => {
  dialogVisible.value = false
  // 重置表单
  Object.assign(form, {
    id: '',
    year: props.selectedYear.getFullYear(),
    name: '',
    description: '',
    budgetType: '',
    budgetCategory: '',
    innovation: '',
    amount: 0,
    departmentName: '',
    teamName: '',
    priority: 1,
    businessPriority: '5',
    businessDescription: '',
    plannedStartDate: dayjs().format('YYYY-MM-DD'),
    remark: '',
    status: ''
  })
}

const handleSubmit = async () => {
  if (props.mode === 'edit' && !hasPermission(userStore.userInfo, PermissionType.BUDGET_EDIT)) {
    // 如果没有编辑权限，触发审批流程
    emit('approval-required', form)
    handleClose()
    return
  }

  try {
    const res = props.mode === 'add' ? await addBudget(form) : await updateBudget(form)

    if (res.code === 200) {
      ElMessage.success(props.mode === 'add' ? '新增成功' : '修改成功')
      emit('success')
      handleClose()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error(props.mode === 'add' ? '新增失败' : '修改失败')
  }
}
</script>

<style scoped>
.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}
</style>
