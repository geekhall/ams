# AMS (Asset Management System)

一个现代化的企业资产管理系统，提供全面的资产管理解决方案。

## 功能特性

### 1. 资产管理核心功能

- **资产全生命周期管理**
  - 资产入库登记
  - 资产领用/借用管理
  - 资产维修/保养记录
  - 资产报废/处置流程
- **资产分类管理**
  - 多级分类体系
  - 自定义分类属性
  - 分类统计报表

### 2. 预算管理

- 年度预算编制
- 预算执行跟踪
- 预算调整
- 预算分析报表
- 费用报销关联

### 3. 供应商管理

- 供应商信息管理
- 供应商评估
- 采购记录
- 合同管理
- 供应商黑名单

### 4. 系统管理

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

### 5. 通知功能

- 系统通知
- 邮件通知
- 短信通知
- 消息提醒
- 待办提醒

### 6. 用户体验优化

- 个性化界面
- 快捷操作
- 批量处理
- 导入导出
- 搜索优化

## 技术栈

- 前端：Vue 3 + TypeScript + Element Plus
- 后端：待定
- 数据库：待定
- 移动端：待定

## 开发环境要求

- Node.js >= 16
- pnpm >= 8
- Element Plus
- Vue Router
- Vue 3
- Pinia
- TypeScript
- Redis
- MySQL
- Docker
- Spring Boot 3
- MyBatis Plus
- Spring Security

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

- 完成资产领用/借用管理√
- 完成系统消息功能√
- 完成用户权限功能&前端代码重构（ing）
- 完成预算概览
- 完成系统首页
  - 第一列显示数据（资产总数、资产总值、待处理事项、系统消息）
  - 中间显示资产分类统计、趋势统计、待办事项、系统公告
  - 最后显示快捷操作（资产登记、资产查询、资产盘点、数据导入、用户管理、系统设置）
- 完成系统配置
- 完成用户Profile页面
- 完成忘记密码和修改密码功能
- 完成个人通知功能

