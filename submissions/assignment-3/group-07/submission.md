# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 07
- Section: IV-BCSAD
- Lab 3 client: A bakery delivery app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 (primary and one read replica) | 20 GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=fb52de47fbe1170184a4ace47e798ccb15e85808

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

- We recommend Option B: High availability (Multi-AZ) for our bakery delivery app because it provides better reliability for customers and bakery staff.
- Since customers rely on the application to browse products and place orders, database downtime could prevent transactions and result in lost sales.
- Although Multi-AZ costs more than the Single-AZ option, the additional cost is worthwhile because it provides a standby database in another Availability Zone that can take over if the primary database fails.
- Our application is expected to have regular read operations, such as browsing bakery products and checking order details, but these do not necessarily require a separate read replica.
- Overall, Option B provides a good balance between availability, reliability, and cost for our client's business.

## Question

Why is a Multi-AZ standby not the same as a read replica?

- A Multi-AZ standby is primarily designed for high availability and disaster recovery.
- It maintains an updated copy of the primary database in another Availability Zone and automatically takes over when the primary database fails.
- However, it does not handle normal read queries from the application.
- On the other hand, a read replica is a separate database instance that can handle additional read queries, helping distribute the workload when an application has many users accessing data.
- Therefore, Multi-AZ focuses on database availability, while read replicas focus on improving read performance and scaling.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| abijeyn | Helped prepare and review the AWS Pricing Calculator estimates. |
| Dan-Ike | Prepared the assignment submission and wrote the recommendation and technical explanations. |
| StarMirai | Helped compare the three database deployment options and their costs. |
| o4o29 | Helped review the assignment requirements and verify the submission. |
