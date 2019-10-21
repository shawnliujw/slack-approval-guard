FROM shawnliu/kubectl-node
MAINTAINER Shanw Liu <shawn.jw.liu@gmail.com>
WORKDIR /app

COPY package.json  ./
RUN yarn install

FROM shawnliu/kubectl-node
MAINTAINER Shanw Liu <shawn.jw.liu@gmail.com>
WORKDIR /app
ENV TZ=Asia/Shanghai
COPY --from=0 /app/node_modules /app/node_modules
ADD src/check.js ./
ADD package.json .
RUN npm i -g
