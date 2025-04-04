# AMS (Asset Management System)
Asset Management System

## 架构
```
前端
  • 框架：Vue 3 + Vite
  • 状态管理：Pinia
  • 路由管理：Vue Router
  • UI 框架：Element Plus
  • 网络请求：Axios

后端：Spring Boot
  • 框架：Spring Boot 3.x
  • 安全：Spring Security + JWT
  • 持久层：MyBatis Plus
  • 接口：RESTful API + Swagger
  • 缓存：Redis
  • 数据库：MySQL
```

前端环境：[./frontend/Environment.md](./frontend/Environment.md)

后端环境：[./backend/Environment.md](./backend/Environment.md)

## 功能模块
1. 资产管理
	•	资产登记（新增、导入）
	•	资产信息维护（编辑、删除）
	•	资产分类管理（按部门、用途、类型）
	•	资产二维码生成（用于扫码盘点）

2. 资产变动管理
	•	调拨（跨部门、跨地点）
	•	报废
	•	维修记录
	•	借还管理

3. 资产盘点
	•	发起盘点计划
	•	盘点任务执行（支持扫码核对）
	•	盘点结果统计（缺失、错位、损坏）

4. 权限与用户管理
	•	用户/角色管理
	•	菜单权限控制
	•	登录/登出/密码重置（JWT）

5. 系统管理
	•	操作日志
	•	系统参数设置
	•	数据导出/导入
