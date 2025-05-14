<template>
  <div class="sidebar">
    <el-menu
      class="sidebar-el-menu"
      :default-active="onRoutes"
      :collapse="sidebar.collapse"
      :router="true"
      :unique-opened="true"
    >
      <template v-for="item in filteredMenuItems" :key="item.index">
        <template v-if="item.subs">
          <el-sub-menu :index="item.index">
            <template #title>
              <el-icon>
                <component :is="item.icon"></component>
              </el-icon>
              <span>{{ item.title }}</span>
            </template>
            <template v-for="subItem in item.subs" :key="subItem.index">
              <el-sub-menu v-if="subItem.subs" :index="subItem.index">
                <template #title>{{ subItem.title }}</template>
                <el-menu-item
                  v-for="(threeItem, i) in subItem.subs"
                  :key="i"
                  :index="threeItem.index"
                >
                  {{ threeItem.title }}
                </el-menu-item>
              </el-sub-menu>
              <el-menu-item v-else :index="subItem.index">
                {{ subItem.title }}
              </el-menu-item>
            </template>
          </el-sub-menu>
        </template>
        <template v-else>
          <el-menu-item :index="item.index">
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
import { useSidebarStore } from '@/stores/sidebar'
import { useRoute } from 'vue-router'
import { PermissionType } from '@/types/user'
import { useUserStore } from '@/stores/user'
import { hasPermission } from '@/utils/permission'

interface MenuItem {
  icon: string
  index: string
  title: string
  subs?: MenuItem[]
  permission?: PermissionType | PermissionType[]
}

const items: MenuItem[] = [
  {
    icon: 'HomeFilled',
    index: '/',
    title: '系统首页',
    permission: PermissionType.DASHBOARD_VIEW
  },
  {
    icon: 'DocumentCopy',
    index: '/asset',
    title: '资产管理',
    permission: [PermissionType.ASSET_VIEW, PermissionType.ASSET_MANAGE],
    subs: [
      {
        icon: 'DocumentCopy',
        index: '/asset',
        title: '固定资产',
        permission: [PermissionType.ASSET_VIEW, PermissionType.ASSET_MANAGE]
      },
      {
        icon: 'Platform',
        index: '/system',
        title: '系统清单',
        permission: [PermissionType.SYSTEM_VIEW, PermissionType.SYSTEM_MANAGE]
      }
    ]
  },
  {
    icon: 'Money',
    index: '',
    title: '预算管理',
    permission: [PermissionType.BUDGET_VIEW, PermissionType.BUDGET_MANAGE],
    subs: [
      {
        icon: 'DocumentCopy',
        index: '/budget/board',
        title: '预算概览',
        permission: PermissionType.BUDGET_VIEW
      },
      {
        icon: 'DocumentCopy',
        index: '/budget/quota',
        title: '部门额度',
        permission: PermissionType.BUDGET_VIEW
      },
      {
        icon: 'DocumentCopy',
        index: '/budget/detail',
        title: '预算明细',
        permission: PermissionType.BUDGET_VIEW
      }
    ]
  },
  {
    icon: 'Message',
    index: '/message',
    title: '消息管理',
    permission: [PermissionType.MESSAGE_VIEW, PermissionType.MESSAGE_MANAGE]
  },
  {
    icon: 'User',
    index: '/user',
    title: '用户管理',
    permission: PermissionType.USER_MANAGE
  },
  {
    icon: 'Setting',
    index: '/setting',
    title: '系统设置',
    permission: PermissionType.SETTING_MANAGE
  }
]

const route = useRoute()
const onRoutes = computed(() => {
  return route.path
})

const sidebar = useSidebarStore()
const userStore = useUserStore()

// Filter menu items based on user permissions
const filteredMenuItems = computed(() => {
  return items.filter((item) => {
    // If item has no permission requirement, show it
    if (!item.permission) return true

    // Check if user has permission for this item
    const hasItemPermission = hasPermission(userStore.userInfo, item.permission)
    if (!hasItemPermission) return false

    // If item has subs, filter them based on permissions
    if (item.subs) {
      item.subs = item.subs.filter((subItem) => {
        if (!subItem.permission) return true
        return hasPermission(userStore.userInfo, subItem.permission)
      })
      // Only show parent item if it has visible subs
      return item.subs.length > 0
    }

    return true
  })
})
</script>

<style lang="less" scoped>
.sidebar {
  display: block;
  position: absolute;
  left: 0;
  top: 70px;
  bottom: 0;
  overflow-y: auto;
  background: #fff;
  box-shadow: 2px 0 8px rgba(0, 0, 0, 0.05);
  transition: all 0.3s;

  &::-webkit-scrollbar {
    width: 6px;
  }

  &::-webkit-scrollbar-thumb {
    background: #e0e0e0;
    border-radius: 3px;

    &:hover {
      background: #bdbdbd;
    }
  }
}

.sidebar-el-menu {
  border-right: none !important;

  &:not(.el-menu--collapse) {
    width: 250px;
  }

  :deep(.el-menu-item),
  :deep(.el-sub-menu__title) {
    height: 50px;
    line-height: 50px;
    color: #606266;
    transition: all 0.3s;

    &:hover {
      background-color: #f5f7fa;
      color: #409eff;
    }

    &.is-active {
      background-color: #ecf5ff;
      color: #409eff;
      font-weight: 600;

      &::before {
        content: '';
        position: absolute;
        left: 0;
        top: 0;
        bottom: 0;
        width: 4px;
        background: #409eff;
      }
    }
  }

  :deep(.el-sub-menu) {
    .el-menu-item {
      min-width: auto;
      padding-left: 48px !important;
    }
  }

  :deep(.el-menu-item-group__title) {
    padding: 0;
  }

  :deep(.el-sub-menu__title) {
    &:hover {
      background-color: #f5f7fa;
    }
  }

  :deep(.el-menu-item),
  :deep(.el-sub-menu__title) {
    .el-icon {
      margin-right: 12px;
      font-size: 18px;
      vertical-align: middle;
    }
  }
}

:deep(.el-menu--collapse) {
  .el-sub-menu__title {
    span {
      display: none;
    }
  }
}
</style>
