# curl

[curl 的用法指南](https://www.ruanyifeng.com/blog/2019/09/curl-reference.html)

- `-A` 参数指定客户端的用户代理标头，即User-Agent。curl 的默认用户代理字符串是curl/[version]。
- `-b` 参数用来向服务器发送 Cookie。
- `-c` 参数将服务器设置的 Cookie 写入一个文件。
- `-d` 参数用于发送 POST 请求的数据体。
- `--data-urlencode` 参数等同于 `-d`，发送 POST 请求的数据体，区别在于会自动将发送的数据进行 URL 编码。
- `-e` 参数用来设置 HTTP 的标头Referer，表示请求的来源。
  - `-H` 参数可以通过直接添加标头Referer，达到同样效果。
- `-F` 参数用来向服务器上传二进制文件。
  - 也可以指定 MIME 类型、文件名
- `-G` 参数用来构造 URL 的查询字符串。
- `-H` 参数添加 HTTP 请求的标头。
- `-i` 参数打印出服务器回应的 HTTP 标头。
  - 先输出服务器回应的标头，然后空一行，再输出网页的源码。
- `-I` 参数向服务器发出 HEAD 请求，然会将服务器返回的 HTTP 标头打印出来。
  - `--head` 参数等同于 `-I`。
- `-k` 参数指定跳过 SSL 检测。
- `-L` 参数会让 HTTP 请求跟随服务器的重定向。curl 默认不跟随重定向。
- `--limit-rate` 用来限制 HTTP 请求和回应的带宽，模拟慢网速的环境。
- `-o` 参数将服务器的回应保存成文件，等同于wget命令。
- `-O` 参数将服务器回应保存成文件，并将 URL 的最后部分当作文件名。
- `-s` 参数将不输出错误和进度信息。
- `-S` 参数指定只输出错误信息，通常与-s一起使用。
- `-u` 参数用来设置服务器认证的用户名和密码。
- `-v` 参数输出通信的整个过程，用于调试。
  - `--trace` 参数也可以用于调试，还会输出原始的二进制数据。
- `-x` 参数指定 HTTP 请求的代理。
- `-X` 参数指定 HTTP 请求的方法。
- `--compressed` 请求头中会添加 Accept-Encoding: deflate, gzip
  - `--compressed` 会向网站请求压缩后的文档 (使用 deflate 或 gzip)，然后会自动解压返回解压后的数据。
  - 请求压缩后的数据也可以用 `-H` 参数添加请求头。`-H "Accept-Encoding: gzip, deflate"` 但这样响应的就是 gzip 文件，curl 不会把内容解压出来
  - https://stackoverflow.com/questions/8364640/how-to-properly-handle-a-gzipped-page-when-using-curl

更多参看 [Curl Cookbook](https://catonmat.net/cookbooks/curl)

## test

测试 github pages https://doc.deepjs.cn/

```bash
curl 'https://doc.deepjs.cn/' \
  -I \
  -H 'authority: doc.deepjs.cn' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: none' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
accept-ranges: bytes
access-control-allow-origin: *
age: 0
cache-control: max-age=600
content-encoding: gzip
content-length: 3464
content-type: text/html; charset=utf-8
date: Thu, 02 Jun 2022 16:19:51 GMT
etag: W/"629884c0-4040"
expires: Thu, 02 Jun 2022 16:29:04 GMT
last-modified: Thu, 02 Jun 2022 09:37:04 GMT
server: GitHub.com
vary: Accept-Encoding
via: 1.1 varnish
x-cache-hits: 0
x-cache: MISS
x-fastly-request-id: d12a15b33310b1b0886d1291911d938c104d1c0a
x-github-request-id: 8B6E:34E9:922FE:D5B83:6298E2F8
x-proxy-cache: MISS
x-served-by: cache-hkg17935-HKG
x-timer: S1654186791.151130,VS0,VE266


curl 'https://doc.deepjs.cn/assets/js/115.0ec4586c.js' \
  -I \
  -H 'authority: doc.deepjs.cn' \
  -H 'accept: application/signed-exchange;v=b3;q=0.7,*/*;q=0.8' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'purpose: prefetch' \
  -H 'referer: https://doc.deepjs.cn/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: empty' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
accept-ranges: bytes
access-control-allow-origin: *
age: 0
cache-control: max-age=600
content-encoding: gzip
content-length: 453
content-type: application/javascript; charset=utf-8
date: Thu, 02 Jun 2022 16:20:44 GMT
etag: W/"629884c0-4e1"
expires: Thu, 02 Jun 2022 16:29:05 GMT
last-modified: Thu, 02 Jun 2022 09:37:04 GMT
server: GitHub.com
vary: Accept-Encoding
via: 1.1 varnish
x-cache-hits: 0
x-cache: MISS
x-fastly-request-id: f522e800dcf2998ba3b9fb6a433e4c2e994e2f37
x-github-request-id: A580:578F:A598D:F7AD9:6298E2F8
x-origin-cache: HIT
x-proxy-cache: MISS
x-served-by: cache-hkg17923-HKG
x-timer: S1654186844.276278,VS0,VE262
```

测试 oss cdn https://static.xxx.com/cdn/dist/

```bash
curl https://static.xxx.com/cdn/dist/ -I

HTTP/2 200
# accept-ranges: bytes
access-control-allow-origin: *
# age: 54
content-encoding: gzip
content-length: 2173
content-md5: gMXSq7TMg2hZa5SGOxda5w==
content-type: text/html
date: Thu, 02 Jun 2022 14:33:04 GMT
eagleid: 700d4d1e16541803849238400e
etag: "80C5D2ABB4CC8368596B94863B175AE7"
last-modified: Tue, 25 Jan 2022 07:46:39 GMT
server: Tengine
timing-allow-origin: *
vary: Accept-Encoding
via: c4.l2cn1827(68,68,200-0,M), c30.l2cn1827(69,0), c9.cn4553(76,76,200-0,M), c10.cn4553(78,0)
x-cache: MISS TCP_MISS dirn:-2:-2
x-oss-cdn-auth: success
x-oss-hash-crc64ecma: 12051643344960215624
x-oss-object-type: Normal
x-oss-request-id: 6298CA205DFDD13931425C12
x-oss-server-time: 1
x-oss-storage-class: Standard
x-sqd-ctime: 3600
x-sqd-gstime: 1654180384
x-sqd-stime: Thu, 02 Jun 2022 14:33:05 GMT


curl 'https://static.xxx.com/cdn/dist/' \
  -I \
  -H 'authority: static.xxx.com' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'cache-control: no-cache' \
  -H 'pragma: no-cache' \
  --compressed

# 不会手动加 -H 'accept-encoding: gzip, deflate, br' \
# 因为响应的是压缩文件，curl 不会自动解压


curl 'https://static.xxx.com/cdn/dist/' \
  -I \
  -H 'authority: static.xxx.com' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: Hm_lvt_1ad52ff1b1447f91fc11d270e0c7bc07=1645429489; SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: none' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
access-control-allow-origin: *
age: 3070
ali-swift-global-savetime: 1654183513
content-encoding: gzip
content-length: 1059
content-md5: gMXSq7TMg2hZa5SGOxda5w==
content-type: text/html
date: Thu, 02 Jun 2022 15:25:13 GMT
eagleid: ddb5402316541865834021259e
last-modified: Tue, 25 Jan 2022 07:46:39 GMT
server: Tengine
timing-allow-origin: *
vary: Accept-Encoding
via: cache78.l2cn3022[234,233,200-0,M], cache58.l2cn3022[235,0], cache9.cn4493[0,0,200-0,H], cache15.cn4493[1,0]
x-cache: HIT TCP_MEM_HIT dirn:10:402950486
x-oss-cdn-auth: success
x-oss-hash-crc64ecma: 12051643344960215624
x-oss-object-type: Normal
x-oss-request-id: 6298D659F15BB23338FEBBDD
x-oss-server-time: 126
x-oss-storage-class: Standard
x-swift-cachetime: 3600
x-swift-savetime: Thu, 02 Jun 2022 15:25:13 GMT


curl 'https://static.xxx.com/cdn/dist/static/js/index.js' \
  -I \
  -H 'authority: static.xxx.com' \
  -H 'accept: */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: Hm_lvt_1ad52ff1b1447f91fc11d270e0c7bc07=1645429489; SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'origin: https://static.xxx.com' \
  -H 'pragma: no-cache' \
  -H 'referer: https://static.xxx.com/cdn/dist/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: script' \
  -H 'sec-fetch-mode: cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
accept-ranges: bytes
access-control-allow-credentials: true
access-control-allow-methods: GET
access-control-allow-origin: *
access-control-max-age: 0
age: 69
ali-swift-global-savetime: 1654186556
cache-control: max-age=31536000
content-length: 30
content-md5: 0T+vFmWUW3P1hDdRE+AvFw==
content-type: application/javascript
date: Thu, 02 Jun 2022 16:15:56 GMT
eagleid: ddb5402516541866250983502e
etag: "D13FAF1665945B73F584375113E02F17"
last-modified: Tue, 04 Jan 2022 07:53:28 GMT
server: Tengine
timing-allow-origin: *
via: cache73.l2cn3022[121,121,200-0,M], cache77.l2cn3022[123,0], cache20.cn4493[0,0,200-0,H], cache17.cn4493[2,0]
x-cache: HIT TCP_MEM_HIT dirn:-2:-2
x-oss-cdn-auth: success
x-oss-hash-crc64ecma: 10280487272850929990
x-oss-object-type: Normal
x-oss-request-id: 6298E23C35EB2636386CB10C
x-oss-server-time: 40
x-oss-storage-class: Standard
x-swift-cachetime: 31104000
x-swift-savetime: Thu, 02 Jun 2022 16:15:56 GMT
```

测试七牛 cdn

```bash
curl 'https://img.xxx.com/20210727134106f249b2896.jpg' \
  -I \
  -H 'Accept: image/avif,image/webp,image/apng,image/svg+xml,image/*,*/*;q=0.8' \
  -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'Connection: keep-alive' \
  -H 'DNT: 1' \
  -H 'Referer: https://www.xxx.com/' \
  -H 'Sec-Fetch-Dest: image' \
  -H 'Sec-Fetch-Mode: no-cors' \
  -H 'Sec-Fetch-Site: same-site' \
  -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36' \
  -H 'sec-ch-ua: "Chromium";v="104", "/Not)A;Brand";v="24", "Google Chrome";v="104"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  --compressed \
  --insecure

HTTP/2 200
server: openresty/1.13.6.2
date: Sat, 11 Jun 2022 11:56:37 GMT
content-type: image/jpeg
content-length: 57892
x-ratelimit-limit: 3000
x-ratelimit-remaining: 2999
accept-ranges: bytes
access-control-allow-origin: *
access-control-expose-headers: X-Log, X-Reqid
access-control-max-age: 2592000
age: 53
cache-control: public, max-age=31536000
content-disposition: inline; filename="20210727134106f249b2896.jpg"; filename*=utf-8''20210727134106f249b2896.jpg
content-transfer-encoding: binary
etag: "ACMzMYOe6d6HpnoaifikytexRW4M"
x-log: X-Log;IMAGESLIM:58;BOOTS-PROXY:58;BOOTS-PROXY:59;BOOTS-PIPE:59;BOOTS-PROXY:59;BOOTS-PROXY:62;X-Log;FUSIONGATE:67;DORA-PROXY:69
x-m-log: QNM:cdn-cache-dls-zjwz-wz-1;QNM3
x-m-reqid: iMwcyFaYy
x-qiniu-zone: 0
x-qnm-cache: Hit
x-reqid: sN6KL91iU
x-slim-origin: 0
x-svr: IO

```


测试 https://cra-example.vercel.app/

```bash
curl 'https://cra-example.vercel.app/' \
  -I \
  -H 'authority: cra-example.vercel.app' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed


HTTP/2 200
accept-ranges: bytes
access-control-allow-origin: *
age: 92
cache-control: public, max-age=0, must-revalidate
content-disposition: inline; filename="index.html"
content-length: 644
content-type: text/html; charset=utf-8
date: Thu, 02 Jun 2022 16:05:18 GMT
etag: W/"fdcf174b9d8bc825399eacbfb5c4c50bf5df23fb57f29451499a5c3a4fc8e43c"
server: Vercel
strict-transport-security: max-age=63072000; includeSubDomains; preload
x-vercel-cache: HIT
x-vercel-id: hnd1:hnd1::g9wrf-1654185918378-70a8a304c6e5


curl 'https://cra-example.vercel.app/static/js/main.fa543e80.js' \
  -I \
  -H 'authority: cra-example.vercel.app' \
  -H 'accept: */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'referer: https://cra-example.vercel.app/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: script' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
access-control-allow-origin: *
age: 161
cache-control: s-maxage=31536000, immutable
content-disposition: inline; filename="main.fa543e80.js"
content-encoding: gzip
content-type: application/javascript; charset=utf-8
date: Thu, 02 Jun 2022 16:06:27 GMT
etag: W/"569ce68091f7f67fe86a64af820e6682ab578758ecd6cd1494baba2e393bac13"
server: Vercel
strict-transport-security: max-age=63072000; includeSubDomains; preload
x-vercel-cache: HIT
x-vercel-id: hnd1:hnd1::qtll2-1654185987433-681047b15091
```

测试 https://cra-example.netlify.app/

```bash
curl 'https://cra-example.netlify.app/' \
  -I \
  -H 'authority: cra-example.netlify.app' \
  -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: document' \
  -H 'sec-fetch-mode: navigate' \
  -H 'sec-fetch-site: same-origin' \
  -H 'sec-fetch-user: ?1' \
  -H 'upgrade-insecure-requests: 1' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
age: 0
cache-control: public, max-age=0, must-revalidate
content-length: 644
content-type: text/html; charset=UTF-8
date: Thu, 02 Jun 2022 16:11:46 GMT
etag: "00273c5d079940245ea3344425b84380-ssl"
server: Netlify
strict-transport-security: max-age=31536000; includeSubDomains; preload
x-nf-request-id: 01G4JJZTRWGQA7CYJYDHK8CH44


curl 'https://cra-example.netlify.app/static/js/main.fa543e80.js' \
  -I \
  -H 'authority: cra-example.netlify.app' \
  -H 'accept: */*' \
  -H 'accept-language: zh-CN,zh;q=0.9,en;q=0.8' \
  -H 'cache-control: no-cache' \
  -H 'cookie: SL_G_WPT_TO=zh; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1' \
  -H 'dnt: 1' \
  -H 'pragma: no-cache' \
  -H 'referer: https://cra-example.netlify.app/' \
  -H 'sec-ch-ua: " Not A;Brand";v="99", "Chromium";v="102", "Google Chrome";v="102"' \
  -H 'sec-ch-ua-mobile: ?0' \
  -H 'sec-ch-ua-platform: "macOS"' \
  -H 'sec-fetch-dest: script' \
  -H 'sec-fetch-mode: no-cors' \
  -H 'sec-fetch-site: same-origin' \
  -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/102.0.5005.61 Safari/537.36' \
  --compressed

HTTP/2 200
accept-ranges: bytes
age: 0
cache-control: public, max-age=0, must-revalidate
content-encoding: gzip
content-type: application/javascript; charset=UTF-8
date: Thu, 02 Jun 2022 16:12:51 GMT
etag: "2b4dd9728fc3c166d9fc1461b7725c90-ssl-df"
server: Netlify
strict-transport-security: max-age=31536000; includeSubDomains; preload
vary: Accept-Encoding
x-nf-request-id: 01G4JK1TK4ZY081CKFQXSSC88K
```

参考

- https://imququ.com/post/vary-header-in-http.html

