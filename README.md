# 使用GitHub Actions自动下载HTML

使用 GitHub Actions 每小时自动下载指定 HTML 并更新到 [cfd-rollover-dates.yml](https://github.com/curder/download-html-using-github-actions/tree/cfd-rollover-dates) 分支。

```bash
git clone -b cfd-rollover-dates https://github.com/curder/download-html-using-github-actions.git
cd download-html-using-github-actions
```

在项目仓库目录下的 `cfd-rollover-dates.html` 就是最新的文件。

或者直接下载 [HTML 文件](https://raw.githubusercontent.com/curder/download-html-using-github-actions/refs/heads/cfd-rollover-dates/cfd-rollover-dates.html)地址到本地。

## 参考网址

- [使用 Curl Impersonate 以 Chrome 或 Firefox 身份进行抓取](https://scrapfly.io/blog/curl-impersonate-scrape-chrome-firefox-tls-http2-fingerprint/)