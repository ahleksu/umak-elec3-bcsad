# Assignment 4 Submission

## About us

- Group number: 03
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

Share link of our estimate: https://calculator.aws/#/estimate?id=e5e5ddf4feb07ab1e3e5bfd397348e9a3b30327c

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In a month with no requests, the serverless setup will still have a small cost for DynamoDB storage because the data remains saved even when the API is not being used. However, API Gateway and Lambda will have no additional charges since there are no requests or executions. On the other hand, the EC2 setup will still have its monthly cost because the server continues running even when no one is using it. This means that the serverless setup is more affordable during months with little or no activity.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend the Serverless setup (Lab 4) for our message API because it is more affordable, easier to maintain, and more practical for our project. At 1 million requests per month, its estimated monthly cost is only $2.14, while the EC2 setup costs $12.51, making serverless the cheaper option. Another advantage is that when there are no requests, we do not have to pay for API Gateway requests or Lambda executions, so only the DynamoDB storage cost remains. In comparison, the EC2 setup continues to charge us monthly because the server needs to stay running even when nobody is using the API. Although our group needs to configure API Gateway, Lambda, and DynamoDB, we believe this is more manageable than setting up and maintaining an EC2 server.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| JHnsu | Worked on the serverless setup and calculated its estimated monthly cost |
| kdotvalentino | Worked on the EC2 setup and calculated its estimated monthly cost |
| shmoke4u | Compared both setups, answered the cost questions, and prepared the recommendation |
