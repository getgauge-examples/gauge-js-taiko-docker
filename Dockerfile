# A sample dockerfile with latest gauge and taiko 
# installed.

# NOTE: if you are using gauge+taiko, you'd be using 
# a package manager (ex. npm) which can take care of 
# installing the version of gauge+taiko that the test 
# project needs. 

# see `run_in_docker.sh` for instrutions to run without
# having to build a custom image.

FROM zenika/alpine-chrome:with-node

ENV TAIKO_SKIP_CHROMIUM_DOWNLOAD=true
ENV TAIKO_BROWSER_PATH=$CHROME_PATH

# set custom npm_prefix because the user is not 'root'
ENV NPM_CONFIG_PREFIX=/home/chrome/.npm-global
ENV PATH="${NPM_CONFIG_PREFIX}/bin:${PATH}"

RUN mkdir -p $NPM_CONFIG_PREFIX &&\
 npm install -g taiko @getgauge/cli
