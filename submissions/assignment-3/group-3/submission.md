# Assignment 3 Submission

## About us

- Group number: 03
- Section: IV-BCSAD
- Lab 3 client: Jeepney Fleet Tracking Service

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB gp3 | 47.29 USD |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB gp3 | 42.75 USD |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB gp3 | 42.02 USD |

Share link of our estimate: https://calculator.aws/#/estimate?id=f7f2ce62081dfd0d913011cf5e370bd801a2f1d5

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

I would recommend option B for jeepney fleet tracking. It makes use of Multi-AZ deployment. This will ensure that there is a backup database available so that we don’t have any issues with downtime. This could have an impact on our ability to track vehicles and provide valuable info to the operators. Since the case does not specify an unusually high read workload, a single primary database with a standby is a more practical choice than adding a read replica.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is designed for high availability and automatic failover when the primary database fails, while a read replica is designed to handle read-only queries and reduce the workload on the primary database. A Multi-AZ standby does not normally serve read traffic, whereas a read replica can serve read requests to improve database performance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| JHnsu | Configured the RDS MySQL pricing estimates and prepared the submission |
| kdotvalentino | Reviewed the database configurations and pricing estimates |
| shmoke4u | Helped evaluate the database options and review the recommendation |
