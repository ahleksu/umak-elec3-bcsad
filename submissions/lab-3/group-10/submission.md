# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 10
- Section: IV_BCSAD
- Client: A print shop order portal
- VPC CIDR: 172.22.0.0/16

## Task 1. Equal subnets

New prefix: /19

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 172.22.0.0/19 | 172.22.0.0 | 172.22.31.255 | 8187 | 172.22.0.4 | 172.22.31.254 |
| 2 | 172.22.32.0/19 | 172.22.32.0 | 172.22.63.255 | 8187 | 172.22.32.4 | 172.22.63.254 |
| 3 | 172.22.64.0/19 | 172.22.64.0 | 172.22.95.255 | 8187 | 172.22.64.4 | 172.22.95.254 |
| 4 | 172.22.96.0/19 | 172.22.96.0 | 172.22.127.255 | 8187 | 172.22.96.4 | 172.22.127.254 |
| 5 | 172.22.128.0/19 | 172.22.128.0 | 172.22.159.255 | 8187 | 172.22.128.4 | 172.22.159.254 |
| 6 | 172.22.160.0/19 | 172.22.160.0 | 172.22.191.255 | 8187 | 172.22.160.4 | 172.22.191.254 |
| 7 | 172.22.192.0/19 | 172.22.192.0 | 172.22.223.255 | 8187 | 172.22.192.4 | 172.22.223.254 |
| 8 | 172.22.224.0/19 | 172.22.224.0 | 172.22.255.255 | 8187 | 172.22.224.4 | 172.22.255.254 |

Reserved addresses of subnet 1: 172.22.0.0, 172.22.0.1, 172.22.0.2, 172.22.0.3, 172.22.31.255

Working for subnet 1:

```
8 subnets = 3 extra bits, so the new prefix is /16 + 3 = /19
host bits = 32 - 19 = 13, total = 2^13 = 8,192
first = 172.22.0.0
last  = first + 8191 = 31 x 256 + 255 -> 172.22.31.255
usable = 8,192 - 5 = 8,187
first usable = 172.22.0.0 + 4 = 172.22.0.4
last usable  = 172.22.31.255 - 1 = 172.22.31.254
```

## Task 2. Subnets of a given size

- 2a. 2^(20 - 16) = 16 subnets
- 2b. 4096 - 5 = 4091 usable addresses each
- 2c. CIDR: 172.22.64.0/20. Usable range: 172.22.64.4 to 172.22.79.254

Working for 2c:

```
a /20 has 4096 addresses, so each subnet moves the 3rd octet by 16
subnet number 5 starts at 172.22.0.0 + (5 - 1) x 16 = 172.22.64.0
last address = 172.22.79.255
usable = 172.22.64.4 to 172.22.79.254
```

- 2d. 172.22.240.0/20

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /18 | 172.22.0.0/18 | ap-southeast-1a | 16,379 |
| private-b | /18 | 172.22.64.0/18 | ap-southeast-1b | 16,379 |
| public-a | /19 | 172.22.128.0/19 | ap-southeast-1a | 8,187 |
| public-b | /19 | 172.22.160.0/19 | ap-southeast-1b | 8,187 |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 172.22.192.0/30 | Not valid | A /30 is smaller than /28, the smallest subnet that AWS allows. |
| P2 | 172.23.0.0/18 | Not valid | It is outside the VPC, which ends at 172.22.255.255. |
| P3 | 172.22.224.0/20 | Valid | Inside the VPC, on a step, and it overlaps none of the four subnets above. |
| P4 | 172.22.212.202/20 | Not Valid | 	It does not start on a step. The /20 that holds .212 is 172.22.208.0/20 |
