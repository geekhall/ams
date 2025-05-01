<template>
  <div>
    <div class="content-container">
      <div class="handle-box">
        <el-upload
          action="#"
          :limit="1"
          accept=".xlsx, .xls"
          :show-file-list="false"
          :before-upload="beforeUpload"
          :http-request="handleImport"
        >
          <el-button class="mr10" type="success">批量导入</el-button>
        </el-upload>
        <el-link href="/template.xlsx" target="_blank">下载模板</el-link>
      </div>
      <el-table :data="tableData" border class="table" header-cell-class-name="table-header">
        <el-table-column prop="id" label="ID" width="55" align="center"></el-table-column>
        <el-table-column prop="name" label="讲师名"></el-table-column>
        <el-table-column prop="intro" label="简介"></el-table-column>
        <el-table-column prop="career" label="职业"></el-table-column>
        <el-table-column prop="age" label="年龄"></el-table-column>
        <el-table-column prop="gender" label="性别"></el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script setup lang="ts" name="import">
import { UploadProps } from 'element-plus'
import { ref, reactive } from 'vue'
import * as XLSX from 'xlsx'

interface TableItem {
  id: number
  name: string
  intro: string
  career: string
  age: string
  gender: string
}

const tableData = ref<TableItem[]>([])
// 获取表格数据
const getData = () => {
  tableData.value = [
    {
      id: 1,
      name: '张三',
      intro: '金牌讲师',
      career: '前端',
      age: '30',
      gender: '男'
    },
    {
      id: 2,
      name: '李四',
      intro: '白金讲师',
      career: '后端',
      age: '29',
      gender: '女'
    },
    {
      id: 3,
      name: '银八',
      intro: '砖石讲师',
      career: '人工智能',
      age: '29',
      gender: '男'
    }
  ]
}
getData()

const importList = ref<any>([])
const beforeUpload: UploadProps['beforeUpload'] = async (rawFile) => {
  importList.value = await analysisExcel(rawFile)
  return true
}
const analysisExcel = (file: any) => {
  return new Promise(function (resolve, reject) {
    const reader = new FileReader()
    reader.onload = function (e: any) {
      const data = e.target.result
      let datajson = XLSX.read(data, {
        type: 'binary'
      })

      const sheetName = datajson.SheetNames[0]
      const result = XLSX.utils.sheet_to_json(datajson.Sheets[sheetName])
      resolve(result)
    }
    reader.readAsBinaryString(file)
  })
}

const handleImport = async () => {
  // 把数据传给服务器后获取最新列表，这里只是示例，不做请求
  const list = importList.value.map((item: any, index: number) => {
    return {
      id: index,
      name: item['讲师名'],
      intro: item['简介'],
      career: item['职业'],
      age: item['年龄'],
      gender: item['性别']
    }
  })
  tableData.value.push(...list)
}
</script>

<style lang="less" scoped>
.handle-box {
  display: flex;
  margin-bottom: 20px;
}

.table {
  width: 100%;
  font-size: 14px;
}
.mr10 {
  margin-right: 10px;
}
</style>
