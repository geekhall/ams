//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// import section
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
import { createApp } from 'vue'
import Vue from 'vue'
import 'normalize.css/normalize.css'  // 重置样式 这里引入自定义的重置样式也可
import './style.css'                  // 项目内的样式，最好放在重置样式后，uno.css前
import './tailwind.css'               // TailwindCSS
import 'uno.css'                      // UnoCSS
import './styles/theme.css'           // 主题样式
import router from './router'  // 引入路由
// import store from './store'           // 引入Pinia
import { createPinia } from 'pinia'
import { createI18n } from 'vue-i18n' // 引入vue-i18n，用于国际化
import messages from "@intlify/unplugin-vue-i18n/messages";
import * as ElementPlusIconsVue from '@element-plus/icons-vue'

import { usePermissionStore } from '~/store/permission'
import { useAuthStore } from '~/store/auth'
import 'element-plus/dist/index.css'
import '~/assets/css/icon.css'
import App from './App.vue'

const app = createApp(App)

// 设置Pinia
const pinia = createPinia()
app.use(pinia)
const authStore = useAuthStore()
authStore.initialize()

//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// setting
// 各种第三方模块的设置，如Element Plus、Vue Router、Vuex等
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
app.use(router)     // 设置Vue-router路由

// 设置vue-i18n
const i18n = createI18n({
  legacy: false,  // you must specify `false`, to use Composition API, enables the Composition API.
  globalInjection: true,  // allows you to use `this.$i18n` and `this.$t` in each component
  locale: "en", // set locale
  fallbackLocale: "en", // set fallback locale
  availableLocales: ["en", "cn"], // set locale messages
  messages: messages, // set locale messages
});
app.use(i18n)

//从 @element-plus/icons-vue 中导入所有图标并进行全局注册。
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

// 自定义权限指令
const permission = usePermissionStore();
app.directive('permission', {
  mounted(el, binding) {
    if (!permission.key.includes(String(binding.value))) {
      // el.parentNode.removeChild(el);
      // el['hidden'] = true;
    }
  },
})
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
// mount
//_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/
router.isReady().then(() => {
  app.mount('#app')
})
