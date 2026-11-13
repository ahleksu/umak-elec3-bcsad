# Assignment 3 Submission

## About us

- Group number: 5
- Section: IV-BCSAD
- Lab 3 client: A campus library reservation system

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | `db.t4g.micro` | Single-AZ | 1 | 20 GB, General Purpose SSD (gp3) | 21.01 |
| B. High availability | `db.t4g.micro` | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | `db.t4g.micro` | Single-AZ | 2, the primary and one read replica | 20 GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=01e9e31acf1715170f4cdbe9dca8f8ad72312ae8

## Recommendation

We recommend Option B, the Multi-AZ database, for our campus library reservation system. Its users are students and staff who reserve books and study rooms, and they depend on it most during exam weeks. If the database went down in one Availability Zone, nobody could reserve anything until AWS recovered it, and Multi-AZ avoids that by switching to a standby copy in another zone automatically. The read load is modest, because most requests are students checking availability and only a few make a booking, so the read replica in Option C adds cost without protecting against downtime. Option B costs about twice as much as Option A, but that small extra monthly cost is worth it to keep reservations working for the whole campus.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a hidden copy in a second Availability Zone that exists only for failover. AWS keeps it in sync and switches to it if the primary fails, but you cannot send queries to it, so it adds no read capacity. A read replica is a separate DB instance that you can query, so it takes some of the read traffic off the primary. It is not an automatic failover target, so it does not protect the database from an outage the way a standby does.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| sonisunn | Built the Option A estimate in the AWS Pricing Calculator. |
| ehrickkk | Built the Option B estimate and checked every calculator field. |
| LouieCads | Built the Option C estimate and saved the share link. |
| MeinardEdrei | Wrote the recommendation and the Multi-AZ answer. |
