# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: 5
- Section: IV-BCSAD
- Client: A campus library reservation system
- VPC CIDR: 10.192.64.0/18

## Task 1. Equal subnets

New prefix: /20

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.192.64.0/20 | 10.192.64.0 | 10.192.79.255 | 4,091 | 10.192.64.4 | 10.192.79.254 |
| 2 | 10.192.80.0/20 | 10.192.80.0 | 10.192.95.255 | 4,091 | 10.192.80.4 | 10.192.95.254 |
| 3 | 10.192.96.0/20 | 10.192.96.0 | 10.192.111.255 | 4,091 | 10.192.96.4 | 10.192.111.254 |
| 4 | 10.192.112.0/20 | 10.192.112.0 | 10.192.127.255 | 4,091 | 10.192.112.4 | 10.192.127.254 |

Reserved addresses of subnet 1: 10.192.64.0 (network address), 10.192.64.1 (VPC router), 10.192.64.2 (DNS server), 10.192.64.3 (reserved for future use), 10.192.79.255 (network broadcast address)

Working for subnet 1:

```
VPC: 10.192.64.0/18 -> 32 - 18 = 14 host bits -> 2^14 = 16,384 addresses
4 equal subnets -> 4 = 2^2 -> add 2 bits to the prefix -> new prefix /20
Each /20: 32 - 20 = 12 host bits -> 2^12 = 4,096 addresses
A /20 is 4,096 addresses = 16 blocks of 256, so each subnet steps 16 in the third octet

Subnet 1 starts at the first address of the VPC: 10.192.64.0
Last address  = 10.192.64.0 + 4,096 - 1 = 10.192.79.255   (third octet 64 + 16 - 1 = 79)
Usable        = 4,096 - 5 = 4,091
First usable  = first + 4 = 10.192.64.4
Last usable   = last - 1  = 10.192.79.254
Next subnet starts at 10.192.80.0
```

## Task 2. Subnets of a given size

- 2a. 64 subnets of size /24 fit in the VPC.
- 2b. 251 usable addresses in each /24.
- 2c. CIDR: 10.192.68.0/24. Usable range: 10.192.68.4 to 10.192.68.254

Working for 2c:

```
VPC: 10.192.64.0/18 = 16,384 addresses. A /24 = 2^8 = 256 addresses.
2a: 16,384 / 256 = 64 subnets
2b: 256 - 5 = 251 usable addresses
2c: each /24 steps 1 in the third octet. Subnet 1 starts at 10.192.64.0.
    Subnet number 5 starts at third octet 64 + (5 - 1) = 68, so its CIDR is 10.192.68.0/24.
    Last address = 10.192.68.255
    First usable = 10.192.68.0 + 4 = 10.192.68.4
    Last usable  = 10.192.68.255 - 1 = 10.192.68.254
2d: the VPC ends at 10.192.127.255. Subnet 64 starts at third octet 64 + 63 = 127,
    so the last subnet is 10.192.127.0/24.
```

- 2d. 10.192.127.0/24

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /20 | 10.192.64.0/20 | ap-southeast-1a | 4,091 |
| private-b | /20 | 10.192.80.0/20 | ap-southeast-1b | 4,091 |
| public-a | /21 | 10.192.96.0/21 | ap-southeast-1a | 2,043 |
| public-b | /21 | 10.192.104.0/21 | ap-southeast-1b | 2,043 |

Working for Task 3:

```
Each private subnet needs 3,993 usable. Total must be at least 3,993 + 5 = 3,998.
  The smallest power of 2 that is at least 3,998 is 4,096 = 2^12, so the prefix is /20 (4,091 usable).
Each public subnet needs 1,472 usable. Total must be at least 1,472 + 5 = 1,477.
  The smallest power of 2 that is at least 1,477 is 2,048 = 2^11, so the prefix is /21 (2,043 usable).

Placement, in order (a /20 steps 16 in the third octet, a /21 steps 8):
  private-a: starts at the VPC start 10.192.64.0, ends 10.192.79.255
  private-b: next address 10.192.80.0 (80 is a multiple of 16), ends 10.192.95.255
  public-a:  next address 10.192.96.0 (96 is a multiple of 8), ends 10.192.103.255
  public-b:  next address 10.192.104.0 (104 is a multiple of 8), ends 10.192.111.255
```

## Task 4. Proposed subnets

The VPC is 10.192.64.0 to 10.192.127.255. The Task 3 plan uses 10.192.64.0 to 10.192.111.255.

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.192.128.0/20 | Not valid | It is outside the VPC, because the VPC ends at 10.192.127.255 and this block starts at 10.192.128.0. |
| P2 | 10.192.72.0/21 | Not valid | It is on a step and inside the VPC, but 10.192.72.0 to 10.192.79.255 overlaps private-a (10.192.64.0/20). |
| P3 | 10.192.120.0/21 | Valid | It is inside the VPC, starts on a step (120 is a multiple of 8), is between /16 and /28, and does not overlap the Task 3 plan, which ends at 10.192.111.255. |
| P4 | 10.192.112.0/29 | Not valid | A /29 is smaller than the allowed /28 minimum, even though it is inside the VPC, on a step, and does not overlap the plan. |
