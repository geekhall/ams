# Environment

## 0. 软件版本列表

```txt
pnpm: 6.32.6
node: 18.11.18
typescript: 4.9.3
vue: 3.2.45
vite: 4.0.0
vue-router: 4.0.13
element-plus: 2.2.28
pinia: 4.0.2
axios: 1.2.3
```

## 1. 初始化Vite工程

```bash
pnpm create vite
pnpm install
pnpm run dev
```

## 2. 安装及配置Element Plus

### 2.1 安装Element Plus

```bash
pnpm install -D element-plus
# or
yarn add element-plus -D

```

### 2.2 配置完整导入Element Plus

```ts
// main.ts
import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import App from './App.vue'

const app = createApp(App)

app.use(ElementPlus)
app.mount('#app')
```

Volar支持
如果您使用 `Volar`，请在 `tsconfig.json` 中通过 `compilerOptions.type` 指定全局组件类型。

```json
// tsconfig.json
{
  "compilerOptions": {
    // ...
    "types": ["element-plus/global"]
  }
}
```

### 2.2 配置按需导入Element Plus(推荐)

安装`unplugin-vue-components` 和 `unplugin-auto-import`这两款插件

```bash
pnpm install -D unplugin-vue-components unplugin-auto-import
yarn add unplugin-element-plus -D
# or
pnpm install unplugin-element-plus -D
```

修改`vite.config.ts` 配置文件

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'

export default defineConfig({
  plugins: [
    vue(),
    AutoImport({
      resolvers: [ElementPlusResolver()],
    }),
    Components({
      resolvers: [ElementPlusResolver()],
    }),
  ],
})

```

## 3. 安装及配置Vue Router

### 3.1 安装Vue Router

```bash
pnpm install vue-router@next
# or
yarn add vue-router@next
```

### 3.2 配置Vue Router

创建`router`文件夹，并在文件夹中创建`index.ts`文件

```ts
import { createRouter, createWebHistory } from 'vue-router'
import type { App } from 'vue'

// 1. Define route components.
const Home = () => import('../views/Home.vue')
const About = () => import('../views/About.vue')

// 2. Define some routes
const routes = [
  { path: '/', name: "home", component: Home },
  { path: '/about', name: "about", component: About }
]

// 3. Create the router instance and pass the `routes` option
const router = createRouter({
  // createWebHashHistory // (hash路由)
  // createWebHistory // (history路由)
  // createMemoryHistory // (内存路由)
  // 添加baseUrl， createWebHistory({ base: '/base/' })
  history: createWebHistory(),
  routes // short for `routes: routes`
})

export function setupRouter(app: App<Element>) {
  app.use(router)
}

export default router

```

在`main.ts`中引入`router`并挂载

```ts
import { createApp } from 'vue'
import App from './App.vue'
import router, { setupRouter } from './router'

const app = createApp(App)

// 设置路由
setupRouter(app)

router.isReady().then(() => {
  app.mount('#app')
})

```

安装`@types/node` 解决`import path from 'path'`模块报错

```bash
pnpm install @types/node -D
```

配置`vite.config.ts`文件

```ts
import { resolve } from 'path'

export default defineConfig({
  // ...
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '@c': resolve(__dirname, 'src/components'),
      '@v': resolve(__dirname, 'src/views'),
    }
  }
})

```

## 4. 安装及配置Pinia

### 4.1 安装Pinia

```bash
pnpm install pinia
```

### 4.2 配置Pinia

在`main.ts`中引入`pinia`并挂载

```ts
// ...
import { createPinia } from 'pinia'
// 设置Pinia
const pinia = createPinia()
app.use(pinia)
```

创建`store`文件夹，并在文件夹中创建`index.ts`文件

```ts
import type { App } from 'vue'
import { defineStore } from 'pinia'
const mainStore = defineStore('main', {
  state: () => ({
    count: 0,
    name: 'AMS',
  }),
  getters: {
    doubleCount: (state) => state.count * 2,
  },
  actions: {
    increment() {
      this.count++
    },
    decrement() {
      this.count--
    }
  }
})

export default mainStore

```

在组件或者ts中使用Pinia：

```vue
<template>
  <div class="counter">
    <h3>Counter</h3>
    <hr />
    <h2>{{ cnt }}</h2>
    <p>Counter page</p>
    <el-button type="primary" @click="increase">Increase</el-button>
    <el-button type="primary" @click="decrease">Decrease</el-button>
  </div>
</template>
<script lang="ts" setup>
import { computed, ref } from 'vue'
import mainStore from '~/store'
const store = mainStore()

const cnt = computed(() => store.count)
const increase = () => store.increment()
const decrease = () => store.decrement()
</script>
```

```ts
import { computed, ref } from "vue";
import { useStore } from "vuex";
const store = useStore();

const cnt = computed(() => store.state.count);
const increase = () => store.commit("increment", { amount: 2 });
const decrease = () => store.commit("decrement", { amount: 2 });

```

## 5. 安装及配置Axios

### 5.1 安装Axios

```bash
pnpm install axios --save
```

### 5.2 配置Axios

创建`utils`文件夹，并在文件夹中创建`request.ts`文件,

```ts
import axios, { AxiosRequestConfig, AxiosResponse } from 'axios';
import { useRouter } from 'vue-router';

const router = useRouter();

export default function request(config: AxiosRequestConfig) {

  // 1. 创建 axios 实例
  const instance = axios.create({
    baseURL: '/api',
    timeout: 5000,
    headers: {
      'Content-Type': 'application/json',
    }
  })
  // 2. axios 的拦截器
  // 2.1 请求拦截的作用
  instance.interceptors.request.use(
    (config) => {
      const token = localStorage.getItem('token');
      if (token) {
        config.headers.Authorization = token;
      }
      return config;
    },
    (err) => {
      console.log(err);
      return Promise.reject(err);
    }
  );

  // 2.2 响应拦截
  instance.interceptors.response.use(
    (res) => {
      return res.data;
    },
    (err: any) => {
      if (err?.response) {
        switch (err.response.status) {
          case 400:
            err.message = '请求错误';
            break;
          case 401:
            err.message = '未授权，请登录';
            break;
          case 403:
            err.message = '拒绝访问';
            break;
          case 404:
            err.message = `请求地址出错: ${err.response.config.url}`;
            break;
          case 408:
            err.message = '请求超时';
            break;
          case 500:
            err.message = '服务器内部错误';
            break;
          case 501:
            err.message = '服务未实现';
            break;
          case 502:
            err.message = '网关错误';
            break;
          case 503:
            err.message = '服务不可用';
            break;
          case 504:
            err.message = '网关超时';
            break;
          case 505:
            err.message = 'HTTP版本不受支持';
            break;
          default:
            err.message = '未知错误';
            break;
        }
        return Promise.reject(err);
      } else {
        if (err.message.includes('timeout')) {
          err.message = '请求超时';
        }
        if (err.message.includes('Network Error')) {
          err.message = '网络错误';
        }
        return Promise.reject(err);
      }
      console.log(err);
    }
  )


  return instance(config);
}


```

在`vite.config.ts`中引入`request.ts`并挂载

```ts
server: {
    port: 4000,
    open: true, // 自动打开浏览器
    hmr: true,  // 热模块替换
    base: './', // 生产环境下的公共路径
    proxy: {
      '/api': {
        target: 'http://localhost:8888', // 后端服务实际地址
        changeOrigin: true, // 开启代理换源功能，服务器端接收到的请求源为localhost:8888
        // ws: true,        // 支持websocket
        rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  }

```

## 6. 安装及配置vue-i18n，添加国际化支持

### 6.1 安装vue-i18n

```bash

pnpm install vue-i18n@9 --save
pnpm install @intlify/unplugin-vue-i18n
```

`src` 目录下新建 `locales` 文件夹，里面新建 `locales.ts` 文件，用于定义语言包类型

```ts
export enum Locales {
  EN = 'en',
  CN = 'cn',
}

export const LOCALES = [
  { value: Locales.EN, caption: 'English' },
  { value: Locales.CN, caption: '中文' },
]

```

`locales` 文件夹中新建 `index.ts` 文件，用于导出所有语言包

```ts
import { Locales } from './locales';

import en from './en.json';
import cn from './cn.json';

export const messages = {
  [Locales.EN]: en,
  [Locales.CN]: cn,
}

export const defaultLocale = Locales.EN;

```

`locales` 文件夹中新建 `en.json` 文件和`cn.json`文件，用于定义中英文语言包

```json
{
  "hello": "hello world"
}
```

```json
{
  "hello": "你好，世界"
}
```

在`vite.config.ts`中添加如下内容，配置国际化插件

```ts
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import VueI18nPlugin from '@intlify/unplugin-vue-i18n/vite'
import { fileURLToPath, URL } from "node:url";
import { resolve, dirname } from "node:path";

export default defineConfig({
  plugins: [
    vue(),
    VueI18nPlugin({
      include: resolve(dirname(fileURLToPath(import.meta.url)), './src/locales/**'),
    })
  ],
  resolve: {
    alias: {
      '@': fileURLToPath(new URL('./src', import.meta.url)),
    },
  },
})
```

在 `main.ts` 中添加如下内容，配置国际化

```ts
import { createApp } from 'vue'
import App from './App.vue'
import { createI18n } from 'vue-i18n'
import messages from "@intlify/unplugin-vue-i18n/messages";
const i18n = createI18n({
  legacy: false,  // you must specify `false`, to use Composition API, enables the Composition API.
  globalInjection: true,  // allows you to use `this.$i18n` and `this.$t` in each component
  locale: "en", // set locale
  fallbackLocale: "en", // set fallback locale
  availableLocales: ["en", "cn"], // set locale messages
  messages: messages, // set locale messages
});
const app = createApp(App)

app.use(i18n) // 挂载i18n到app
router.isReady().then(() => {
  app.component('svg-icon', svgIcon)
    .mount('#app')
})

```

使用：

```vue
<template>
  <div>
    <h1>{{ $t('hello') }}</h1>
  </div>
</template>
```

## 7. 配置vueuse

```bash
pnpm install @vueuse/core --save
```

创建 `composables` 文件夹，用于存放非页面的组合式组件

使用：

```ts
import { reactive } from "vue";
import { useEventListener, useMouse } from "@vueuse/core";

const { x, y } = useMouse();
console.log(x.value);

const mouse = reactive(useMouse());
console.log(mouse.x);

// 使用vueuse的useEventListener
useEventListener("mousemove", (e: MouseEvent) => {
  console.log(e.clientX, e.clientY);
});
```

## 8. 安装使用ESLint和Prettier

### 8.1 安装ESLint

```bash

pnpm install eslint --save-dev
pnpm install @vue/eslint-config-typescript --save-dev
pnpm install @vue/eslint-config-prettier --save-dev
```

在项目根目录下新建 `.eslintrc.js` 文件，添加如下内容

```js
module.exports = {
  root: true,
  env: {
    node: true,
  },
  extends: [
    'plugin:vue/vue3-essential',
    '@vue/typescript/recommended',
    '@vue/prettier',
    '@vue/prettier/@typescript-eslint',
  ],
  parserOptions: {
    ecmaVersion: 2020,
  },
  rules: {
    'no-console': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
  },
};
```

### 8.2 安装Prettier

```bash
pnpm install prettier --save-dev
```

在项目根目录下新建 `.prettierrc` 文件，添加如下内容

```json
{
  "printWidth": 100,
  "tabWidth": 2,
  "useTabs": false,
  "semi": true,
  "singleQuote": true,
  "quoteProps": "as-needed",
  "jsxSingleQuote": false,
  "trailingComma": "es5",
  "bracketSpacing": true,
  "jsxBracketSameLine": false,
  "arrowParens": "always",
  "requirePragma": false,
  "insertPragma": false,
  "proseWrap": "preserve",
  "htmlWhitespaceSensitivity": "css",
  "vueIndentScriptAndStyle": false,
  "endOfLine": "lf"
}
```

## 9. 安装使用TailwindCSS

### 9.1 安装TailwindCSS

```bash
pnpm install tailwindcss@latest postcss@latest autoprefixer@latest --save-dev
```

### 9.2 创建TailwindCSS配置文件

执行`pnpx tailwindcss init -p` 命令，会在项目根目录下生成 `tailwind.config.cjs` 文件和 `postcss.config.cjs` 文件，
配置内容如下：

```js
// tailwind.config.cjs
/** @type {import('tailwindcss').Config} */
module.exports = {
  purge: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'], // tree-shaking for production
  darkMode: false, // or 'media' or 'class'
  content: [],
  theme: {
    extend: {},
  },
  plugins: [],
  corePlugins: {
    preflight: false, // disable preflight, 解决 tailwindcss 与 Element Plus 样式冲突问题
  }
}
```

`preflight: false,`这个比较重要，否则会和Element Plus的样式冲突

```js
// postcss.config.cjs
module.exports = {
  plugins: {
    tailwindcss: {},
    autoprefixer: {},
  },
}
```

### 9.4 创建 `tailwind.css` 文件

```css
// ./src/tailwind.css
@tailwind base;
@tailwind components;
@tailwind utilities;
```

### 9.5 在 `main.ts` 中引入 `tailwind.css`

```ts
import './tailwind.css'
```

### 10 安装使用UnoCSS

### 10.1 安装UnoCSS

```bash
pnpm i -D unocss @unocss/vite
```

### 10.2 配置UnoCSS

在 `vite.config.ts` 中添加如下配置

```ts
import UnoCSS from 'unocss/vite'
// ...
export default defineConfig({
  // ...
  plugins: [
    // ...
    UnoCSS({
      // presets: []
    }),
  ],
})
```

### 10.3 在 `main.ts` 中引入 `unocss.css`

```ts
import 'uno.css'
```

## 11. 安装使用Normalize.css

### 11.1 安装Normalize.css

```bash
pnpm i -D normalize.css
```

### 11.2 在 `main.ts` 中引入 `normalize.css`

```ts
import 'normalize.css/normalize.css'
```

## 12. 安装使用iconify

### 12.1 安装iconify

```bash
pnpm i -D @iconify/iconify vite-plugin-purge-icons @iconify/json
```

### 12.2 配置iconify(暂时不用，有问题，待解决)

按照以下步骤配置iconify后，Vite启动会报443错误，暂时不用

在 `vite.config.ts` 中添加如下配置

```ts
// vite.config.ts
import PurgeIcons from 'vite-plugin-purge-icons'

// ...
export default defineConfig({
  // ...
  plugins: [
    // ...
    PurgeIcons({
      // Specify the icons pack to use (default: 'mdi')
    }),
  ],
})
```

### 12.3 在 `main.ts` 中引入 `iconify`

```ts
// main.ts
import '@purge-icons/generated'

```

### 12.4 在 `App.vue` 中使用iconify

可以在 [iconify](https://iconify.design/icon-sets/) 中搜索图标，然后复制图标代码

## 13 自动导入ElementPlus组件、函数、Icons、样式

### 13.1 安装插件

```bash
pnpm i -D unplugin-icons @iconify-json/ep
pnpm i @element-plus/icons-vue
```

### 13.2 配置插件

```ts
// vite.config.ts
import Icons from 'unplugin-icons/vite'
import IconsResolver from 'unplugin-icons/resolver'

// ...
export default defineConfig({
  // ...
  plugins: [
    // ...
    AutoImport({
      resolvers: [
        // 自动导入Icons图标
        IconsResolver({
          prefix: 'Icon',
        }),
        Components({
          resolvers: [
            ElementPlusResolver(),
            // 自动导入Icons图标
            IconsResolver({
              enabledCollections: ['ep']
            })
          ],
          // 自动导入的组件包含文件夹，扫描该文件夹下所有的.vue文件
          dirs: [
            "./src/components/**",
            "./src/views/**",
            "./src/layouts/**",
            "./src/composables/**"
          ],
        }),
        Icons({
          autoInstall: true,
        }),
        // ...
  ],
})

```

```ts
// vite.config.ts
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

import Unocss from 'unocss/vite'
import { presetIcons } from 'unocss'

export default defineConfig({
  plugins: [
    vue(),

    // 添加以下配置
    Unocss({
      presets: [
        presetIcons({
          scale: 1.2,
          warn: true
        }),
      ],
      // 以下配置是为了可以直接使用标签 <i-ep-edit />
      variants: [
        {
          match: (s) => {
            if (s.startsWith('i-')) {
              return {
                matcher: s,
                selector: (s) => {
                  return s.startsWith('.') ? `${s.slice(1)},${s}` : s
                },
              }
            }
          },
        },
      ],
    })
  ]
})
```

参考：[https://juejin.cn/post/7091967019959975943](https://juejin.cn/post/7091967019959975943)

### 13.3 使用

```vue
<template>
  <div style="margin: 50px;">
    <el-space direction="vertical" alignment="left">
      <!-- 直接使用 -->
      <el-space>
        <!-- 使用class -->
        <div class="i-ep-lock"></div>
        <!-- 使用标签 -->
        <i-ep-edit />
      </el-space>

      <!-- 组件里使用 -->
      <el-button icon="i-ep-avatar">Button</el-button>

      <el-input prefix-icon="i-ep-search" suffix-icon="i-ep-pointer" ></el-input>

      <el-menu>
        <el-menu-item >
          <el-icon class="i-ep-menu"></el-icon>
          <span>Navigator Two</span>
        </el-menu-item>
      </el-menu>

    </el-space>
  </div>
</template>

## 14. 安装使用vite-svg-loader

### 14.1 安装

```bash
pnpm i -D vite-svg-loader
```

### 14.2 配置

```ts
// vite.config.ts
import svgLoader from 'vite-svg-loader'
export default defineConfig({
  plugins: [
    // ...
    svgLoader(),
  ],
});
```

现在就可以以组件的形式导入svg文件，url或者raw-data了，
这里编写一个icon组件统一管理svg图标

```vue
<template>
  <component :is="icon" class="fill-current" />
</template>

<script lang="ts" setup>
import { ref } from 'vue'
import { defineAsyncComponent } from 'vue'

const props = defineProps({
  name: {
    type: String,
    required: true
  }
})

const icon = defineAsyncComponent(() => import(`~/assets/svg/${props.name}.svg`))
</script>

<style lang="less" scoped>
</style>

```

### 14.3 使用

```vue
<icon name="ep-home-1"></icon>
<icon name="ep-home-1-door-1"></icon>
```

## 15. 集成wangEditor富文本编辑器

### 15.1 安装

```bash
pnpm i wangeditor
```

### 15.2 使用

```vue
<template>
  <div class="content-container">
    <h1>Editor</h1>
    <hr />
    <div class="plugins-tips">
      <p>使用 <a href="https://www.wangeditor.com/" target="_blank">wangeditor</a> 富文本编辑器</p>
    </div>
    <div class="editor-container">
      <div class="editor mgb20" ref="editor"></div>
      <div class="editor-content">
        <el-input type="textarea" v-model="editorContent.html" placeholder="请输入内容" />
        <el-button class="btn" type="primary" @click="syncHTML">同步</el-button>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import wangEditor from 'wangeditor'
import { ref, reactive, onMounted, onBeforeUnmount } from 'vue'

const editor = ref(null as any)
const editorContent = reactive({
  html: '',
  text: ''
})

let editorInstance: any = null

onMounted(() => {
  editorInstance = new wangEditor(editor.value)
  editorInstance.config.zIndex = 1
  editorInstance.create()
  editorInstance.txt.html(editorContent.html)
  editorInstance.onchange = () => {
    editorContent.html = editorInstance.txt.html()
    editorContent.text = editorInstance.txt.text()
  }
})
onBeforeUnmount(() => {
  editorInstance.destroy()
  editorInstance = null
})

const syncHTML = () => {
  editorContent.html = editorInstance.txt.html()
  console.log(editorContent.html)
}
</script>

<style lang="less" scoped>
.editor-container {
  display: flex;
  .editor {
    flex: 1;
  }
  .editor-content {
    flex: 1;
    margin-left: 20px;
  }
}
</style>

```

## 16. 集成md-editor-v3 版本的Markdown编辑器

### 16.1 安装

```bash
pnpm i md-editor-v3
```

## 16.2 使用

```vue
<template>
  <md-editor class="mgb20" v-model="text" @on-upload-img="onUploadImg" />
</template>

<script setup lang="ts" name="md">
import { ref } from 'vue'
import MdEditor from 'md-editor-v3'
import 'md-editor-v3/lib/style.css'

const text = ref('Hello Editor!')
const onUploadImg = (files: any) => {
  console.log(files)
}
</script>

```

## 17. 添加Excel导入导出功能

```bash
pnpm i xlsx
```

## 18. 添加vue-cropperjs图片裁剪功能

```bash
pnpm i --save-dev @types/vue-cropperjs
```

## 19 添加chart.js图表功能

```bash
pnpm i vue-chartjs chart.js
```

### 19.1 使用

```vue
<template>
  <div class="content-container">
    <h1>Charts</h1>
    <Bar :data="data" :options="options" />
    <hr />
    <Bar :data="bar_data" :options="bar_options" />
    <hr />
    <Bubble :data="bubble_data" :options="bubble_options" />
  </div>
</template>

<script lang="ts" setup>
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
} from 'chart.js'
import { Bar } from 'vue-chartjs'
import { reactive } from 'vue'

ChartJS.register(CategoryScale, LinearScale, BarElement, Title, Tooltip, Legend)

const data = {
  loaded: false,
  labels: ['January', 'February', 'March'],
  datasets: [
    {
      label: 'Data One',
      backgroundColor: '#345678',
      data: [40, 20, 12]
    }
  ]
}
const options = {
  responsive: true
}
</script>

```

### 启动环境

```bash
npx vite --port=4000
```

会随VSCode启动，自动打开浏览器

## Data

参考[data/loki.sql](data/loki.sql)文件

## 打包部署

pnpm i -g serve

```bash
pnpm run build
cd dist;
serve
```
