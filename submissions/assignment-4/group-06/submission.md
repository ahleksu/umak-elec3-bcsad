# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 6
- Section: IV-BCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service            | Settings                                                                                           | Monthly cost (USD) |
| ------------------ | -------------------------------------------------------------------------------------------------- | ------------------ |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each                                                            | 1.25               |
| AWS Lambda         | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB                                         | 0.41               |
| Amazon DynamoDB    | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48               |
| **Total**          |                                                                                                    | 2.14               |

## Estimate 2: the Lab 2 setup

| Service    | Settings                                                                           | Monthly cost (USD) |
| ---------- | ---------------------------------------------------------------------------------- | ------------------ |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51              |

Share link of our estimate: https://calculator.aws/#/estimate?id=02fe41ce668311955dd3a42c4763d0481a3d38c7

## Question

In a month with no requests at all, which costs remain in each setup, and why?

For the Lab 4 endpoint, almost nothing remains. API Gateway and Lambda bill per request, so zero requests means zero cost. Only DynamoDB storage remains, about 0.25 USD per GB-month after the free 25 GB, so near 0 USD for our 1 GB.

For Lab 2 EC2 setup, the full cost remains, about 12.51 USD. The instance, its 8 GB gp3 volume, and detailed monitoring bill by the hour or by provisioned size, whether or not anyone uses the server.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The serverless setup fits the Lab 4 message API better. At 1 million requests a month it costs 2.14 USD, against 12.51 USD for the EC2 setup. In a month with no requests, serverless costs almost nothing, while EC2 still costs the full amount. With serverless, AWS handles the servers, patching, and scaling, so our group only writes the Lambda code and the API routes. With EC2, our group must set up, patch, secure, and monitor the server ourselves, and the one `t3.micro` may not keep up if traffic grows.

## Contribution

| GitHub username | What this groupmate did                                            |
| --------------- | ------------------------------------------------------------------ |
| gihyunx         | Repository management and wrote the answers.                       |
| samthology      | Validated if the configurations are correct on the AWS calculator. |
| samjoshuadud    | Computed the estimates for each service.                           |
| pruvk           | Validated the written answers and computations.                    |
