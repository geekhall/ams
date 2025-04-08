<template>
  <div class="header">
    <div class="collapse-btn" @click="collapseMenu">
      <!-- <i-ep-menu class="icon" /> -->
      <el-icon size="30" v-if="sidebar.collapse"><Expand /></el-icon>
      <el-icon size="30" v-else><Fold /> </el-icon>
    </div>
    <div class="logo"></div>
    <div class="title">AMS资产管理系统</div>
    <div class="header-right">
      <div class="header-user-con">
        <!-- 消息中心 -->
        <div class="btn-bell" @click="router.push('/tabs')">
          <el-tooltip
            effect="dark"
            :content="message ? `有${message}条未读消息` : `消息中心`"
            placement="bottom"
          >
            <el-icon size="30"><Bell /> </el-icon>
          </el-tooltip>
          <span class="btn-bell-badge" v-if="message"></span>
        </div>
        <!-- 用户头像 -->
        <el-avatar class="user-avatar" :size="30" :src="imgurl" />

        <!-- 用户名下拉菜单 -->
        <el-dropdown class="user-name" trigger="click" @command="handleCommand">
          <span class="el-dropdown-link">
            {{ username }}
            <el-icon class="el-icon--right">
              <arrow-down />
            </el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <a href="https://github.com/geekhall/ams" target="_blank">
                <el-dropdown-item>
                  <el-icon
                    ><svg
                      t="1675595403992"
                      class="icon"
                      viewBox="0 0 1024 1024"
                      version="1.1"
                      xmlns="http://www.w3.org/2000/svg"
                      p-id="2674"
                      width="20"
                      height="20"
                    >
                      <path
                        d="M511.957333 21.333333C241.024 21.333333 21.333333 240.981333 21.333333 512c0 216.832 140.544 400.725333 335.573334 465.664 24.490667 4.394667 32.256-10.069333 32.256-23.082667 0-11.690667 0.256-44.245333 0-85.205333-136.448 29.610667-164.736-64.64-164.736-64.64-22.314667-56.704-54.4-71.765333-54.4-71.765333-44.586667-30.464 3.285333-29.824 3.285333-29.824 49.194667 3.413333 75.178667 50.517333 75.178667 50.517333 43.776 75.008 114.816 53.333333 142.762666 40.789333 4.522667-31.658667 17.152-53.376 31.189334-65.536-108.970667-12.458667-223.488-54.485333-223.488-242.602666 0-53.546667 19.114667-97.322667 50.517333-131.669334-5.034667-12.330667-21.930667-62.293333 4.778667-129.834666 0 0 41.258667-13.184 134.912 50.346666a469.802667 469.802667 0 0 1 122.88-16.554666c41.642667 0.213333 83.626667 5.632 122.88 16.554666 93.653333-63.488 134.784-50.346667 134.784-50.346666 26.752 67.541333 9.898667 117.504 4.864 129.834666 31.402667 34.346667 50.474667 78.122667 50.474666 131.669334 0 188.586667-114.730667 230.016-224.042666 242.090666 17.578667 15.232 33.578667 44.672 33.578666 90.453334v135.850666c0 13.141333 7.936 27.605333 32.853334 22.869334C862.250667 912.597333 1002.666667 728.746667 1002.666667 512 1002.666667 240.981333 783.018667 21.333333 511.957333 21.333333z"
                        p-id="2675"
                      ></path>
                    </svg>
                  </el-icon>
                  <span>项目仓库</span>
                </el-dropdown-item>
              </a>
              <el-dropdown-item command="profile">
                <el-icon><UserFilled /></el-icon>
                <span>个人中心</span>
              </el-dropdown-item>
              <el-dropdown-item command="setting">
                <el-icon class="i-ep-setting"></el-icon>
                <span>设置</span>
              </el-dropdown-item>
              <el-dropdown-item divided command="loginout">
                <el-icon><SwitchButton /></el-icon>
                <span>退出登录</span>
              </el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { onMounted } from 'vue'
import { useSidebarStore } from '~/store/sidebar'
import { useRouter } from 'vue-router'
import imgurl from '~/assets/img/avatar.png'
import { SwitchButton } from '@element-plus/icons-vue'
import { useAuthStore } from '~/store/auth'

const authStore = useAuthStore()
const username: string | null = authStore.username
const message: number = 2

const sidebar = useSidebarStore()

// 侧边栏菜单折叠展开
const collapseMenu = () => {
  sidebar.handleCollapse()
}

onMounted(() => {
  if (document.body.clientWidth < 1500) {
    collapseMenu()
  }
})

// 用户名下拉菜单选择事件
const router = useRouter()
const handleCommand = (command: string) => {
  console.log('handleCommand', command)
  if (command == 'loginout') {
    authStore.logout()
    router.push('/login')
  } else if (command == 'profile') {
    router.push('/profile')
  } else if (command == 'setting') {
    router.push('/setting')
  }
}
</script>

<style lang="less" scoped>
.header {
  position: relative;
  box-sizing: border-box;
  width: 100%;
  height: 70px;
  font-size: 22px;
  color: white;
  // background-color: #2c2e3a;
  background-color: #d32d2a;
}
.collapse-btn {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
  float: left;
  padding: 0 21px;
  cursor: pointer;
}
.header .logo {
  float: left;
  width: 70px;
  height: 70px;
  background-image: url('~/assets/img/logo-only-white-70.png');
  background-repeat: no-repeat;
  background-position: center;
  background-size: 50% auto; /* 宽度 100%，高度自动调整 */
}
.header .title {
  float: left;
  line-height: 70px;
  width: 300px;
}
.header-right {
  float: right;
  padding-right: 50px;
}
.header-user-con {
  display: flex;
  height: 70px;
  align-items: center;
}
.btn-fullscreen {
  transform: rotate(45deg);
  margin-right: 5px;
  font-size: 24px;
}

.btn-bell,
.btn-fullscreen {
  position: relative;
  width: 30px;
  height: 30px;
  text-align: center;
  border-radius: 15px;
  cursor: pointer;
  display: flex;
  align-items: center;
}
.btn-bell-badge {
  position: absolute;
  top: 0;
  right: 4px;
  width: 8px;
  height: 8px;
  border-radius: 4px;
  background-color: #f56c6c;
  color: white;
}
.btn-bell .el-icon-lx-notice {
  color: #fff;
}
.user-name {
  margin-left: 10px;
}
.user-avatar {
  margin-left: 20px;
}
.el-dropdown-link {
  color: #fff;
  cursor: pointer;
  display: flex;
  align-items: center;
}
.el-dropdown-menu__item {
  text-align: center;
}
</style>
