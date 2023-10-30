## 1. 基本介绍

### 1.1 项目介绍

> 考试系统是一个基于 [vue](https://vuejs.org) 和 [gin](https://gin-gonic.com) 开发的前后端分离的开发基础的平台。

[在线预览](http://demo.gin-vue-admin.com): http://demo.gin-vue-admin.com

测试用户名：admin

测试密码：123456

### 1.2 贡献指南
后端使用了 [gin-vue-admin](https://www.gin-vue-admin.com/)。


## 2. 使用说明

```
- node版本 > v16.8.3
- golang版本 >= v1.16
- IDE推荐：Goland
```

### 2.1 server项目

使用 `Goland` 等编辑工具，打开server目录，不可以打开 gin-vue-admin 根目录

```bash

# 克隆项目
git clone https://github.com/flipped-aurora/gin-vue-admin.git

# 导入数据库文件，在docs文件目录下面 exam.sql文件

# 进入server文件夹
cd server

# 使用 go mod 并安装go依赖包
go generate

# 编译 
go build -o server main.go (windows编译命令为go build -o server.exe main.go )

# 运行二进制
./server (windows运行命令为 server.exe)
```

### 2.2 web项目

```bash
# 进入web文件夹
cd exam_vue

# 安装依赖
npm install

# 启动web项目
npm run serve
```




