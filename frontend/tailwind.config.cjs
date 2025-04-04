/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./index.html', './src/**/*.{vue,js,ts,jsx,tsx}'],// tree-shaking for production
  theme: {
    extend: {},
  },
  plugins: [],
  corePlugins: {
    preflight: false, // disable preflight, 解决 tailwindcss 与 Element Plus 样式冲突问题
  }
}
