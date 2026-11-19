# Seatwork 5 Submission

<!--
How to use this template:

1. Copy this file to submissions/seatwork-5/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Save template.yaml and main.tf in the same folder.
4. Do not put an access key, a password, an invoke URL, or the AWS account number in any file.
5. Write GitHub usernames, not full names or student numbers.
-->

## About us

- Group number: 10
- Section: IV-BCSAD
- Group IAM user: bcsad-g10
- Table name: umak-elec3-bcsad-g10-messages
- Bucket name: umak-elec3-bcsad-g10-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment fails, and CloudFormation automatically initiates a rollback (`ROLLBACK_IN_PROGRESS` leading to `ROLLBACK_COMPLETE`).

**Why:**
The DynamoDB table (`umak-elec3-bcsad-g10-messages`) and S3 bucket (`umak-elec3-bcsad-g10-linktree`) already exist in AWS from Lab 4 and Seatwork 3. CloudFormation treats resources declared in a new stack template as new resources to be provisioned. When it attempts to create them, AWS rejects the operation because physical resource names must be unique within their respective namespaces (DynamoDB table names within an account/region, and S3 bucket names globally across all AWS accounts). This triggers a conflict error (such as `ResourceInUseException` for DynamoDB or `BucketAlreadyOwnedByYou` for S3), causing CloudFormation to halt stack creation and roll back.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Defining infrastructure in code and reviewing changes through a Pull Request is safer because:
- **Peer Review & Verification:** Proposed changes are reviewed by teammates before applying them, catching syntax errors, security misconfigurations (such as unintended public permissions), or accidental deletions before reaching production.
- **Repeatability & Eliminating Human Error:** It prevents manual configuration drift and mistakes caused by clicking the wrong buttons or forgetting checkboxes in the console.
- **Auditable Version History & Rapid Rollback:** Git maintains a full commit history of what changed, who changed it, and why, allowing any problematic change to be reverted cleanly.

This serves the **Operational Excellence** pillar of the AWS Well-Architected Framework (specifically the design principle: *Perform operations as code*).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| kopibean101223 | Configured the S3 bucket resources and bucket policy in both CloudFormation and Terraform, including website hosting and public access block settings. |
| CANLASpogi | Authored the DynamoDB table resources in template.yaml and main.tf, and defined the required resource tags (course and group) across both configurations. |
| DrMacky | Answered Question 1 regarding stack deployment conflicts and automatic rollbacks, and verified CloudFormation syntax against AWS specifications. |
| ambv13 | Answered Question 2 linking IaC and Pull Request review to the Operational Excellence pillar, audited files to prevent secret leakage, and formatted submission.md. |
