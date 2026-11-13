# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 08
- Section: IV-BCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | 2.14 |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?utm_source=chatgpt.com&id=dd98238d6b64b5dbf3b541984d7012dadb13acd6

## Question

In a month with no requests at all, which costs remain in each setup, and why?

When there are no requests, API Gateway and Lambda have no charges for processing requests because no one is using the API. However, DynamoDB still has storage costs because the saved messages remain in the table. For the EC2 setup, costs continue because the server, storage, and monitoring are still running even when no one uses the application.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless setup is better for the Lab 4 message API because it costs only $2.14 per month, compared to $12.51 for the EC2 setup. It is cheaper for handling one million requests per month based on our estimates. When there are no requests, API Gateway and Lambda have no request or execution charges, while DynamoDB still has storage costs. It also requires less work from our group because we do not need to manage and update an EC2 server. Therefore, we recommend the serverless setup because it is cheaper and easier to maintain.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| julienaulolsayu | Prepared the submission and wrote the answers. |
| PorkAdubuu | Helped set up the AWS Pricing Calculator estimate. |
| chuulinnn | Checked the service settings and estimated costs. |
| marionnn10 | Helped compare the serverless and EC2 setups. |
