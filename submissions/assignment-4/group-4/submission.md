# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 4
- Section: IV-BCSAD

## Estimate 1: the Lab 4 endpoint

Asia Pacific (Singapore), 1 million requests a month: 800,000 GET and 200,000 POST.

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon API Gateway | HTTP API, 1 million requests, 1 KB each | 1.00 |
| AWS Lambda | Without Free Tier, x86, 1,000,000 requests, 100 ms, 128 MB | 0.41 |
| Amazon DynamoDB | On-demand, Standard, 1 GB, 1 KB items, 0.2 million writes, 0.8 million eventually consistent reads | 0.60 |
| **Total** | | 2.01 |

## Estimate 2: the Lab 2 setup

| Service | Settings | Monthly cost (USD) |
| --- | --- | --- |
| Amazon EC2 | 1 `t3.micro`, Linux, On-Demand, 100% utilization, 8 GB gp3, detailed monitoring on | 12.51 |

Share link of our estimate: https://calculator.aws/#/estimate?id=22684ebbac06199aaa349fe33983b5b37c1f0fb2

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the serverless setup (Lab 4), only the DynamoDB data storage cost remains ($0.25/month for 1 GB) because API Gateway and Lambda charge strictly per request invocation and execution time. In contrast, in the EC2 setup (Lab 2), the full monthly compute cost ($9.64/month for the t3.micro instance), EBS volume storage cost ($0.77/month), and detailed monitoring fees remain charged in full (~$12.51/month total) regardless of zero traffic, because the virtual server and disk run continuously 24/7.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We strongly recommend the serverless setup (Lab 4) for the message API at 1 million requests per month. At a total of $2.01 per month, the serverless architecture is roughly 84% cheaper than running a dedicated EC2 setup at $12.51 per month. Additionally, if request volume drops to zero during off-peak periods, serverless costs automatically decrease to just $0.25 per month for database storage, whereas the EC2 server incurs full charges continuously. Serverless also eliminates manual operational overhead, removing the need for our team to manage OS security patching, software updates, or Auto Scaling configurations. Consequently, the serverless endpoint provides superior cost efficiency, automatic elasticity, and zero server management overhead for this workload.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ctrl-amed | Initialized Git branch, created submission files, committed changes, and created PR |
| angeluuhh | Configured AWS Pricing Calculator estimates for API Gateway, Lambda, DynamoDB, and EC2 |
| leksxee | Formulated zero-traffic cost analysis and drafted five-sentence recommendation |
| Jajaalbaladejo27-sys | Verified AWS Calculator share link, checked markdown layout, and submitted Google Form |