<template>
  <el-breadcrumb separator="/">
    <el-breadcrumb-item v-for="(item, index) in breadcrumbs" :key="index">
      <span v-if="index === breadcrumbs.length - 1" class="no-redirect">{{ item.meta.title }}</span>
      <a v-else @click.prevent="handleLink(item)">{{ item.meta.title }}</a>
    </el-breadcrumb-item>
  </el-breadcrumb>
</template>

<script setup lang="ts">
import { ref, watch } from 'vue'
import { useRoute, useRouter, RouteLocationMatched } from 'vue-router'

const route = useRoute()
const router = useRouter()
const breadcrumbs = ref<RouteLocationMatched[]>([])

const getBreadcrumb = () => {
  let matched = route.matched.filter((item) => item.meta && item.meta.title)
  breadcrumbs.value = matched
}

const handleLink = (item: RouteLocationMatched) => {
  const { redirect, path } = item
  if (redirect) {
    router.push(redirect.toString())
    return
  }
  router.push(path)
}

watch(
  () => route.path,
  () => getBreadcrumb(),
  {
    immediate: true
  }
)
</script>

<style scoped>
.el-breadcrumb {
  display: inline-block;
  font-size: 14px;
  line-height: 50px;
  margin-left: 8px;
}

.no-redirect {
  color: #97a8be;
  cursor: text;
}
</style>
