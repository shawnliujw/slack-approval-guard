FROM shawnliu/kubectl-node:13-12
MAINTAINER Shanw Liu <shawn.jw.liu@gmail.com>
WORKDIR /app

COPY package.json  ./
RUN yarn install

FROM shawnliu/kubectl-node:13-12
MAINTAINER Shanw Liu <shawn.jw.liu@gmail.com>
WORKDIR /app
ENV TZ=Asia/Shanghai
COPY --from=0 /app/node_modules /app/node_modules
RUN npm  install  @sentry/cli
RUN ln -s $PWD/node_modules/.bin/sentry-cli /usr/local/bin/sentry-cli
ADD src/ ./src/
ADD package.json .
RUN npm i -g
