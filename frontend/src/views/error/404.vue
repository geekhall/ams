<template>
  <div class="error-container">
    <div class="error-content">
      <div class="error-animation">
        <div class="error-code">404</div>
        <div class="error-icon">
          <el-icon><Search /></el-icon>
        </div>
      </div>
      <h1 class="error-title">页面未找到</h1>
      <p class="error-message">抱歉，您访问的页面不存在或已被移除</p>
      <div class="error-actions">
        <router-link to="/">
          <el-button type="primary" size="large" class="action-button">
            <el-icon><HomeFilled /></el-icon>
            返回首页
          </el-button>
        </router-link>
        <el-button type="info" size="large" class="action-button" @click="goBack">
          <el-icon><Back /></el-icon>
          返回上一页
        </el-button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts" name="404">
import { useRouter } from 'vue-router'
import { Search, HomeFilled, Back } from '@element-plus/icons-vue'

const router = useRouter()
const goBack = () => {
  router.go(-1)
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
  background: linear-gradient(45deg, #2193b0, #6dd5ed);
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
  color: #2193b0;
  animation: float 3s ease-in-out infinite;
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

@keyframes float {
  0% {
    transform: translate(-50%, -50%);
  }
  50% {
    transform: translate(-50%, -60%);
  }
  100% {
    transform: translate(-50%, -50%);
  }
}
</style>
