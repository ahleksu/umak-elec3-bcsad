# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 08
- Section: IV-BCSAD
- Lab 3 client: An esports tournament platform

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, gp3 | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB, gp3 | 42.02 |

Share link of our estimate: [https://calculator.aws/#/estimate?id=6a22dfc3f76162ef4ee0f93f42f887a150f6c847]

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option B (High Availability) for the esports tournament platform because it helps keep the database running even if the primary database fails. The platform may have many users, including players and viewers, accessing information during tournaments. Database downtime could affect tournament schedules, player information, and match results. Multi-AZ provides a standby database that can take over if the primary database becomes unavailable. This option is more suitable because keeping the platform available is important during live tournaments.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a backup database that helps keep the system running if the main database stops working. It is used for automatic failover and does not handle regular read requests. On the other hand, a read replica is another database that copies data from the main database and can handle read requests. It helps reduce the workload of the main database when many users are accessing information. In short, Multi-AZ is for keeping the database available, while read replicas are for handling more read requests.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| julienaulolsayu | Set up the AWS pricing estimates and prepared the submission. |
| PorkAdubuu | Checked the RDS settings and prices for each option. |
| chuulinnn | Helped recall the previous lab activity (for client). |
| marionnn10 | Helped write the recommendation and check the submission. |
