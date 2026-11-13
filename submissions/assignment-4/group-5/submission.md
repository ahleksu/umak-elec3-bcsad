# Assignment 4 Submission

## About us

- Group number: 5
- Section: IV-BCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.25 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.48 |
| **Total** | | **2.14** |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=06bebfccc252815da7279369b921034d11424dc4

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup, almost nothing remains. API Gateway, Lambda, and DynamoDB on-demand charge per request, so with zero requests they cost nothing. Only the DynamoDB data storage stays, because the stored messages still take space. In the Lab 2 setup, the full cost remains: the EC2 instance runs and is charged every hour, the 8 GB EBS disk is charged every month, and detailed monitoring is charged too. The instance's public IPv4 address, which this estimate leaves out, is also charged by the hour. A server is paid per hour that it runs, whether or not anyone visits.

## Recommendation

The serverless Lab 4 setup fits the message API at 1 million requests a month. It costs about 2.14 USD a month, compared with 12.51 USD for the always-on EC2 setup, so it is roughly six times cheaper. With no requests, Lab 4 costs almost nothing while EC2 keeps charging for its hours, disk, and monitoring. Lab 4 also needs less work from our group, because AWS patches and scales API Gateway, Lambda, and DynamoDB for us, while on EC2 we must patch the server and set up scaling for sudden spikes in traffic. We would only reconsider EC2 if traffic grew so large and steady that paying per request became more expensive than paying per hour.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ehrickkk | Priced Amazon API Gateway and AWS Lambda in the calculator |
| LouieCads | Priced Amazon DynamoDB and Amazon EC2, created the share link, and opened the Pull Request |
| MeinardEdrei | Wrote the answer about costs that remain with no requests |
| sonisunn | Wrote the five-sentence recommendation and checked the numbers |
