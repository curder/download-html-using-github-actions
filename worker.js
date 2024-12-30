addEventListener('fetch', event => {
    event.respondWith(handleRequest(event.request))
})

async function handleRequest(request) {
    const url = 'https://www.avatrade.com.tw/trading-info/cfd-rollover-dates'; // 替换为你要访问的网址

    try {
        const response = await fetch(url);
        const html = await response.text();

        // 直接返回HTML内容
        return new Response(html, {
            headers: { 'content-type': 'text/html' },
        });
    } catch (error) {
        // 如果有错误，返回错误信息
        return new Response(`Error fetching the page: ${error}`, {
            status: 500,
        });
    }
}
