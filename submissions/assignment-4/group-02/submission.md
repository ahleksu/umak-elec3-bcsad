# Assignment 4 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-4/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 2
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

Share link of our estimate: https://calculator.aws/#/estimate?id=9d34a57976ede642da9fbe041a25aa3416ba4597

## Question

In a month with no requests at all, which costs remain in each setup, and why?

In the Lab 4 endpoint, only the Amazon DynamoDB table storage fee remains because the 1 GB of data continues to occupy disk space. API Gateway HTTP requests, AWS Lambda invocations, and DynamoDB read and write capacity units are billed entirely per request on demand, so they drop to zero when traffic stops. In contrast, the Lab 2 EC2 setup retains its full monthly cost of 12.51 USD. The t3.micro instance is billed continuously for every hour it runs, the 8 GB gp3 EBS volume bills a recurring fee to retain provisioned block storage, and detailed monitoring applies a fixed monthly metric fee regardless of whether any visitors use the server.

## Recommendation

Five sentences. Which setup fits the Lab 4 message API at 1 million requests a month, and why? Use our two totals, our answer to the question, and the work that each setup needs from our group.

The Lab 4 serverless setup fits the message API much better because its 2.14 USD monthly total is significantly cheaper than the 12.51 USD cost of the Lab 2 EC2 setup. When traffic drops to zero, the serverless architecture incurs only data storage fees, whereas the EC2 instance continues to generate its entire 12.51 USD bill. Serverless also removes operational overhead, as AWS handles server provisioning, operating system patching, and runtime security without requiring server maintenance from our group. Additionally, the serverless components scale automatically to absorb unexpected traffic surges without manual capacity planning or load balancer configuration. Given the substantial cost difference and the lack of server management, Lab 4 is the clear choice for our group.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ExalaJohn | Repository and Git management (branching, directory setup, pull request creation) and final submission checks. |
| justinecasiano | Configured the Lab 4 endpoint services (API Gateway, Lambda, DynamoDB) in the AWS Pricing Calculator. |
| ShiftRedux | Configured the Lab 2 EC2 instance setup with EBS and detailed monitoring, and generated the share link. |
| KennethTejam | Drafted the answers to the questions and verified the final comparison values. |
