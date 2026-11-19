# Seatwork 5 Submission

## About us

- Group number: 5
- Section: IV-BCSAD
- Group IAM user: bcsad-g05
- Table name: umak-elec3-bcsad-g05-messages
- Bucket name: umak-elec3-bcsad-g05-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails, and it changes nothing that we already have. CloudFormation makes a new stack, and the stack tries to create every resource in the template with the names that we wrote. Our table `umak-elec3-bcsad-g05-messages` and our bucket `umak-elec3-bcsad-g05-linktree` already exist, because we made them in the console, and no stack manages them. A table name must be unique in the account and Region, and a bucket name must be unique across all of S3, so CloudFormation cannot create them again and answers that they already exist. The stack then rolls back and deletes anything that it did create, so it ends in `ROLLBACK_COMPLETE`. CloudFormation does not take over a resource just because the name matches. To manage our existing table and bucket with the template, we would have to import them into a stack instead.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A groupmate reads the exact change in the Pull Request before anything is deployed, so a mistake such as a wrong bucket name or a policy that allows more than `s3:GetObject` is caught before it reaches AWS. Git also keeps every change with its author and its reason, so we can see what changed and revert to the last version that worked. A click in the console leaves no such review and no such history. This serves the Operational Excellence pillar, which asks us to perform operations as code and to make small, reviewed changes that we can reverse.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| ehrickkk | Made the branch and folder, wrote template.yaml (the table, the site bucket, and the bucket policy) and main.tf (all five resources), added the tags in both files, and answered Question 1 |
| LouieCads | Checked the table and bucket names and the bucket policy in both files against our Lab 4 table and our Seatwork 3 bucket |
| sonisunn | Checked the YAML indentation and the Block Public Access settings in template.yaml, and drafted Question 2 |
| MeinardEdrei | Reviewed submission.md, checked that no file shows a secret or the account number |
