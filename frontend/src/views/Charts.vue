<template>
  <div class="content-container">
    <div class="plugins-tips">
      vue-chartjs：vue.js封装chart.js的图表组件。 访问地址：
      <a href="https://vue-chartjs.org/" target="_blank">vue-chartjs</a>
    </div>
    <hr />

    <div class="chart-box">
      <div class="content-title">柱状图</div>
      <bar-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">气泡图</div>
      <bubble-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">环状图</div>
      <doughnut-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">饼状图</div>
      <pie-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">折线图</div>
      <line-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">极地图</div>
      <polar-area-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">雷达图</div>
      <radar-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">散点图</div>
      <scatter-chart class="chart" />
    </div>

    <div class="chart-box">
      <div class="content-title">响应式随机图示例</div>
      <random-chart class="chart" />
    </div>
  </div>
</template>

<script lang="ts" setup>
</script>

<style lang="less" scoped>
.chart-box {
  display: inline-block;
  margin: 20px;
}
.chart {
  width: 600px;
  height: 400px;
}
.content-title {
  clear: both;
  font-weight: 400;
  line-height: 50px;
  margin: 10px 0;
  font-size: 22px;
  color: #1f2f3d;
}
</style>
