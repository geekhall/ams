import { ref, reactive } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getAssetList, deleteAssetById } from '@/api/asset'
import type { Asset } from '@/types/asset'

export const useAsset = () => {
  const tableData = ref<Asset[]>([])
  const pageTotal = ref(0)
  const dialogVisible = ref(false)
  const dialogMode = ref<'add' | 'edit'>('add')
  const currentAsset = ref<Asset | null>(null)
  const borrowVisible = ref(false)

  const query = reactive({
    id: '',
    name: '',
    code: '',
    type: '',
    departmentName: '',
    status: '',
    purchaseDate: '',
    purchasePrice: '',
    count: 0,
    pageIndex: 1,
    pageSize: 10
  })

  // 获取表格数据
  const getData = async () => {
    try {
      const res = await getAssetList({
        name: query.name,
        pageIndex: query.pageIndex,
        pageSize: query.pageSize
      })

      if (res.code === 200) {
        tableData.value = res.data.items
        pageTotal.value = res.data.total
      } else {
        ElMessage.error(res.message)
      }
    } catch (error) {
      ElMessage.error(error instanceof Error ? error.message : '获取数据失败')
    }
  }

  // 搜索操作
  const handleSearch = async () => {
    query.pageIndex = 1
    await getData()
  }

  // 分页导航
  const handleSizeChange = async (val: number) => {
    query.pageSize = val
    query.pageIndex = 1
    await getData()
  }

  const handleCurrentChange = async (val: number) => {
    query.pageIndex = val
    localStorage.setItem('AMSCurrentAssetPageIndex', val.toString())
    await getData()
  }

  // 新增操作
  const handleAdd = async () => {
    dialogMode.value = 'add'
    currentAsset.value = null
    dialogVisible.value = true
  }

  // 编辑操作
  const handleEdit = async (index: number, row: Asset) => {
    try {
      dialogMode.value = 'edit'
      currentAsset.value = row
      dialogVisible.value = true
    } catch (error) {
      ElMessage.error('编辑失败: ' + error)
    }
  }

  // 删除操作
  const handleDelete = async (index: number) => {
    try {
      await ElMessageBox.confirm('确定要删除吗？', '提示', {
        type: 'warning'
      })

      const res = await deleteAssetById(tableData.value[index].id)

      if (res.code === 200) {
        ElMessage.success('删除成功')
        await getData()
      } else {
        ElMessage.error(res.message)
      }
    } catch (error) {
      if (error !== 'cancel') {
        ElMessage.error('删除失败: ' + error)
      }
    }
  }

  // 领用操作
  const handleBorrow = (row: Asset) => {
    currentAsset.value = row
    borrowVisible.value = true
  }

  // 操作成功后的回调
  const handleSuccess = () => {
    getData()
  }

  return {
    query,
    tableData,
    pageTotal,
    dialogVisible,
    dialogMode,
    currentAsset,
    borrowVisible,
    getData,
    handleSearch,
    handleSizeChange,
    handleCurrentChange,
    handleAdd,
    handleEdit,
    handleDelete,
    handleBorrow,
    handleSuccess
  }
}
