# Seatwork 5 Submission

## About us

- Group number: 07
- Section: IV-BCSAD
- Group IAM user: bcsad-g07
- Table name: umak-elec3-bcsad-g07-messages
- Bucket name: umak-elec3-bcsad-g07-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

- The deployment fails and the stack rolls back. Our table and our bucket already exist, because we made them in the console. CloudFormation treats a new stack as a request to create new resources, and it does not take over resources that were made outside of it. A DynamoDB table name must be unique in the account and Region, and an S3 bucket name must be unique across all of AWS, so creating `umak-elec3-bcsad-g07-messages` and `umak-elec3-bcsad-g07-linktree` again returns an "already exists" error. Because one resource fails, CloudFormation undoes the whole stack, and our existing table and bucket stay as they were.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

- A change in a template goes through a Pull Request, so a groupmate reads it before it takes effect, and a mistake such as a wrong name or an open policy can be caught first. Git also keeps a record of who changed what and why, and a bad change can be reverted to the earlier version. A change made with clicks in the console has no review and no record, so nobody sees it until something breaks. This serves the Operational Excellence pillar, which covers making small, reviewed, reversible changes and managing infrastructure as code.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| Dan-Ike | wrote `template.yaml` |
| abijeyn | Reviewed template.yaml (indentation, names, tags) and answered Q1 |
| StarMirai | Reviewed main.tf (names, tags, depends_on) and answered Q2 |
| o4o29 | wrote `main.tf` |
