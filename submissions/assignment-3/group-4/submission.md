# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 4
- Section: IV-BCSAD
- Lab 3 client: A local pet grooming appointment app

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, gp3 | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=e33f7dcac5d8ab26787c47ee256c7803b0c0533a

## Recommendation

We recommend Option A (Small and cheap) for our client, a local pet grooming appointment scheduling app. The application serves a modest user base of around 500 active local pet owners making occasional bookings throughout the week. Brief database downtime during off-peak hours has minimal financial impact, as customers can easily retry booking their appointments a few minutes later without causing major loss of business revenue. The read load is minimal because users primarily check available time slots rather than running heavy or constant database queries. Therefore, starting with a Single-AZ `db.t4g.micro` setup at $21.01 per month meets all performance needs while keeping infrastructure costs minimal for a small enterprise.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a passive failover target in a secondary Availability Zone used strictly for automatic disaster recovery, meaning it cannot accept read or write traffic from applications. In contrast, a read replica is an active, readable database copy designed to handle read queries and offload traffic from the primary instance.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ctrl-amed | Set up Git branch and folder structure, committed code, and submitted PR |
| angeluuhh | Configured AWS Pricing Calculator estimates and generated share link |
| leksxee | Drafted client recommendation and verified conceptual questions |
| Jajaalbaladejo27-sys | Reviewed markdown formatting, tested calculator link, and filled out Google Form |