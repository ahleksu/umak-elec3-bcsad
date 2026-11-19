# Seatwork 5 Submission

## About us

- Group number: 4
- Section: IV-BCSAD
- Group IAM user: bcsad-g04
- Table name: umak-elec3-bcsad-g04-messages
- Bucket name: umak-elec3-bcsad-g04-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deployment would fail because a DynamoDB table named `umak-elec3-bcsad-g04-messages` and an S3 bucket named `umak-elec3-bcsad-g04-linktree` already exist in AWS from our earlier activities, and both DynamoDB table names and S3 bucket names must be unique across the account/region or globally. CloudFormation tries to create new resources with those same names and stops with an already-exists error rather than adopting the manually created resources.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

Writing changes in a template and reviewing them in a Pull Request lets teammates catch mistakes, missing tags, or overly broad permissions before anything is applied, while keeping a clear version history in Git instead of untracked manual clicks. This serves the **Operational Excellence** pillar (and also supports **Security** when reviewing access policies and configurations before deployment).

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| <leksxee> | Wrote `template.yaml` with the DynamoDB table, S3 bucket, policy, and tags |
| <angeluuhh> | Wrote `main.tf` with the matching Terraform resources, tags, and dependency |
| <ctrl-amed/jajaalbaladejo27-sys> | Completed `submission.md`, reviewed the files, and opened/submitted the PR |
