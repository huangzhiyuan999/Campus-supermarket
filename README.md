# 🍱 校园超市 (Sky Take-out)

> **项目描述：** 开发的高性能超市点单系统。项目采用前后端分离架构，模拟真实企业开发场景，涵盖员工管理、分类管理、商品管理、商品套单管理、订单处理等核心业务。

<div align="center">
  <img src="https://tse3.mm.bing.net/th/id/OIP.gIVg5eHeGXWOCIzhIjJM5wHaDJ?rs=1&pid=ImgDetMain&o=7&rm=3" alt="校园超市 Slogan" width="400"/>
</div>

---

## 🚀 项目介绍

本项目旨在解决超市速递平台从**后台管理**到**用户点单**的全流程业务。系统分为**管理端**（Web后台）和**用户端**（移动端），实现了商品展示、购物车、下单支付、订单派送等完整的商品外送业务闭环。

### 核心功能模块
- **管理端：** 员工登录/管理、分类管理、商品/套餐管理、订单管理、数据统计。
- **用户端：** 用户登录、商品浏览、购物车管理、地址管理、在线下单、订单支付（模拟）。

---

## 🛠️ 技术栈

本项目严格遵循企业级开发规范，采用业界主流的开发技术：

### 后端 (SpringBoot)
- **核心框架：** SpringBoot 2.7.x
- **持久层：** MyBatis + MySQL 8.0 (存储业务数据)
- **缓存：** Redis (缓存商品、套餐数据，Token存储)
- **工具：** Lombok, Hutool, JWT (用户身份验证), Apache POI (Excel导出)

### 前端 (Vue)
- **管理端：** Vue.js 2.6 + Element UI (PC端管理后台)
- **用户端：** web原生开发 (Vue)
- **通信：** Axios (前后端数据交互)

---

## ⚙️ 依赖环境与中间件

为了保证项目能够顺利运行，请确保你的开发环境满足以下要求：

| 组件类型 | 名称 | 版本/要求 | 说明 |
| :--- | :--- | :--- | :--- |
| **开发语言** | Java | JDK 17 或 8 | 根据项目具体配置 |
| **数据库** | MySQL | 5.7 / 8.0 | 存储菜品、订单、用户信息 |
| **缓存中间件** | Redis | 6.0+ | 提升系统查询性能，解决缓存一致性 |
| **构建工具** | Maven | 3.6+ | 依赖管理 |
| **开发工具** | IDE | IntelliJ IDEA | 后端开发 |
| **前端工具** | IDE | VS Code |

---

## 📂 目录结构

```text
supermarket/
├── super-common/           # 通用工具类、常量、异常处理
├── super-pojo/             # 实体类 (DTO, VO, Entity)
├── super-server/           # 服务层 (Service, Mapper)
├── super-admin/            # 管理端 Web 项目 (Controller)
├── super-user/             # 用户端 Web 项目 (Controller)
├── super-web-admin/        # 管理端 Vue 前端代码
├── super-web-user/         # 用户端 前端代码
└── pom.xml               # Maven 父工程聚合
