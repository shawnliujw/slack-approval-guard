# Slack Approval Guard
With this repo and [Slack Approval Citedal](https://github.com/shawnliujw/slack-approval-citadel) you can easily inject the approval process to [Gitlab CI/CD](https://docs.gitlab.com/ee/ci/)  pipeline.  
To enhance your auto deployment process.

## How to use  
1. Ensure you have setup [Slack Approval Citedal](https://github.com/shawnliujw/slack-approval-citadel) and get public domain , like `http://slack.example.com`  
2. Use it in your gitlab-ci:  
* Now this image integrated kubectl already
```yaml
deploy_prod:
  image: registry.cn-shanghai.aliyuncs.com/shawn_repo/slack-approval-guard
  stage: sample
  script:
    - guard setup $CI_PROJECT_NAME -n $CI_PROJECT_NAMESPACE -e $CI_ENVIRONMENT_NAME -P $CI_PROJECT_URL -p $CI_PIPELINE_ID -b $CI_COMMIT_REF_NAME -a $GITLAB_USER_NAME -c $CI_COMMIT_TITLE -C $CI_COMMIT_SHA -s 'http://slack.example.com/approval'
    - if [ $N -ne 0 ];  then exit ; fi
    - [your other scripts]
```

## Workflow  
1. registry approval with the command above, then the pipeline will show message like below:  
![Waiting Approve](./images/registry.png)
2. then in the configured slack channel, you will see message like below:  
![Slack Approval Message](./images/slace-approving.png)  

3. when the assignee click the button, slack will work like below:  
![Slack Approved](./images/slack-approved.png)

4. meanwhile you receive message from step 3, the pipeline will also show message like below:  
* Approved  
![Approved](./images/approved.png)  

* Rejected  
![Rejected](./images/rejected.png)


guard setup 'proejctName' -n 'namespace' -e 'env' -P 'projectURL' -p '$CI_PIPELINE_ID' -b '$CI_COMMIT_REF_NAME' -a '$GITLAB_USER_NAME' -c '$CI_COMMIT_TITLE' -C '$CI_COMMIT_SHA' -s 'http://slack.example.com/approval'
