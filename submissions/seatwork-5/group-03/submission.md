# Seatwork 5 Submission

## About us

- Group number: group-03
- Section: IV-BCSAD
- Group IAM user: bcsad-g03
- Table name: umak-elec3-bcsad-g03-messages 
- Bucket name: umak-elec3-bcsad-g03-linktree  

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

- The deployment would fail and roll back because the DynamoDB table `umak-elec3-bcsad-g03-messages` and the S3 bucket `umak-elec3-bcsad-g03-linktree` already exist in our AWS account. CloudFormation creates brand-new resources from scratch rather than automatically adopting existing ones, so it throws a resource-already-exists error when encountering resources with the exact same physical names.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

- Writing changes in a template and reviewing them in a Pull Request creates a version-controlled audit trail and lets teammates catch misconfigurations (such as overly permissive bucket policies or syntax errors) before anything reaches the live environment, preventing accidental clicks in the console. This serves the **Operational Excellence** pillar of the AWS Well-Architected Framework (specifically performing operations as code and making frequent, small, reversible changes).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| shmoke4u | Wrote the CloudFormation template (`template.yaml`) for the DynamoDB table and S3 site bucket |
| kdotvalentino | Wrote the Terraform configuration (`main.tf`) and verified resource tags |
| JHnsu | Answered the review questions in `submission.md` and audited all files for syntax and formatting |