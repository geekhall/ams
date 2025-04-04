<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="8">
        <el-card shadow="hover" class="mgb20">
          <div class="user-info">
            <el-avatar :size="120" :src="imgurl"></el-avatar>
            <div class="user-info-content">
              <div class="user-name">{{ name }}</div>
              <div class="user-role">{{ role }}</div>
            </div>
          </div>
          <div class="user-info-list">上次登录时间：<span>2023-02-03</span></div>
          <div class="user-info-list">上次登录地点：<span>北京</span></div>
        </el-card>
        <el-card shadow="hover">
          <template #header>
            <div class="clearfix">
              <span>语言详情</span>
            </div>
          </template>
          Vue
          <el-progress :percentage="79.4" color="#42b983"></el-progress>
          TypeScript
          <el-progress :percentage="14" color="#f1e05a"></el-progress>
          CSS
          <el-progress :percentage="5.6"></el-progress>
          HTML
          <el-progress :percentage="1" color="#f56c6c"></el-progress>
        </el-card>
      </el-col>
      <el-col :span="16">
        <el-row :gutter="20" class="mgb20">
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-content-1">
                <el-icon class="grid-content-icon"><User /></el-icon>
                <div class="grid-content-right">
                  <div class="grid-number">1234</div>
                  <div>用户访问量</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-content-2">
                <el-icon class="grid-content-icon"><ChatDotRound /></el-icon>
                <div class="grid-content-right">
                  <div class="grid-number">321</div>
                  <div>系统消息</div>
                </div>
              </div>
            </el-card>
          </el-col>
          <el-col :span="8">
            <el-card shadow="hover" :body-style="{ padding: '0px' }">
              <div class="grid-content grid-content-3">
                <el-icon class="grid-content-icon"><Goods /></el-icon>
                <div class="grid-content-right">
                  <div class="grid-number">5000</div>
                  <div>商品数量</div>
                </div>
              </div>
            </el-card>
          </el-col>
        </el-row>
        <el-card shadow="hover" style="height: 403px">
          <template #header>
            <div class="clearfix">
              <span>待办事项</span>
              <el-button type="primary" style="float: right; padding: 3px 0" text>添加</el-button>
            </div>
          </template>
          <el-table :show-header="false" :data="todoList" style="width: 100%">
            <el-table-column width="40">
              <template #default="scope">
                <el-checkbox v-model="scope.row.status"></el-checkbox>
              </template>
            </el-table-column>
            <el-table-column>
              <template #default="scope">
                <div class="todo-item" :class="{ 'todo-item-del': scope.row.status }">
                  {{ scope.row.title }}
                </div>
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="12">
        <el-card shadow="hover">
          <line-chart class="chart" />
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card shadow="hover">
          <random-chart class="chart" />
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script lang="ts" setup>
import { reactive } from 'vue'
import imgurl from '~/assets/img/avatar.png'

const name = localStorage.getItem('ms_username')
const role: string = name === 'admin' ? '超级管理员' : '普通用户'

const todoList = reactive([
  {
    title: '前后端登录功能整合',
    status: false
  },
  {
    title: '添加dark-mode主题切换',
    status: false
  },
  {
    title: '整合移动端UI',
    status: false
  },
  {
    title: '添加响应式布局优化',
    status: false
  },
  {
    title: '完成前台系统基本功能',
    status: false
  },
  {
    title: '完成后台管理系统前端基本功能',
    status: true
  },
  {
    title: '完成服务端系统框架和基本功能',
    status: true
  }
])
</script>

<style lang="less" scoped>
.el-row {
  margin-bottom: 20px;
}

.user-info {
  display: flex;
  align-items: center;
  padding-bottom: 20px;
  border-bottom: 2px solid #ccc;
  margin-bottom: 20px;
  justify-content: center;
  flex-direction: column;
  height: 100%;
}

.user-info-content {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  color: #999;
}
.user-info-content div:first-child {
  font-size: 30px;
  color: #333;
}

.user-info-list {
  margin-left: 70px;
}

.mgb20 {
  margin-bottom: 20px;
}

.grid-content {
  height: 100px;
  display: flex;
  align-items: center;
  color: #999;
}
.grid-content-right {
  flex: 1;
  text-align: center;
  font-size: 14px;
  color: #999;
}
.grid-number {
  font-size: 30px;
  font-weight: bold;
}
.grid-content-icon {
  font-size: 50px;
  width: 100px;
  height: 100px;
  text-align: center;
  line-height: 100px;
  color: #fff;
}
.grid-content-1 .grid-content-icon {
  background-color: #409eff;
}

.grid-content-1 .grid-number {
  color: rgb(45, 140, 240);
}

.grid-content-2 .grid-content-icon {
  background-color: #67c23a;
}
.grid-content-2 .grid-number {
  color: #67c23a;
}

.grid-content-3 .grid-content-icon {
  background: rgb(242, 94, 67);
}

.grid-content-3 .grid-number {
  color: rgb(242, 94, 67);
}

.todo-item {
  font-size: 14px;
}

.todo-item-del {
  text-decoration: line-through;
  color: #999;
}
.chart {
  width: 100%;
  height: 300px;
}
</style>
