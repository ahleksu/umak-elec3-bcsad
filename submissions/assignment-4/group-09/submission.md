# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 9
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

Share link of our estimate: https://calculator.aws/#/estimate?id=07fc962f5fd422688f65bdf31c4c95eafa6955c4

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the **Lab 4 serverless setup**, Amazon API Gateway and AWS Lambda cost **0.00 USD** when there are no requests because both charge strictly per request and per millisecond of execution; only **Amazon DynamoDB data storage** (about **0.29 USD/month** for 1 GB of stored messages) remains, since DynamoDB on-demand still charges for data stored on disk even when read and write traffic is zero. In contrast, in the **Lab 2 EC2 setup**, the **entire monthly cost (12.51 USD/month)** remains—covering the `t3.micro` On-Demand instance running 24/7 (9.64 USD), the 8 GB gp3 EBS volume (0.77 USD), and CloudWatch detailed monitoring (2.10 USD)—because EC2 instances, attached EBS disks, and detailed monitoring are billed by the hour/month while provisioned regardless of whether any visitors send requests.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

We recommend **Estimate 1 (the Lab 4 serverless setup with API Gateway, Lambda, and DynamoDB on-demand)** for our message API at 1 million requests per month. At this traffic volume, the serverless endpoint costs only **2.14 USD per month** in Asia Pacific (Singapore) compared to **12.51 USD per month** for the Lab 2 `t3.micro` EC2 setup, saving about 83% on monthly infrastructure costs. Furthermore, as shown in our idle-month analysis, a month with zero requests reduces the serverless bill to just ~0.29 USD for 1 GB of DynamoDB storage (0.00 USD for API Gateway and Lambda), whereas the EC2 setup still bills the full 12.51 USD per month just to keep the idle server, 8 GB EBS disk, and detailed monitoring running. From an operations standpoint, the EC2 setup requires our group to configure Auto Scaling groups, maintain launch templates, and regularly patch the Linux operating system and web server. In contrast, API Gateway, Lambda, and DynamoDB require zero OS patching from our group and automatically absorb sudden spikes in traffic without manual capacity planning or paying for idle capacity.

## Contribution

| GitHub username | What this groupmate did                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------------------- |
| jyjstn          | Configured Estimate 1 (API Gateway, Lambda, DynamoDB) and Estimate 2 (EC2) in the AWS Pricing Calculator |
| Dyeel           | Verified the Singapore monthly cost breakdowns and checked that Free Tier and Provisioned were disabled  |
| Ychannn29       | Wrote the answer analyzing which costs remain in each setup during a month with zero requests            |
| korbin88        | Wrote the five-sentence recommendation comparing totals, idle costs, and operational work, and opened PR |
