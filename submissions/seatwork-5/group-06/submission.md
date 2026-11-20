# Seatwork 5 Submission

## About us

- Group number: 6
- Section: IV-BCSAD
- Group IAM user: bcsad-g06
- Table name: umak-elec3-bcsad-g06-messages
- Bucket name: umak-elec3-bcsad-g06-linktree

## Files

- [`template.yaml`](template.yaml): our CloudFormation template
- [`main.tf`](main.tf): our Terraform file

## Questions

1. Suppose that our group user could create stacks, and we ran `aws cloudformation deploy` with our template today. What happens, and why?

Nothing is created, and the deploy fails. CloudFormation tries to create a table and a bucket with names that already exist in our account. DynamoDB and S3 refuse a duplicate name, so the stack rolls back with an "already exists" error. CloudFormation only manages resources that its own stack made. It does not adopt resources that we made by hand in the console, unless we import them into the stack.

2. Why is a change written in a template and reviewed in a Pull Request safer than the same change made in the console? Which Well-Architected pillar does it serve?

A teammate reads the change in the Pull Request before it is applied, so a mistake such as a wrong bucket policy or a missing tag is caught first. A console click has no review and leaves no record. This serves the Operational Excellence pillar (changes are reviewed, repeatable, and recorded in Git). It also helps the Security pillar, because a reviewer can catch a policy that is too open.

## Contribution

| GitHub username | What this groupmate did                                                     |
| --------------- | --------------------------------------------------------------------------- |
| gihyunx         | Manage repository and wrote the CloudFormation template and Terraform file. |
| samthology      | Reviewed the files and checked the names and tags.                          |
| samjoshuadud    | Checked the bucket settings and policy against Seatwork 3.                  |
| pruvk           | Wrote and checked the answers to the questions.                             |
