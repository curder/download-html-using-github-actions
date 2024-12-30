tell application "Safari"
  activate
  open location "https://www.avatrade.com.tw/trading-info/cfd-rollover-dates"
  delay 20 # 等待页面开始加载
  tell window 1
    set current tab to first tab
    set HTMLSource to do JavaScript "
            new Promise(resolve => {
                if (document.readyState === 'complete') {
                    resolve(document.documentElement.outerHTML);
                } else {
                    document.addEventListener('readystatechange', function() {
                        if (document.readyState === 'complete') {
                            resolve(document.documentElement.outerHTML);
                        }
                    });
                }
            });
        " in current tab
  end tell
  do shell script "echo " & quoted form of HTMLSource & " > cfd-rollover-dates.html"
  close current tab
  quit
end tell
