# dubbo-admin docker 镜像
此镜像为非官方dubbo-admin的docker镜像

## 用法
更改zk和密码都通过环境变量改即可

```
docker run -d \
-p 8080:8080 \
-e dubbo.registry.address=zookeeper://192.168.30.137:2181 \
-e dubbo.admin.root.password=root \
-e dubbo.admin.guest.password=guest \
chenchuxin/dubbo-admin 
```

- 运行成功后，稍等一下，访问`ip:port`即可。
- 默认账号密码是
  - 管理员：`root`：`root`
  - 游客：`guest`：`guest`