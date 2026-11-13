# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 1
- Section: IV-BCSAD
- Lab 3 client: A school canteen ordering app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB gp3 | 21.01  |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=59e0574e415e2e3cccd0e1035ae0ba3d5a3bd77e

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option A, a db.t4g.micro in Single-AZ at 21.01 USD a month. Our client is a school canteen ordering app used by a limited number of students and staff, mostly during break and lunch hours, so it never needs a large or always-busy database. If the database goes down, students can still order at the counter and the canteen loses very little money, so Option B at 42.75 USD a month is not worth paying for Multi-AZ. The read load is also light because people mostly browse a small menu and place short orders, so Option C at 42.02 USD a month would pay for a second server that has almost nothing to do. If the canteen grows or ordering becomes critical later, we can move to Multi-AZ without redesigning anything.



## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a copy of the database in another Availability Zone that exists only for failover. It cannot answer queries, and AWS switches to it automatically if the primary fails, so it improves availability. A read replica is a separate DB instance that applications can send read queries to, so it improves read performance. It is not an automatic failover target, and its data can lag slightly behind the primary.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| mrkjeniel | Built the three estimates in the AWS Pricing Calculator |
| MalulanM | Wrote the recommendation |
| JohnJhayAdriano | Checked the settings and totals, and tested the share link |
| qinglow | Wrote the Multi-AZ answer and opened the Pull Request |