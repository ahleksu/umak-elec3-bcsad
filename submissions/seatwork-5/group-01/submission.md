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

- Group number: 1
- Section: IV-BCSAD
- Group IAM user: bcsad-g01
- Table name: umak-elec3-bcsad-g01-messages
- Bucket name: umak-elec3-bcsad-g01-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

The deploy fails, and the stack rolls back. CloudFormation makes a new stack and tries to create every resource in the template. But a table named `umak-elec3-bcsad-g01-messages` and a bucket named `umak-elec3-bcsad-g01-linktree` already exist, because our group made them in the console, and these names must be unique. CloudFormation does not take over resources that it did not create, so our existing table and bucket stay unchanged.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A change in a template is reviewed by groupmates in a Pull Request before anything is created, so a mistake, such as a wrong bucket policy, is caught before it affects the real setup. A click in the console takes effect right away and leaves no record of who changed what. This serves the Operational Excellence pillar, because the change is written down, versioned in Git, reviewed, and can be repeated or undone.

## Contribution

| GitHub username | What this groupmate did |
| --- | --- |
| mrkjeniel | Wrote template.yaml, the CloudFormation table, bucket, and bucket policy. |
| MalulanM | Wrote main.tf, the Terraform table, bucket, website configuration, public access block, and policy. |
| JohnJhayAdriano | Checked the names and tags in both files. |
| qinglow | Wrote submission.md and opened the Pull Request. |
