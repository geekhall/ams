<template>
  <div id="settingPage" class="content-container">
    <h1>系统设置</h1>

    <el-card class="setting-card">
      <template #header>
        <div class="card-header">
          <span>外观设置</span>
        </div>
      </template>

      <div class="setting-item">
        <div class="setting-label">深色模式</div>
        <div class="setting-control">
          <el-switch
            v-model="settings.darkMode"
            class="mb-2"
            active-text="开启"
            inactive-text="关闭"
            @change="handleDarkModeChange"
          />
        </div>
      </div>

      <div class="setting-item">
        <div class="setting-label">主题颜色</div>
        <div class="setting-control">
          <el-color-picker
            v-model="settings.themeColor"
            show-alpha
            @change="handleThemeColorChange"
          />
        </div>
      </div>

      <div class="setting-item">
        <div class="setting-label">界面语言</div>
        <div class="setting-control">
          <el-select v-model="settings.language" @change="handleLanguageChange">
            <el-option label="简体中文" value="zh-CN" />
            <el-option label="English" value="en-US" />
          </el-select>
        </div>
      </div>
    </el-card>

    <el-card class="setting-card">
      <template #header>
        <div class="card-header">
          <span>消息通知</span>
        </div>
      </template>

      <div class="setting-item">
        <div class="setting-label">系统通知</div>
        <div class="setting-control">
          <el-switch v-model="settings.notifications.system" @change="handleNotificationChange" />
        </div>
      </div>

      <div class="setting-item">
        <div class="setting-label">消息提醒</div>
        <div class="setting-control">
          <el-switch v-model="settings.notifications.message" @change="handleNotificationChange" />
        </div>
      </div>

      <div class="setting-item">
        <div class="setting-label">提醒方式</div>
        <div class="setting-control">
          <el-checkbox-group
            v-model="settings.notifications.methods"
            @change="handleNotificationChange"
          >
            <el-checkbox label="browser">浏览器通知</el-checkbox>
            <el-checkbox label="email">邮件通知</el-checkbox>
            <el-checkbox label="sms">短信通知</el-checkbox>
          </el-checkbox-group>
        </div>
      </div>
    </el-card>

    <el-card class="setting-card">
      <template #header>
        <div class="card-header">
          <span>其他设置</span>
        </div>
      </template>

      <div class="setting-item">
        <div class="setting-label">自动保存</div>
        <div class="setting-control">
          <el-switch v-model="settings.autoSave" @change="handleAutoSaveChange" />
        </div>
      </div>

      <div class="setting-item">
        <div class="setting-label">保存间隔</div>
        <div class="setting-control">
          <el-input-number
            v-model="settings.saveInterval"
            :min="1"
            :max="60"
            :disabled="!settings.autoSave"
            @change="handleSaveIntervalChange"
          />
          <span class="unit">分钟</span>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { useI18n } from 'vue-i18n'
import { useTheme } from '@/composables/useTheme'

const { t } = useI18n()
const { isDarkMode, toggleDarkMode } = useTheme()

// 设置状态
const settings = reactive({
  darkMode: false,
  themeColor: '#409EFF',
  language: 'zh-CN',
  notifications: {
    system: true,
    message: true,
    methods: ['browser']
  },
  autoSave: true,
  saveInterval: 5
})

// 加载保存的设置
onMounted(() => {
  const savedSettings = localStorage.getItem('systemSettings')
  if (savedSettings) {
    const parsedSettings = JSON.parse(savedSettings)
    Object.assign(settings, parsedSettings)
  }
})

// 保存设置到本地存储
const saveSettings = () => {
  localStorage.setItem('systemSettings', JSON.stringify(settings))
}

// 处理深色模式切换
const handleDarkModeChange = (value: boolean) => {
  toggleDarkMode()
  saveSettings()
  ElMessage.success(value ? '已开启深色模式' : '已关闭深色模式')
}

// 处理主题颜色变更
const handleThemeColorChange = (value: string) => {
  document.documentElement.style.setProperty('--el-color-primary', value)
  saveSettings()
  ElMessage.success('主题颜色已更新')
}

// 处理语言切换
const handleLanguageChange = (value: string) => {
  // TODO: 实现语言切换逻辑
  saveSettings()
  ElMessage.success('语言设置已更新')
}

// 处理通知设置变更
const handleNotificationChange = () => {
  saveSettings()
  ElMessage.success('通知设置已更新')
}

// 处理自动保存设置变更
const handleAutoSaveChange = (value: boolean) => {
  saveSettings()
  ElMessage.success(value ? '已开启自动保存' : '已关闭自动保存')
}

// 处理保存间隔变更
const handleSaveIntervalChange = (value: number) => {
  saveSettings()
  ElMessage.success(`自动保存间隔已更新为 ${value} 分钟`)
}
</script>

<style lang="less" scoped>
.setting-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.setting-item {
  display: flex;
  align-items: center;
  padding: 20px 0;
  border-bottom: 1px solid var(--el-border-color-lighter);

  &:last-child {
    border-bottom: none;
  }
}

.setting-label {
  width: 120px;
  font-size: 14px;
  color: var(--el-text-color-primary);
}

.setting-control {
  flex: 1;
  display: flex;
  align-items: center;
  gap: 10px;
}

.unit {
  margin-left: 8px;
  color: var(--el-text-color-secondary);
}

:deep(.el-checkbox-group) {
  display: flex;
  gap: 20px;
}
</style>
