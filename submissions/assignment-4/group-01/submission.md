# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 1
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

Share link of our estimate: https://calculator.aws/#/estimate?id=6644f28f428ee05fb572c97b47466a4d28d0f7a0

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 setup almost nothing remains. Amazon API Gateway and AWS Lambda only charge when requests come in, so they cost USD 0 with no traffic. Amazon DynamoDB still charges a small fee every month for the data it stores. In the Lab 2 setup most of the cost remains. The EC2 instance is billed for every hour it runs, even when nobody uses it. The 8 GB disk and the detailed monitoring are also billed every month.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend the Lab 4 setup, the serverless one, for the message API at 1 million requests a month. It costs USD 2.14 a month, while the Lab 2 t3.micro costs USD 12.51, so Lab 4 saves about USD 10.37 a month compared to Lab 2. This is because Lab 4 only charges when requests come in, so with no requests only a small DynamoDB storage fee is left, but the EC2 instance still costs almost its full price every hour. Lab 4 also needs less work from us because AWS runs the servers, while with EC2 we have to update the operating system, keep the app running and restart it when it fails. Because of the lower cost and the smaller workload, Lab 4 is the better choice for our message API at this traffic.


## Contribution

| GitHub username | What this groupmate did                                 |
| --------------- | ------------------------------------------------------- |
| mrkjeniel       | Did the AWS Pricing Calculator work and the share link. |
| MalulanM        | Provide the answers for the Recommendation section.     |
| JohnJhayAdriano | Checked and calculates the estimates and totals.        |
| qinglow         | Wrote submission.md and submitted the Pull Request.     |

