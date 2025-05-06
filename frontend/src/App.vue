<template>
  <el-config-provider :locale="zhCn">
    <div :class="{ dark: isDarkMode }">
      <router-view />
    </div>
  </el-config-provider>
</template>

<script setup lang="ts">
import { ElConfigProvider } from 'element-plus'
import zhCn from 'element-plus/es/locale/lang/zh-cn'
import { useTheme } from '@/composables/useTheme'

const { isDarkMode } = useTheme()
</script>

<style lang="less">
@import './assets/css/main.css';
@import './assets/css/color-dark.css';
</style>
