<template>
  <el-dialog
    :title="mode === 'add' ? '新增资产' : '编辑资产'"
    v-model="dialogVisible"
    width="65%"
    @close="handleClose"
    class="asset-dialog"
  >
    <el-form :model="form" label-width="100px" ref="formRef" :rules="rules" class="asset-form">
      <el-form-item label="ID" v-if="mode === 'edit'" class="form-item-id">
        <el-input v-model="form.id" disabled></el-input>
      </el-form-item>

      <div class="form-section">
        <div class="section-title">基本信息</div>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="资产名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入资产名称"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产编号" prop="code">
              <el-input v-model="form.code" placeholder="请输入资产编号"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产序列号" prop="sn">
              <el-input v-model="form.sn" placeholder="请输入资产序列号"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="资产类型" prop="type">
              <el-select v-model="form.type" placeholder="请选择资产类型" style="width: 100%">
                <el-option
                  v-for="item in assetTypes"
                  :key="item.name"
                  :label="item.name"
                  :value="item.name"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产型号" prop="model">
              <el-input v-model="form.model" placeholder="请输入资产型号"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产配置" prop="config">
              <el-input v-model="form.config" placeholder="请输入资产配置"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </div>

      <div class="form-section">
        <div class="section-title">网络信息</div>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="资产IP" prop="ip">
              <el-input v-model="form.ip" placeholder="请输入资产IP"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="资产描述" prop="description">
              <el-input v-model="form.description" placeholder="请输入资产描述"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
      </div>

      <div class="form-section">
        <div class="section-title">采购信息</div>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="资产提供商" prop="provider">
              <el-input v-model="form.provider" placeholder="请输入资产提供商"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="购入时间" prop="purchaseDate">
              <el-date-picker
                v-model="form.purchaseDate"
                type="date"
                format="YYYY-MM-DD"
                value-format="YYYY-MM-DD"
                style="width: 100%"
                placeholder="选择购入时间"
              />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="购买价格" prop="purchasePrice">
              <el-input-number
                v-model="form.purchasePrice"
                :precision="2"
                :step="100"
                :min="0"
                style="width: 100%"
                placeholder="请输入购买价格"
              ></el-input-number>
            </el-form-item>
          </el-col>
        </el-row>
      </div>

      <div class="form-section">
        <div class="section-title">使用信息</div>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="所属部门" prop="departmentName">
              <el-select
                v-model="form.departmentName"
                placeholder="请选择所属部门"
                style="width: 100%"
              >
                <el-option
                  v-for="item in departments"
                  :key="item.name"
                  :label="item.name"
                  :value="item.name"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="负责人" prop="ownerName">
              <el-input v-model="form.ownerName" placeholder="请输入负责人"></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="资产位置" prop="location">
              <el-input v-model="form.location" placeholder="请输入资产位置"></el-input>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="数量" prop="count">
              <el-input-number
                v-model="form.count"
                :min="1"
                style="width: 100%"
                placeholder="请输入数量"
              ></el-input-number>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="状态" prop="status">
              <el-select v-model="form.status" placeholder="请选择状态" style="width: 100%">
                <el-option label="正常" value="正常"></el-option>
                <el-option label="维修" value="维修"></el-option>
                <el-option label="报废" value="报废"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="使用状态" prop="useStatus">
              <el-select v-model="form.useStatus" placeholder="请选择使用状态" style="width: 100%">
                <el-option label="在用" value="在用"></el-option>
                <el-option label="闲置" value="闲置"></el-option>
                <el-option label="维修" value="维修"></el-option>
                <el-option label="报废" value="报废"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="24">
          <el-col :span="8">
            <el-form-item label="使用人" prop="userName">
              <el-autocomplete
                v-model="form.userName"
                :fetch-suggestions="querySearchUsers"
                :trigger-on-focus="false"
                placeholder="请输入使用人"
                class="user-autocomplete"
                @select="handleUserSelect"
                @input="handleUserInput"
              >
                <template #default="{ item }">
                  <div class="user-suggestion-item">
                    <span class="user-name">{{ item.name }}</span>
                    <span class="user-info">{{ item.department }} | {{ item.phone }}</span>
                  </div>
                </template>
              </el-autocomplete>
              <div v-if="selectedUser" class="selected-user-info">
                <el-tag size="small" type="info">
                  {{ selectedUser.department }} | {{ selectedUser.phone }}
                </el-tag>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
      </div>
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
import { ref, reactive, defineProps, defineEmits, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { addAsset, updateAsset } from '@/api/asset'
import { searchUsers } from '@/api/user'
import type { FormInstance, FormRules } from 'element-plus'
import type { Asset } from '@/types/asset'
import type { UserDTO } from '@/types/user'
import dayjs from 'dayjs'

const props = defineProps<{
  visible: boolean
  mode: 'add' | 'edit'
  assetTypes: any[]
  departments: any[]
  asset: Asset | null
}>()

const emit = defineEmits(['update:visible', 'success'])

const dialogVisible = ref(props.visible)
const formRef = ref<FormInstance>()

const form = reactive({
  id: '',
  name: '',
  code: '',
  sn: '',
  type: '',
  model: '',
  config: '',
  ip: '',
  description: '',
  provider: '',
  departmentName: '',
  ownerName: '',
  userName: '',
  location: '',
  status: '正常',
  useStatus: '闲置',
  purchaseDate: dayjs().format('YYYY-MM-DD'),
  purchasePrice: 0,
  count: 1
})

const rules = reactive<FormRules>({
  name: [{ required: true, message: '请输入资产名称', trigger: 'blur' }],
  code: [{ required: true, message: '请输入资产编号', trigger: 'blur' }],
  type: [{ required: true, message: '请选择资产类型', trigger: 'change' }],
  departmentName: [{ required: true, message: '请选择所属部门', trigger: 'change' }],
  ownerName: [{ required: true, message: '请选择负责人', trigger: 'change' }],
  userName: [{ required: true, message: '请选择使用人', trigger: 'change' }],
  status: [{ required: true, message: '请选择状态', trigger: 'change' }],
  useStatus: [{ required: true, message: '请选择使用状态', trigger: 'change' }],
  purchaseDate: [{ required: true, message: '请选择购入时间', trigger: 'change' }],
  purchasePrice: [{ required: true, message: '请输入购买价格', trigger: 'blur' }],
  count: [{ required: true, message: '请输入数量', trigger: 'blur' }]
})

// 用户搜索相关
const selectedUser = ref<UserDTO | null>(null)
const searchTimeout = ref<number | null>(null)

// 搜索用户
const querySearchUsers = async (query: string, callback: (data: any[]) => void) => {
  if (searchTimeout.value) {
    clearTimeout(searchTimeout.value)
  }

  if (!query) {
    callback([])
    return
  }

  searchTimeout.value = window.setTimeout(async () => {
    try {
      const res = await searchUsers(query)
      if (res.code === 200) {
        const users = res.data.items.map((user: UserDTO) => ({
          value: user.name,
          name: user.name,
          department: user.department,
          phone: user.phone,
          email: user.email,
          ...user
        }))
        callback(users)
      } else {
        callback([])
      }
    } catch (error) {
      console.error('Search users error:', error)
      callback([])
    }
  }, 300)
}

// 选择用户
const handleUserSelect = (item: any) => {
  selectedUser.value = item
  form.userName = item.name
}

// 用户输入
const handleUserInput = (value: string) => {
  if (!value) {
    selectedUser.value = null
  }
}

// 监听资产数据变化
watch(
  () => props.asset,
  (newAsset) => {
    if (newAsset && props.mode === 'edit') {
      Object.assign(form, newAsset)
      // 如果有使用人信息，设置selectedUser
      if (newAsset.userName) {
        selectedUser.value = {
          name: newAsset.userName,
          department: newAsset.departmentName || '',
          phone: '',
          email: '',
          username: '',
          roles: [],
          permissions: []
        }
      }
    } else if (props.mode === 'add') {
      // 重置表单
      Object.assign(form, {
        id: '',
        name: '',
        code: '',
        sn: '',
        type: '',
        model: '',
        config: '',
        ip: '',
        description: '',
        provider: '',
        departmentName: '',
        ownerName: '',
        userName: '',
        location: '',
        status: '正常',
        useStatus: '闲置',
        purchaseDate: dayjs().format('YYYY-MM-DD'),
        purchasePrice: 0,
        count: 1
      })
      selectedUser.value = null
    }
  },
  { immediate: true }
)

// 监听对话框显示状态
watch(
  () => props.visible,
  (newVal) => {
    dialogVisible.value = newVal
  }
)

const handleClose = () => {
  emit('update:visible', false)
}

const handleSubmit = async () => {
  if (!formRef.value) return

  try {
    await formRef.value.validate()
    let res
    if (props.mode === 'add') {
      res = await addAsset(form)
    } else {
      res = await updateAsset(form)
    }

    if (res.code === 200) {
      ElMessage.success(props.mode === 'add' ? '新增成功' : '修改成功')
      emit('success')
      handleClose()
    } else {
      ElMessage.error(res.message)
    }
  } catch (error) {
    ElMessage.error(props.mode === 'add' ? '新增失败: ' : '修改失败: ' + error)
  }
}
</script>

<style scoped>
.asset-dialog {
  :deep(.el-dialog__body) {
    padding: 20px 30px;
  }
}

.asset-form {
  .form-item-id {
    margin-bottom: 20px;
  }
}

.form-section {
  background-color: #f8f9fa;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 24px;

  .section-title {
    font-size: 16px;
    font-weight: 600;
    color: #303133;
    margin-bottom: 20px;
    padding-left: 10px;
    border-left: 4px solid #409eff;
  }
}

:deep(.el-form-item) {
  margin-bottom: 20px;

  &:last-child {
    margin-bottom: 0;
  }

  .el-form-item__label {
    font-weight: 500;
  }
}

:deep(.el-input-number) {
  width: 100%;
}

.dialog-footer {
  display: flex;
  justify-content: flex-end;
  gap: 12px;
  padding-top: 20px;
}

:deep(.el-input__wrapper),
:deep(.el-select),
:deep(.el-date-editor) {
  box-shadow: none !important;
  border: 1px solid #dcdfe6;

  &:hover {
    border-color: #409eff;
  }

  &.is-focus {
    border-color: #409eff;
  }
}

.user-autocomplete {
  width: 100%;
}

.user-suggestion-item {
  display: flex;
  flex-direction: column;
  padding: 4px 0;

  .user-name {
    font-weight: 500;
    color: #303133;
  }

  .user-info {
    font-size: 12px;
    color: #909399;
    margin-top: 2px;
  }
}

.selected-user-info {
  margin-top: 4px;

  .el-tag {
    margin-right: 8px;
  }
}

:deep(.el-autocomplete-suggestion) {
  min-width: 200px !important;

  .el-autocomplete-suggestion__list {
    max-height: 280px;
  }
}

:deep(.el-autocomplete-suggestion__wrap) {
  max-height: 280px;
}
</style>
