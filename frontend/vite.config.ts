import { defineConfig } from 'vite'

import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'
import path from 'path'
import VueI18nPlugin from '@intlify/unplugin-vue-i18n/vite'
import { fileURLToPath, URL } from "node:url";
// import { resolve, dirname } from "node:path";
import { dirname } from "node:path";

// pnpm i unplugin-element-plus
import ElementPlus from 'unplugin-element-plus/vite'
import Icons from 'unplugin-icons/vite'
import IconsResolver from 'unplugin-icons/resolver'

// import styleImport from 'vite-plugin-style-import'
import UnoCSS from 'unocss/vite'
import { presetIcons } from 'unocss'
import epIcons from '@iconify-json/ep'
import svgLoader from 'vite-svg-loader'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'
import { dir } from 'console'


// const path_resolve = (dir: string) => path.join(__dirname, dir)
// https://vitejs.dev/config/
export default defineConfig({
  resolve: {
    alias: {
      '@': resolve(__dirname, 'src'),
      '~/': `${path.resolve(__dirname, 'src')}/`,
    }
  },
  plugins: [
    vue({
      reactivityTransform: true,
    }),
    ElementPlus({
      // use `unplugin-auto-import` to automatically import components
      // use `unplugin-vue-components` to manually import components

    }),
    UnoCSS({
      // presets: []
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
        }
      ],
    }),
    svgLoader(),
    // styleImport({
    //   libs: [
    //     {
    //       libraryName: 'element-plus',
    //       esModule: true,
    //       ensureStyleFile: true,
    //       resolveStyle: (name) => {
    //         name = name.slice(3)
    //         return `element-plus/packages/theme-chalk/src/${name}.scss`
    //       },
    //       resolveComponent: (name) => {
    //         return `element-plus/lib/${name}`
    //       },
    //     },
    //   ],
    // }),
    AutoImport({
      imports: ['vue', 'vue/macros', 'vue-router', '@vueuse/core'],
      dts: true,
      resolvers: [
        // 自动导入ElementPlus组件
        ElementPlusResolver(),
        // 自动导入Icons图标
        IconsResolver({
          prefix: 'Icon',
        }),
      ],
    }),
    VueI18nPlugin({
      include: resolve(dirname(fileURLToPath(import.meta.url)), './src/locales/**'),
    }),
    Components({
      dts: true,
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
  ],
  server: {
    port: 4000,
    // open: true, // 自动打开浏览器
    hmr: true,  // 热模块替换
    base: './', // 生产环境下的公共路径
    proxy: {
      // 选项写法
      // 本地开发环境通过代理实现跨域，生产环境使用后端CORS或者nginx 转发
      // 正则表达式写法
      //这里是通过请求/api 来转发到 https://api.xxx.com/
      //假如你要请求https://api.xxx.com/a/a
      //那么axios的url，可以配置为 /api/a/a

      // 这里下面的写法表示直接将'/api/xxx'转发至'http://localhost:8000/api/xxx'
      // 例如：
      // http://localhost:4000/api/account/img_captcha/
      // 会转发到：↓
      // http://localhost:8888/api/account/img_captcha/
      // '/api': 'http://localhost:8000/'

      // 而下面这种写法会使用rewrite功能去掉网址中的'/api'
      // 例如：
      // http://localhost:4000/api/account/img_captcha/
      // 会转发到：↓
      // http://localhost:8888/account/img_captcha/
      '/api': {
        target: 'http://localhost:8888', // 后端服务实际地址
        changeOrigin: true, // 开启代理换源功能，服务器端接收到的请求源为localhost:8888
        // ws: true,        // 支持websocket
        // rewrite: (path) => path.replace(/^\/api/, '')
      }
    }
  }
})
