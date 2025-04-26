<template>
  <div class="sidebar">
    <el-menu
      class="sidebar-el-menu"
      :default-active="onRoutes"
      :collapse="sidebar.collapse"
      :router="true"
      :unique-opened="true"
    >
      <template v-for="item in items">
        <template v-if="item.subs">
          <el-sub-menu :index="item.index" :key="item.index" v-permission="item.permission">
            <template #title>
              <el-icon>
                <component :is="item.icon"></component>
              </el-icon>
              <span>{{ item.title }}</span>
            </template>
            <template v-for="subItem in item.subs">
              <el-sub-menu
                v-if="subItem.subs"
                :index="subItem.index"
                :key="subItem.index"
                v-permission="item.permission"
              >
                <template #title>{{ subItem.title }}</template>
                <el-menu-item
                  v-for="(threeItem, i) in subItem.subs"
                  :key="i"
                  :index="threeItem.index"
                >
                  {{ threeItem.title }}
                </el-menu-item>
              </el-sub-menu>
              <el-menu-item v-else :index="subItem.index" v-permission="item.permission">
                {{ subItem.title }}
              </el-menu-item>
            </template>
          </el-sub-menu>
        </template>
        <template v-else>
          <el-menu-item :index="item.index" :key="item.index" v-permission="item.permission">
            <el-icon>
              <component :is="item.icon"></component>
            </el-icon>
            <template #title>{{ item.title }}</template>
          </el-menu-item>
        </template>
      </template>
    </el-menu>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useSidebarStore } from '~/store/sidebar'
import { useRoute } from 'vue-router'

interface MenuItem {
  icon: string
  index: string
  title: string
  subs?: MenuItem[]
  permission?: string
}
const items: MenuItem[] = [
  {
    icon: 'HomeFilled',
    index: '/',
    title: '系统首页',
    permission: 'dashboard'
  },
  {
    icon: 'DocumentCopy',
    index: '/asset',
    title: '资产管理',
    permission: 'asset',
    subs: [
      {
        icon: 'DocumentCopy',
        index: '/asset',
        title: '固定资产',
        permission: 'asset'
      },
      {
        icon: 'List',
        index: '/project',
        title: '项目清单',
        permission: 'project'
      },
      {
        icon: 'Platform',
        index: '/system',
        title: '系统清单',
        permission: 'system'
      }
    ]
  },
  {
    icon: 'Money',
    index: '',
    title: '预算管理',
    permission: 'budget',
    subs: [
      {
        icon: 'DocumentCopy',
        index: '/budget/board',
        title: '预算概览',
        permission: 'budget'
      },
      {
        icon: 'DocumentCopy',
        index: '/budget/quota',
        title: '部门额度',
        permission: 'budget'
      },
      {
        icon: 'DocumentCopy',
        index: '/budget/detail',
        title: '预算明细',
        permission: 'budget'
      }
    ]
  },
  {
    icon: 'Calendar',
    index: '/duty',
    title: '值班管理',
    permission: 'duty'
  },
  {
    icon: 'User',
    index: '/user',
    title: '用户管理',
    permission: 'user'
  },
  {
    icon: 'Setting',
    index: '/setting',
    title: '系统设置',
    permission: 'setting'
  }
]
const route = useRoute()
const onRoutes = computed(() => {
  return route.path
})

const sidebar = useSidebarStore()
</script>

<style lang="less" scoped>
.sidebar {
  display: block;
  position: absolute;
  left: 0;
  top: 70px;
  bottom: 0;
  overflow-y: scroll;
}
.sidebar::-webkit-scrollbar {
  width: 0;
}
.sidebar-el-menu:not(.el-menu--collapse) {
  width: 250px;
}
.sidebar > ul {
  height: 100%;
}
</style>
