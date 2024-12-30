tell application "Safari"
  activate
  open location "https://test.ah-site.cn"
  delay 5 # 等待页面开始加载
  tell window 1
    set current tab to first tab
    set HTMLSource to do JavaScript "
            new Promise((resolve) => {
                function checkReady() {
                    if (document.readyState === 'complete') {
                        resolve(document.documentElement.outerHTML);
                    } else {
                        console.log('Still waiting...');
                        setTimeout(checkReady, 100);
                    }
                }
                checkReady();
            });
        " in current tab
  end tell
  do shell script "echo " & quoted form of HTMLSource & " > cfd-rollover-dates.html"
  close current tab
  quit
end tell
