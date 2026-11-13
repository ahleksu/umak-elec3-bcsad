# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 11
- Section: BCSAD
- Client: A pet clinic records system
- VPC CIDR: 10.189.128.0/19

## Task 1. Equal subnets

New prefix: /21

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.189.128.0/21 | 10.189.128.0 | 10.189.135.255 | 2,043 | 10.189.128.4 | 10.189.135.254 |
| 2 | 10.189.136.0/21 | 10.189.136.0 | 10.189.143.255 | 2,043 | 10.189.136.4 | 10.189.143.254 |
| 3 | 10.189.144.0/21 | 10.189.144.0 | 10.189.151.255 | 2,043 | 10.189.144.4 | 10.189.151.254 |
| 4 | 10.189.152.0/21 | 10.189.152.0 | 10.189.159.255 | 2,043 | 10.189.152.4 | 10.189.159.254 |

Reserved addresses of subnet 1: 10.189.128.0, 10.189.128.1, 10.189.128.2, 10.189.128.3, and 10.189.135.255

Working for subnet 1:

```
4 subnets = 2 extra bits, so the new prefix is /19 + 2 = /21
host bits = 32 - 21 = 11, total = 2^11 = 2,048
first = 10.189.128.0
last  = first + 2,047 = 7 x 256 + 255 -> 10.189.135.255
usable = 2,048 - 5 = 2,043
first usable = 10.189.128.0 + 4 = 10.189.128.4
last usable  = 10.189.135.255 - 1 = 10.189.135.254
```

## Task 2. Subnets of a given size

- 2a. 2^(24 - 19) = 32 subnets
- 2b. 256 - 5 = 251 usable addresses each
- 2c. CIDR: 10.189.134.0/24. Usable range: 10.189.134.4 to 10.189.134.254

Working for 2c:

```
a /24 has 256 addresses, so each subnet moves the 3rd octet by 1
subnet number 7 starts at 10.189.128.0 + (7 - 1) x 256 = 10.189.134.0
last address = 10.189.134.255
usable = 10.189.134.4 to 10.189.134.254
```

- 2d. 10.189.159.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /22 | 10.189.128.0/22 | ap-southeast-1a | 1,019 |
| private-b | /22 | 10.189.132.0/22 | ap-southeast-1b | 1,019 |
| public-a | /23 | 10.189.136.0/23 | ap-southeast-1a | 507 |
| public-b | /23 | 10.189.138.0/23 | ap-southeast-1b | 507 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.189.150.0/23 | Valid | It is inside the VPC, starts on a step, is between /16 and /28, and overlaps none of our Task 3 subnets. |
| P2 | 10.189.142.0/30 | Not valid | A /30 is smaller than /28, the smallest subnet size allowed by AWS. |
| P3 | 10.189.148.133/23 | Not valid | It does not start on a step for a /23; the valid block that holds the address is 10.189.148.0/23. |
| P4 | 10.189.160.0/21 | Not valid | It is outside the VPC, which ends at 10.189.159.255. |
