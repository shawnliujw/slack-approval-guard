#!/usr/bin/env bash
docker build -t registry.cn-shanghai.aliyuncs.com/shawn_repo/slack-approval-guard:1.5 .
docker push registry.cn-shanghai.aliyuncs.com/shawn_repo/slack-approval-guard:1.5
#docker run -it --publish 7001:7001 -e REDIS_HOST=xxx -e SLACK_TOKEN=xxx -e SLACK_SECRET=xx -e SLACK_CHANNEL=xxx   registry.cn-shanghai.aliyuncs.com/shawn_repo/slack-approval
