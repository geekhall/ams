
<template>
  <the-header></the-header>
  <the-sidebar></the-sidebar>
  <div class="content-box" :class="{ 'content-collapse': sidebar.collapse }">
    <v-tags></v-tags>
    <div class="content">
      <router-view v-slot="{ Component }">
        <transition name="move" mode="out-in">
          <keep-alive :include="tags.nameList">
            <component :is="Component"></component>
          </keep-alive>
        </transition>
      </router-view>
    </div>
  </div>
</template>

<script lang="ts" setup>
import { useSidebarStore } from '~/store/sidebar'
import { useTagsStore } from '~/store/tags'
import TheHeader from '../components/layout/TheHeader.vue'
import TheSidebar from '../components/layout/TheSidebar.vue'
import VTags from '~/components/Tags.vue'

const sidebar = useSidebarStore()
const tags = useTagsStore()
</script>

<style lang="less" scoped>
</style>
