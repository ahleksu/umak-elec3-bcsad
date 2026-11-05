# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 6
- Section: IV-BCSAD
- Lab 3 client: A dental clinic booking app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option               | Instance     | Deployment | Nodes                               | Storage                          | Total monthly cost (USD) |
| -------------------- | ------------ | ---------- | ----------------------------------- | -------------------------------- | ------------------------ |
| A. Small and cheap   | db.t4g.micro | Single-AZ  | 1                                   | 20 GB, General Purpose SSD (gp3) | 21.01 USD                |
| B. High availability | db.t4g.micro | Multi-AZ   | 1                                   | 20 GB, gp3                       | 42.75 USD                |
| C. Read scaling      | db.t4g.micro | Single-AZ  | 2, the primary and one read replica | 20 GB, gp3                       | 42.02 USD                |

Share link of our estimate: https://calculator.aws/#/estimate?id=73a3b2c87bd49c4bc4e00924d4434049cb9b8dfe

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend Option B, db.t4g.micro in Multi-AZ, at 42.75 USD a month. Our client's users are patients and clinic staff who book and check appointments during clinic hours, so the app must be reachable whenever someone tries to book. Downtime means lost bookings, idle dentist time, and front desk staff falling back to paper, which costs far more than the extra 21.74 USD a month over Option A. The read load is small because a single clinic only has a few hundred appointment lookups a day, so Option C's read replica would add cost without solving a real problem. Multi-AZ gives automatic failover to a standby in another Availability Zone for about the price of Option C, which is the better use of the budget.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is for availability. It copies the primary synchronously in another Availability Zone, takes no traffic, and RDS promotes it automatically if the primary fails. A read replica is for scaling reads, so it copies the primary asynchronously, serves read queries, and has its own endpoint, but it does not fail over automatically and can lag behind the primary.

## Contribution

| GitHub username | What this groupmate did                                                      |
| --------------- | ---------------------------------------------------------------------------- |
| gihyunx         | Repository management and wrote the answers.                                 |
| samthology      | Helped in comparing the database cost and writing the client recommendation. |
| samjoshuadud    | Computed the estimates for each option.                                      |
| pruvk           | Validated the written answers and computations.                              |
