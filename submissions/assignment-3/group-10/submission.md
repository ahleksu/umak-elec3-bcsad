# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 10
- Section: IV_BCSAD
- Lab 3 client: A print shop order portal

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | 	db.t4g.micro | Single-AZ | 1 | 20 GB gp3 | USD 21.01/month |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB gp3 | USD 42.75/month |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB gp3 | USD 42.02/month |

Share link of our estimate: https://calculator.aws/#/estimate?id=e27d1c9b2a30b151f31ee925bff1576f7cec6abd

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

For our print shop order portal, I recommend Option A, assuming the business has a relatively small number of users and can tolerate occasional short periods of database downtime. It provides the lowest monthly cost while supporting the portal's core functions, such as receiving customer orders and allowing staff to view order information. Although downtime could temporarily prevent customers from submitting orders and staff from processing them, the additional cost of Multi-AZ may not be necessary if the business can manage brief interruptions. Option C is more useful when the portal has a high read workload because it provides a separate read replica for read queries. Therefore, Option A offers the most practical balance of cost and database capacity for a small print shop.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is designed for high availability and automatic failover when the primary database has a problem. It is not intended to handle read queries from applications. A read replica is a separate DB instance that can serve read-only queries, helping reduce the workload on the primary database. Therefore, Multi-AZ improves availability, while read replicas help with read scaling.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ambv13 | Documentation |
| CANLASpogi | Estimator in A |
| Kopibean101223 | Estimator in B |
| DrMacky | Estimator in C |