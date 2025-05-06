<template>
  <div id="assetPage" class="content-container">
    <h1>资产管理</h1>
    <div class="handle-box">
      <el-input
        v-model="query.assetName"
        placeholder="输入资产名称"
        class="handle-input mr10"
        @keyup.enter.native="handleSearch"
      ></el-input>
      <el-button type="primary" :icon="Search" @click="handleSearch">搜索</el-button>
      <el-button type="primary" :icon="Plus" @click="handleAdd"> 新增 </el-button>
    </div>
    <el-table
      :data="tableData"
      border
      class="table"
      ref="multipleTable"
      header-cell-class-name="table-header"
    >
      <el-table-column
        prop="id"
        label="ID"
        width="180"
        align="center"
        v-if="false"
      ></el-table-column>
      <el-table-column
        type="index"
        label="序号"
        width="80"
        align="center"
        :index="(index:number) => index + 1 + (query.pageIndex - 1) * query.pageSize"
      ></el-table-column>
      <el-table-column prop="assetName" label="资产名称" align="center"></el-table-column>
      <el-table-column prop="assetCode" label="资产编号" align="center"> </el-table-column>
      <el-table-column prop="assetType" label="资产类型" align="center"></el-table-column>
      <el-table-column prop="departmentName" label="所属部门" align="center"> </el-table-column>
      <el-table-column prop="status" label="状态" align="center"> </el-table-column>
      <el-table-column prop="purchaseDate" label="购入时间" align="center"></el-table-column>
      <el-table-column prop="purchasePrice" label="购买价格" align="right"></el-table-column>
      <el-table-column prop="count" label="数量" align="center" width="100"></el-table-column>
      <el-table-column label="操作" width="220" align="center">
        <template #default="scope">
          <el-button
            text
            :icon="Edit"
            @click="handleEdit(scope.$index, scope.row)"
            v-permission="15"
          >
            编辑
          </el-button>
          <el-button
            text
            :icon="Delete"
            class="red"
            @click="handleDelete(scope.$index)"
            v-permission="16"
          >
            删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <div class="pagination">
      <el-pagination
        background
        layout="total, prev, pager, next"
        :current-page="query.pageIndex"
        :page-size="query.pageSize"
        :total="pageTotal"
        @current-change="handlePageChange"
      ></el-pagination>
    </div>

    <!-- 新增弹出框 -->
    <el-dialog title="新增资产" v-model="addVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="资产名称">
          <el-input v-model="addForm.assetName"></el-input>
        </el-form-item>
        <el-form-item label="资产编号">
          <el-input v-model="addForm.assetCode"></el-input>
        </el-form-item>
        <el-form-item label="资产类型">
          <el-select v-model="addForm.assetType" placeholder="请选择">
            <el-option
              v-for="item in assetTypes"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属部门">
          <el-select v-model="addForm.departmentName">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="addForm.status">
            <el-option label="正常" value="正常"></el-option>
            <el-option label="维修" value="维修"></el-option>
            <el-option label="报废" value="报废"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="购入时间">
          <span class="demonstration"></span>
          <el-date-picker
            class="date-picker"
            v-model="addForm.purchaseDate"
            type="date"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
            size="default"
            placeholder="选择日期"
          />
        </el-form-item>
        <el-form-item label="购买价格">
          <el-input v-model="addForm.purchasePrice"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="addForm.count"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="addVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveAdd">确 定</el-button>
        </span>
      </template>
    </el-dialog>

    <!-- 编辑弹出框 -->
    <el-dialog title="编辑" v-model="editVisible" width="30%">
      <el-form label-width="70px">
        <el-form-item label="ID" v-if="false">
          <el-input v-model="editForm.id" disabled></el-input>
        </el-form-item>
        <el-form-item label="资产名称">
          <el-input v-model="editForm.assetName"></el-input>
        </el-form-item>
        <el-form-item label="资产编号">
          <el-input v-model="editForm.assetCode"></el-input>
        </el-form-item>
        <el-form-item label="资产类型">
          <el-select v-model="addForm.assetType" placeholder="请选择">
            <el-option
              v-for="item in assetTypes"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="所属部门">
          <el-select v-model="editForm.departmentName">
            <el-option
              v-for="item in departments"
              :key="item.name"
              :label="item.name"
              :value="item.name"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="editForm.status">
            <el-option label="正常" value="正常"></el-option>
            <el-option label="维修" value="维修"></el-option>
            <el-option label="报废" value="报废"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="购入时间">
          <span class="demonstration"></span>
          <el-date-picker
            class="date-picker"
            v-model="editForm.purchaseDate"
            type="date"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
            size="default"
            placeholder="选择日期"
          />
        </el-form-item>
        <el-form-item label="购买价格">
          <el-input v-model="editForm.purchasePrice"></el-input>
        </el-form-item>
        <el-form-item label="数量">
          <el-input v-model="editForm.count"></el-input>
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button @click="editVisible = false">取 消</el-button>
          <el-button type="primary" @click="saveEdit">确 定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script lang="ts" setup>
import { ref, reactive, onMounted, computed } from 'vue'
import { useAssetType } from '@/hooks/useAssetType'
import { useDepartment } from '@/hooks/useDepartment'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Delete, Edit, Search, Plus } from '@element-plus/icons-vue'
import { deleteAssetById, getAssetList, addAsset, updateAsset } from '@/api/asset'
import { type Asset } from '@/types/asset'
import dayjs from 'dayjs'

const { assetTypes, fetchAssetTypes } = useAssetType()
const { departments, fetchDepartments } = useDepartment()
const query = reactive({
  id: '',
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: '',
  purchaseDate: '',
  purchasePrice: '',
  count: 0,
  // 分页参数
  pageIndex: 1,
  pageSize: 10
})
const tableData = ref<Asset[]>([])
const pageTotal = ref(0)
// 表格编辑时弹窗和保存
const addVisible = ref(false)

let addForm = reactive({
  assetName: '测试资产1',
  assetCode: 'TEST-2025-1',
  assetType: '服务器',
  departmentName: '信息科技部',
  status: '正常',
  purchaseDate: dayjs().format('YYYY-MM-DD'),
  purchasePrice: 0,
  count: 0
})
const editVisible = ref(false)
let editForm = reactive({
  id: '',
  assetName: '',
  assetCode: '',
  assetType: '',
  departmentName: '',
  status: '',
  purchaseDate: '',
  purchasePrice: 100,
  count: 1
})
let idx: number = -1

// 获取表格数据
const getData = async () => {
  try {
    const res = await getAssetList({
      name: query.assetName,
      pageIndex: query.pageIndex,
      pageSize: query.pageSize
    })

    if (res.code === 200) {
      // console.log('getAssetList res.data:', res.data)

      tableData.value = res.data.items
      pageTotal.value = res.data.total
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('获取数据失败')
  }
}
onMounted(() => {
  const savedPageIndex = localStorage.getItem('AMSCurrentAssetPageIndex')
  if (savedPageIndex) {
    query.pageIndex = parseInt(savedPageIndex, 10)
  }
  getData()
  fetchDepartments()
})

// 搜索操作
const handleSearch = async () => {
  query.pageIndex = 1
  // 获取输入框中的值
  console.log('query.assetName', query.assetName)
  // 这里可以添加搜索逻辑
  try {
    await getData()
  } catch (err) {
    ElMessage.error('搜索失败')
  }
}

// 分页导航
const handlePageChange = async (val: number) => {
  query.pageIndex = val
  localStorage.setItem('AMSCurrentAssetPageIndex', val.toString())
  try {
    await getData()
  } catch (err) {
    ElMessage.error('搜索失败')
  }
}

// 新增操作
const handleAdd = async () => {
  await fetchAssetTypes()
  await fetchDepartments()
  addVisible.value = true
  // 这里可以添加新增逻辑
}
const getMaxPage = () => {
  if (!pageTotal.value) {
    return 1
  }
  let maxPage = Math.ceil((pageTotal.value + 1) / query.pageSize)
  return maxPage
}
// 保存新增操作
const saveAdd = async () => {
  addVisible.value = false
  try {
    const res = await addAsset(addForm)

    if (res.code === 200) {
      ElMessage.success('新增成功')
      // 更新当前页码
      query.pageIndex = getMaxPage()
      // 更新表格数据
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('新增失败')
  }
}

// 编辑操作
const handleEdit = async (index: number, row: any) => {
  try {
    await fetchAssetTypes()
    await fetchDepartments()
    idx = index
    editForm.id = row.id
    editForm.assetName = row.assetName
    editForm.assetCode = row.assetCode
    editForm.assetType = row.assetType
    editForm.departmentName = row.departmentName
    editForm.status = row.status
    editForm.purchaseDate = row.purchaseDate
    editForm.purchasePrice = row.purchasePrice
    editForm.count = row.count
    // 这里可以根据需要设置其他字段
    editVisible.value = true
    // 更新后台数据
  } catch (err) {
    ElMessage.error('编辑失败')
  }
}

// 保存编辑操作
const saveEdit = async () => {
  editVisible.value = false
  let currentPage = query.pageIndex
  try {
    const res = await updateAsset(editForm)

    if (res.code === 200) {
      ElMessage.success(`修改成功`)
      // 更新表格数据
      query.pageIndex = currentPage
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('修改失败')
  }
}

// 删除操作
const handleDelete = async (index: number) => {
  try {
    await ElMessageBox.confirm('确定要删除吗？', '提示', {
      type: 'warning'
    })

    // 删除操作
    const res = await deleteAssetById(tableData.value[index].id)

    if (res.code === 200) {
      ElMessage.success('删除成功')
      // 更新表格数据
      await getData()
    } else {
      ElMessage.error(res.message)
    }
  } catch (err) {
    ElMessage.error('删除失败')
  }
}
</script>

<style scoped>
.handle-box {
  margin-bottom: 20px;
}

.handle-select {
  width: 120px;
}

.handle-input {
  width: 300px;
}
.table {
  width: 100%;
  font-size: 14px;
}
.red {
  color: #f56c6c;
}
.mr10 {
  margin-right: 10px;
}
.table-td-avatar {
  display: block;
  margin: auto;
  width: 40px;
  height: 40px;
}
.date-picker {
  width: 100%;
}
</style>

function getMaxPage(): number {
  throw new Error('Function not implemented.')
}
