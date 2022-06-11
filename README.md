# http-doctor

A doctor tool to check your http service.

## 响应头设置最佳实践

1. 前端资源缓存问题
   1. `expires` `cache-control`
   2. `etag` `last-modified`
   3. `date`
   4. 请求头 `cache-control: no-cache` `pragma: no-cache`
2. 压缩问题 `content-encoding: gzip`
   1. 请求头 `accept-encoding: gzip, deflate, br`
3. 常见问题场景兼容适配 `vary: Accept-Encoding` `public`
4. 跨域设置
   1. `access-control-allow-origin: *`
   2. `access-control-allow-credentials: true`
5. cdn 设置场景 `x-cache` 等
6. 其他
   1. `strict-transport-security: max-age=31536000; includeSubDomains; preload`
   2. `content-disposition: inline; filename="main.fa543e80.js"`
   3. `content-type: application/javascript; charset=utf-8`
