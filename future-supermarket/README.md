# 未来超市 - 校园电商系统

## 项目介绍
模仿美团小象超市实现校园商店快递解决方案，基于Spring Boot + Vue 3前后端分离架构，模拟真实企业开发流程。
后端负责商品管理、订单系统、数据统计等核心业务，集成Java版AI购物助手，通过大模型API+函数调用实现聊天式加购、多轮对话，为师生提供高效便捷的线上购物体验。

## 技术栈
### 后端
- **核心框架**：Spring Boot 2.7.x
- **数据库**：MySQL 8.0 + Redis 6.x
- **ORM框架**：MyBatis-Plus
- **AI集成**：大模型API + 函数调用
- **工具类**：Lombok、Hutool
- **构建工具**：Maven 3.8.x

### 前端
- **框架**：Vue 3 + Element Plus
- **构建工具**：Vite

## 项目结构
future-supermarket
├── src/main/java
│ ├── com/future/supermarket
│ │ ├── controller # 控制器层
│ │ ├── service # 业务逻辑层
│ │ ├── mapper # 数据访问层
│ │ ├── entity # 实体类
│ │ ├── dto # 数据传输对象
│ │ ├── config # 配置类
│ │ └── utils # 工具类
├── src/main/resources # 配置文件
├── pom.xml # Maven 依赖
└── README.md # 项目说明
## 快速启动
1.  克隆项目到本地
    ```bash
    git clone https://gitee.com/huang-zhiyuanzzzz/future-supermarket.git
2.配置 MySQL 数据库，执行sql脚本初始化表结构

3.修改application.yml中的数据库连接信息

4.启动FutureSupermarketApplication.java，后端服务启动成功

5.启动前端项目，访问http://localhost:8080

### 功能模块

商品管理：商品浏览、分类、搜索

订单系统：下单、支付、订单管理

数据统计：销售数据、用户数据统计

AI 购物助手：聊天式加购、多轮对话

用户管理：登录、权限控制
