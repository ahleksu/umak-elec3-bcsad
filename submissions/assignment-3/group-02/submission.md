# Assignment 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/assignment-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 2
- Section: IV-BCSAD
- Lab 3 client: A barangay health center records system

## Three estimates

Asia Pacific (Singapore), MySQL, OnDemand, 100% utilization, RDS Proxy No, Database Insights No.

| Option | Instance | Deployment | Nodes | Storage | Total monthly cost (USD) |
| --- | --- | --- | --- | --- | --- |
| A. Small and cheap | db.t4g.micro | Single-AZ | 1 | 20 GB, gp3 | 21.01 |
| B. High availability | db.t4g.micro | Multi-AZ | 1 | 20 GB, gp3 | 42.75 |
| C. Read scaling | db.t4g.micro | Single-AZ | 2 | 20 GB, gp3 | 42.02 |

Share link of our estimate: https://calculator.aws/#/estimate?id=2d3fb774089decdcae4124f39ca0d1c037b2f0e5

## Recommendation

Five sentences. Which option fits our client, and why? Use the client's users, the cost of downtime for that client, and the read load.

For our client, the barangay health center records system, Option B (High availability) is the best architecture. The main users are healthcare professionals and clinic employees who need continuous access to patient medical histories during clinic hours and during local medical emergencies. Patient triage, consultations, and urgent medical record lookups are all directly impacted by downtime, which poses a risk to public health and operations rather than just a minor inconvenience. System reliability is crucial even though the read load is relatively small and internal to a single health center, negating the need for dedicated read scaling via Option C. Without the need for human intervention, multi-AZ deployment ensures continuous service and zero data loss by automatically failing over to a synchronous standby node in a different Availability Zone.

## Question

Why is a Multi-AZ standby not the same as a read replica?

A Multi-AZ standby is a synchronous secondary instance that is solely focused on disaster recovery and high availability; it can only act as an automatic failover target in the event that the primary node fails and cannot accept active read or write traffic. A read replica, on the other hand, does not function as an automatic synchronous failover standby by default. Instead, it uses asynchronous replication and is actively available to process read queries to scale application read throughput.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ExalaJohn | Answered the Multi-AZ vs. read replica question and handled the submission. |
| KennethTejam | Configured Options A, B, and C in the AWS Pricing Calculator and generated the estimate link. |
| ShiftRedux | Audited and verified all monthly totals and configuration parameters against requirements. |
| justinecasiano | Wrote the five-sentence client recommendation. |
