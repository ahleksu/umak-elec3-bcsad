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

- Group number: 9
- Section: IV-BCSAD
- Group IAM user: bcsad-g09
- Table name: umak-elec3-bcsad-g09-messages
- Bucket name: umak-elec3-bcsad-g09-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment **fails and rolls back** (`ROLLBACK_COMPLETE` with an `AlreadyExists` error). Because our DynamoDB table (`umak-elec3-bcsad-g09-messages`) and S3 bucket (`umak-elec3-bcsad-g09-linktree`) already exist from creating them manually in the console, and DynamoDB table names (within a Region/account) and S3 bucket names (globally) must be unique, CloudFormation refuses to overwrite or adopt existing unmanaged resources during stack creation unless they are explicitly imported into the stack first.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Writing a change in a template and reviewing it in a Pull Request lets teammates inspect the exact diff, catch misconfigurations (such as an overly broad bucket policy or missing tags) before deployment, and easily roll back to the previous Git commit if something breaks, eliminating unrecorded manual console mistakes. This practice directly serves the **Operational Excellence** pillar of the AWS Well-Architected Framework (specifically performing operations as code and making small, reversible, peer-reviewed changes).

## Contribution

| GitHub username | What this groupmate did                                                                                   |
| --------------- | --------------------------------------------------------------------------------------------------------- |
| jyjstn          | Wrote `template.yaml` defining `MessagesTable`, `SiteBucket`, and `SiteBucketPolicy` in CloudFormation    |
| Dyeel           | Wrote `main.tf` defining the DynamoDB table and S3 static website bucket resources in Terraform           |
| Ychannn29       | Verified the YAML indentation, HCL references, `depends_on` block, and `course`/`group` cost tags         |
| korbin88        | Answered the two Infrastructure as Code questions in `submission.md` and opened the group Pull Request    |
