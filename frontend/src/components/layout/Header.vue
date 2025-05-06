<template>
  <div class="header">
    <div class="left-menu">
      <el-icon class="toggle-icon" @click="toggleSidebar">
        <expand v-if="isCollapse" />
        <fold v-else />
      </el-icon>
      <breadcrumb />
    </div>
    <div class="right-menu">
      <el-dropdown class="avatar-container" trigger="click">
        <div class="avatar-wrapper">
          <el-avatar :size="40" :src="userStore.avatar" />
          <span class="user-name">{{ userStore.name }}</span>
          <el-icon class="el-icon--right"><arrow-down /></el-icon>
        </div>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="handleCommand('profile')">
              <el-icon><user /></el-icon>
              <span>个人信息</span>
            </el-dropdown-item>
            <el-dropdown-item @click="handleCommand('settings')">
              <el-icon><setting /></el-icon>
              <span>账号设置</span>
            </el-dropdown-item>
            <el-dropdown-item @click="handleCommand('notifications')">
              <el-icon><bell /></el-icon>
              <span>消息通知</span>
              <el-badge
                v-if="unreadNotifications > 0"
                :value="unreadNotifications"
                class="notification-badge"
              />
            </el-dropdown-item>
            <el-dropdown-item @click="handleCommand('help')">
              <el-icon><question-filled /></el-icon>
              <span>帮助中心</span>
            </el-dropdown-item>
            <el-dropdown-item divided @click="handleCommand('logout')">
              <el-icon><switch-button /></el-icon>
              <span>退出登录</span>
            </el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/stores/user'
import { ElMessageBox } from 'element-plus'
import {
  ArrowDown,
  User,
  Setting,
  Bell,
  QuestionFilled,
  SwitchButton,
  Expand,
  Fold
} from '@element-plus/icons-vue'
import Breadcrumb from './Breadcrumb.vue'

const router = useRouter()
const userStore = useUserStore()
const unreadNotifications = ref(3) // 示例：未读消息数量
const isCollapse = ref(false)

const toggleSidebar = () => {
  isCollapse.value = !isCollapse.value
  // TODO: 触发侧边栏折叠事件
}

const handleCommand = async (command: string) => {
  switch (command) {
    case 'profile':
      router.push('/profile')
      break
    case 'settings':
      router.push('/settings')
      break
    case 'notifications':
      router.push('/notifications')
      break
    case 'help':
      router.push('/help')
      break
    case 'logout':
      try {
        await ElMessageBox.confirm('确定要退出登录吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        })
        await userStore.logout()
        router.push('/login')
      } catch {
        // 用户取消操作
      }
      break
  }
}
</script>

<style scoped>
.header {
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 20px;
  background: #fff;
  box-shadow: 0 1px 4px rgba(0, 21, 41, 0.08);
}

.left-menu {
  display: flex;
  align-items: center;
}

.toggle-icon {
  font-size: 20px;
  cursor: pointer;
  margin-right: 20px;
}

.avatar-wrapper {
  display: flex;
  align-items: center;
  cursor: pointer;
  padding: 0 8px;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.avatar-wrapper:hover {
  background-color: rgba(0, 0, 0, 0.04);
}

.user-name {
  margin: 0 8px;
  font-size: 14px;
  color: #606266;
}

.el-dropdown-menu__item {
  display: flex;
  align-items: center;
  padding: 8px 16px;
}

.el-dropdown-menu__item .el-icon {
  margin-right: 8px;
  font-size: 16px;
}

.notification-badge {
  margin-left: auto;
}

:deep(.el-dropdown-menu__item) {
  display: flex;
  align-items: center;
  padding: 8px 16px;
}

:deep(.el-dropdown-menu__item .el-icon) {
  margin-right: 8px;
  font-size: 16px;
}
</style>
