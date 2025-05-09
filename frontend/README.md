# AMS (Asset Management System)

一个现代化的企业资产管理系统，提供全面的资产管理解决方案。

## 功能特性

### 1. 资产管理核心功能

- **资产全生命周期管理**
  - 资产采购申请和审批
  - 资产入库登记
  - 资产领用/借用管理
  - 资产调拨/转移
  - 资产维修/保养记录
  - 资产报废/处置流程
- **资产分类管理**
  - 多级分类体系
  - 自定义分类属性
  - 分类统计报表
- **资产标签管理**
  - 二维码/条形码生成
  - 标签打印
  - 标签批量管理

### 2. 库存管理

- 库存实时监控
- 库存预警（低库存提醒）
- 库存盘点
- 库存调拨
- 库存报表

### 3. 预算管理

- 年度预算编制
- 预算执行跟踪
- 预算调整
- 预算分析报表
- 费用报销关联

### 4. 供应商管理

- 供应商信息管理
- 供应商评估
- 采购记录
- 合同管理
- 供应商黑名单

### 5. 报表和分析

- **资产统计报表**
  - 资产分布统计
  - 资产价值统计
  - 资产使用率分析
- 预算执行报表
- 采购分析报表
- 自定义报表
- 数据可视化展示

### 6. 系统管理

- **用户权限管理**
  - 角色管理
  - 权限分配
  - 部门管理
- **系统配置**
  - 基础数据配置
  - 流程配置
  - 审批流程配置
- **系统日志**
  - 操作日志
  - 登录日志
  - 异常日志

### 7. 移动端功能

- 资产盘点
- 资产查询
- 审批处理
- 消息通知
- 扫码功能

### 8. 集成功能

- 财务系统集成
- 人事系统集成
- 采购系统集成
- 邮件系统集成
- 消息推送集成

### 9. 高级功能

- 资产折旧计算
- 资产价值评估
- 资产保险管理
- 资产维护计划
- 资产使用效率分析

### 10. 安全功能

- 数据加密
- 操作审计
- 数据备份
- 访问控制
- 敏感信息保护

### 11. 工作流功能

- 自定义审批流程
- 多级审批
- 审批委托
- 审批提醒
- 审批历史

### 12. 通知功能

- 系统通知
- 邮件通知
- 短信通知
- 消息提醒
- 待办提醒

### 13. 文档管理

- 资产相关文档
- 合同文档
- 技术文档
- 操作手册
- 文档版本控制

### 14. 数据分析

- 资产使用趋势
- 成本分析
- 效率分析
- 预测分析
- 决策支持

### 15. 用户体验优化

- 个性化界面
- 快捷操作
- 批量处理
- 导入导出
- 搜索优化

## 实施阶段

### 第一阶段：核心资产管理功能

- 资产基础信息管理
- 资产分类管理
- 资产标签管理
- 基础报表功能

### 第二阶段：流程管理功能

- 审批流程
- 预算管理
- 供应商管理
- 库存管理

### 第三阶段：高级功能

- 移动端应用
- 高级报表
- 数据分析
- 系统集成

### 第四阶段：用户体验优化

- 界面优化
- 性能优化
- 功能完善
- 系统稳定

## 技术栈

- 前端：Vue 3 + TypeScript + Element Plus
- 后端：待定
- 数据库：待定
- 移动端：待定

## 开发环境要求

- Node.js >= 16
- pnpm >= 8
- Vue 3
- TypeScript

## 安装和运行

```bash
# 安装依赖
pnpm install

# 开发环境运行
pnpm run dev

# 生产环境构建
pnpm run build
```

## 贡献指南

欢迎提交 Issue 和 Pull Request 来帮助改进项目。


## 本周任务

- 完成资产领用/借用管理
- 完成用户权限功能
- 完成预算概览
- 完成系统首页
  - 第一列显示数据（资产总数、资产总值、待处理事项、系统消息）
  - 中间显示资产分类统计、趋势统计、待办事项、系统公告
  - 最后显示快捷操作（资产登记、资产查询、资产盘点、数据导入、用户管理、系统设置）
- 完成系统配置
- 完成用户Profile页面
- 完成忘记密码和修改密码功能
- 完成个人通知功能

