<template>
  <div class="error-container">
    <div class="error-content">
      <div class="error-animation">
        <div class="error-code">500</div>
        <div class="error-icon">
          <el-icon><Warning /></el-icon>
        </div>
      </div>
      <h1 class="error-title">服务器错误</h1>
      <p class="error-message">抱歉，服务器出现了一些问题</p>
      <div class="error-actions">
        <router-link to="/">
          <el-button type="primary" size="large" class="action-button">
            <el-icon><HomeFilled /></el-icon>
            返回首页
          </el-button>
        </router-link>
        <el-button type="info" size="large" class="action-button" @click="refresh">
          <el-icon><Refresh /></el-icon>
          刷新页面
        </el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="500">
import { Warning, HomeFilled, Refresh } from '@element-plus/icons-vue'

const refresh = () => {
  window.location.reload()
}
</script>

<style scoped>
.error-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
}

.error-content {
  text-align: center;
  padding: 2rem;
  background: white;
  border-radius: 1rem;
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  max-width: 500px;
  width: 90%;
}

.error-animation {
  position: relative;
  margin-bottom: 2rem;
}

.error-code {
  font-size: 8rem;
  font-weight: 800;
  background: linear-gradient(45deg, #ff9966, #ff5e62);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  line-height: 1;
  margin-bottom: 1rem;
}

.error-icon {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  font-size: 3rem;
  color: #ff5e62;
  animation: shake 2s ease-in-out infinite;
}

.error-title {
  font-size: 2rem;
  color: #2c3e50;
  margin-bottom: 1rem;
}

.error-message {
  font-size: 1.1rem;
  color: #666;
  margin-bottom: 2rem;
}

.error-actions {
  display: flex;
  gap: 1rem;
  justify-content: center;
}

.action-button {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.8rem 1.5rem;
  transition: transform 0.2s;
}

.action-button:hover {
  transform: translateY(-2px);
}

@keyframes shake {
  0%,
  100% {
    transform: translate(-50%, -50%) rotate(0deg);
  }
  25% {
    transform: translate(-50%, -50%) rotate(-10deg);
  }
  75% {
    transform: translate(-50%, -50%) rotate(10deg);
  }
}
</style>
