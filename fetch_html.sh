#!/bin/bash

# 定义URL变量
URL="https://www.wikipedia.org"
# 定义命令数组
commands=(
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome99"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome100"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome101"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome104"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome107"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome110"
    "lwthiker/curl-impersonate:0.6-chrome curl_chrome116"
    "lwthiker/curl-impersonate:0.6-chrome curl_edge99"
    "lwthiker/curl-impersonate:0.6-chrome curl_edge101"
    "lwthiker/curl-impersonate:0.6-chrome curl_safari15_3"
    "lwthiker/curl-impersonate:0.6-chrome curl_safari15_5"
    "lwthiker/curl-impersonate:0.6-ff curl_ff91esr"
    "lwthiker/curl-impersonate:0.6-ff curl_ff95"
    "lwthiker/curl-impersonate:0.6-ff curl_ff98"
    "lwthiker/curl-impersonate:0.6-ff curl_ff100"
    "lwthiker/curl-impersonate:0.6-ff curl_ff102"
    "lwthiker/curl-impersonate:0.6-ff curl_ff109"
    "lwthiker/curl-impersonate:0.6-ff curl_ff117"
)

# 定义函数来获取网页内容
fetch_html() {
    local command=$1
    local output=$(docker run --rm $command $URL)
    echo "$output" > fetched_html.html
    return $(echo "$output" | grep -c '<title>Just a moment...</title>')
}


# 循环尝试每个命令
for command in "${commands[@]}"; do
    echo "Trying with $command"
    fetch_html "$command" "$URL"
    if [ $? -eq 0 ]; then
        echo "Success: Content retrieved without 'Just a moment...' title."
        exit 0
    else
        echo "Retry: 'Just a moment...' title detected."
    fi
done

echo "All commands failed to retrieve content without 'Just a moment...' title."
exit 1
