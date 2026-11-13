# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 10
- Section: IV-BCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 USD |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 USD |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 USD |
| **Total** | | 2.14 USD |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=3978d45d7ab15c4e17d07e2baf5436abdd96b463

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the serverless setup, the request-related costs of API Gateway and Lambda would become almost zero because there are no requests to process. DynamoDB storage charges would still remain because the stored data continues to occupy space. In the EC2 setup, the instance and EBS storage charges would continue because the instance is running and the storage is allocated even when there is no incoming traffic.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

For the Lab 4 message API with 1 million requests per month, I recommend the serverless setup because it can handle requests without requiring a continuously running server. The serverless setup costs approximately $2.14 per month, while the EC2 setup costs approximately $12.51 per month. The serverless setup is suitable for workloads that may change because API Gateway, Lambda, and DynamoDB charge based on requests, execution, and storage. The EC2 setup has a more predictable monthly instance cost, but the instance and storage charges continue even when there are no requests. Serverless requires managing the API, Lambda functions, and DynamoDB configuration, while EC2 requires more responsibility for the server, operating system, application environment, and maintenance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ambv13 | Configure Amazon API Gateway, record its monthly cost, and verify the estimate settings. |
| CANLASpogi | Configure AWS Lambda, check the architecture, requests, duration, memory, and record its cost. |
| kopibean101223 | Configure Amazon DynamoDB, verify on-demand capacity, storage, read/write assumptions, and record its cost. |
| DrMacky | Configure the EC2 estimate, verify its instance and storage settings, and help compare the two setups.