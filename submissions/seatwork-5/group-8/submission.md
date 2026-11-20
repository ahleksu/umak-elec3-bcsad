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

- Group number: 08
- Section: IV-BCSAD
- Group IAM user: bcsad-g08
- Table name: umak-elec3-bcsad-g08-messages
- Bucket name: umak-elec3-bcsad-g08-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

CloudFormation would attempt to create a stack and its resources. However, the DynamoDB table and S3 bucket already exist because we created them manually in the AWS Console. CloudFormation cannot automatically adopt these existing resources, so creating resources with the same names would result in conflicts. We would need to import the existing resources into CloudFormation or use different resource names.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Writing changes in a template and reviewing them through a Pull Request is safer because group members can review the changes and catch mistakes before they are applied. It also keeps a record of changes and makes the infrastructure easier to reproduce consistently. This supports the Operational Excellence pillar of the AWS Well-Architected Framework.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| <answer> | <answer> |
| <answer> | <answer> |
| <answer> | <answer> |
