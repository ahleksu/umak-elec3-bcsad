# Seatwork 5 Submission

## About us

- Group number: `group-02`
- Section: `IV-BCSAD`
- Group IAM user: `bcsad-g02`
- Table name: `umak-elec3-bcsad-g02-messages`
- Bucket name: `umak-elec3-bcsad-g02-linktree`

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

- `The deployment would fail and roll back because umak-elec3-bcsad-g02-messages and umak-elec3-bcsad-g02-linktree already exist in our AWS account. CloudFormation tries to create brand-new resources from scratch and does not automatically adopt existing ones, so it throws an "already exists" error when it encounters resources with the exact same physical names.`

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

- `Writing changes in a template and reviewing them in a Pull Request creates a clear audit trail and lets teammates catch misconfigurations (like overly permissive policies or typos) before anything touches the live environment, avoiding accidental clicks in the console. This serves the Operational Excellence pillar of the AWS Well-Architected Framework (specifically its best practice of performing operations as code and making frequent, small, reversible changes).`

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| justinecasiano | Wrote the CloudFormation template (`template.yaml`) for the DynamoDB table and S3 site bucket |
| ExalaJohn | Wrote the Terraform configuration (`main.tf`) and resource tags |
| ShiftRedux | Reviewed YAML indentation, HCL syntax, and resource naming conventions |
| KennethTejam | Answered the review questions in `submission.md` and verified no secrets or account numbers were included |
