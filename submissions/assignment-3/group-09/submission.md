# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 9
- Section: IV-BCSAD
- Lab 3 client: A laundry shop pickup app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option               | Instance       | Deployment | Nodes                              | Storage                             | Total monthly cost (USD) |
| -------------------- | -------------- | ---------- | ---------------------------------- | ----------------------------------- | ------------------------ |
| A. Small and cheap   | `db.t4g.micro` | Single-AZ  | 1                                  | 20 GB, General Purpose SSD (gp3)    | 21.01                    |
| B. High availability | `db.t4g.micro` | Multi-AZ   | 1                                  | 20 GB, General Purpose SSD (gp3)    | 42.75                    |
| C. Read scaling      | `db.t4g.micro` | Single-AZ  | 2, the primary and one read replica | 20 GB, General Purpose SSD (gp3)    | 42.02                    |

Share link of our estimate: https://calculator.aws/#/estimate?id=bd5b3ff707fab3cb3d1a58e58d04cdd3f598cfdb

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

We recommend **Option B (High availability — `db.t4g.micro`, Multi-AZ, 1 node, 20 GB gp3 at USD 42.75/month)** for our Lab 3 client, the laundry shop pickup app. Our client's users include neighborhood customers scheduling laundry pickup and delivery windows, delivery riders checking live route assignments, and shop staff updating wash and payment statuses throughout operating hours. Because the cost of downtime during busy morning or evening pickup windows means missed collections, stalled rider dispatches, lost orders, and customers switching to competing laundry shops, paying an additional USD 21.74 per month over Option A for automatic Multi-AZ failover is well worth the investment. Meanwhile, the application's read load consists of moderate, localized order-status lookups and schedule checks that a single `db.t4g.micro` primary instance can easily handle without needing the extra read replica in Option C. Choosing Option B also matches our Lab 3 VPC subnet plan (`db-a` in `ap-southeast-1a` and `db-b` in `ap-southeast-1b`), protecting the business against an Availability Zone outage whereas both Options A and C leave the primary database in a Single-AZ deployment without automatic failover.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a **synchronously replicated, passive** copy of the primary database placed in a second Availability Zone solely for high availability and automatic failover—it **cannot accept read queries** during normal operation. In contrast, a read replica is an **asynchronously replicated, active** database instance that **can serve read-only traffic** to offload read-heavy workloads from the primary database, but it does not provide automatic zero-data-loss failover like a Multi-AZ standby.

## Contribution

| GitHub username | What this groupmate did                                                                                   |
| --------------- | --------------------------------------------------------------------------------------------------------- |
| jyjstn          | Configured Option A, Option B, and Option C in AWS Pricing Calculator and generated the public share link |
| Dyeel           | Verified the Singapore RDS for MySQL pricing breakdown (compute vs. gp3 storage) across all three options |
| Ychannn29       | Wrote the five-sentence client recommendation connecting Option B to the laundry shop pickup app workload |
| korbin88        | Answered the Multi-AZ standby vs. read replica question and reviewed `submission.md` for the PR           |

