docker run -v `pwd`:/tmp/gauge -w /tmp/gauge \
-e TAIKO_SKIP_CHROMIUM_DOWNLOAD=true \
-e TAIKO_BROWSER_PATH=/usr/bin/chromium-browser \
-e TAIKO_BROWSER_ARGS=--no-sandbox,--start-maximized \
-e headless_chrome=true \
zenika/alpine-chrome:with-node \
/bin/sh -c "npm install; npm test"
