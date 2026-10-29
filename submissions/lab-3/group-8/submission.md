# Lab 3 Submission

<!--
How to use this template:

1. Copy this file to submissions/lab-3/group-<number>/submission.md
2. Replace every <answer> with your group's answer. Delete the angle brackets too.
3. Add rows to the Task 1 table if your VPC divides into 8 subnets.
4. Do not write full names or student numbers in this file.
-->

## About us

- Group number: <8>
- Section: IV-BCSAD
- Client: An esports tournament platform
- VPC CIDR: <10.175.128.0/17>

## Task 1. Equal subnets

New prefix: </19>

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | <10.175.128.0/19> | <10.175.128.0> | <10.175.159.255> | <8187> | <10.175.128.4> | <10.175.159.254> |
| 2 | <10.175.160.0/19> | <10.175.160.0> | <10.175.191.255> | <8187> | <10.175.160.4> | <10.175.191.254> |
| 3 | <10.175.192.0/19> | <10.175.192.0> | <10.175.223.255> | <8187> | <10.175.192.4> | <10.175.223.254> |
| 4 | <10.175.224.0/19> | <10.175.224.0> | <10.175.255.255> | <8187> | <10.175.224.4> | <10.175.255.254> |

Reserved addresses of subnet 1: <10.175.128.0, 10.175.128.1, 10.175.128.2, 10.175.128.3, 10.175.159.255>

Working for subnet 1:

```
<4 subnets = 2 extra bits, so the new prefix is /17 + 2 = /19
host bits = 32 - 19 = 13, total  = 2^13 = 8,192
first = 10.175.128.0
last = 10.175.128.0 + 8,191 = 10.175.159.255
first usable = 10.175.128.0 + 4 = 10.175.128.4
last usable = 10.175.159.255 - 1 = 10.175.159.254>
```

## Task 2. Subnets of a given size

- 2a. <2^(22 - 17) = 32 subnets>
- 2b. <2^(32 - 22) - 5 = 1,019 usable addresses each>
- 2c. CIDR: <10.175.244.0/22>. Usable range: <10.175.244.4 to 10.175.247.254>

Working for 2c:

```
<a /22 has 1,024 addresses, so each subnet moves the 3rd octet by 4
subnet number 30 starts at 10.175.128.0 + (30 - 1) x 1,024 addresses = 10.175.244.0
last address = 10.175.247.255
usable = 10.175.244.4 to 10.175.247.254>
```

- 2d. <10.175.252.0/22>

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | </19> | <10.175.128.0/19> | ap-southeast-1a | <8,187> |
| private-b | </19> | <10.175.160.0/19> | ap-southeast-1b | <8,187> |
| public-a | </21> | <10.175.192.0/21> | ap-southeast-1a | <2,043> |
| public-b | </21> | <10.175.200.0/21> | ap-southeast-1b | <2,043> |

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | <10.175.234.47/21> | Not valid | <It does not start on a valid /21 network boundary. The aligned /21 block contain> |
| P2 | <10.175.248.0/21> | Valid | <It is inside the VPC, correctly aligned, uses an allowed prefix between /16 and /28, and does not overlap any Task 3 subnet.> |
| P3 | <10.175.176.0/20> | Not valid | <It overlaps private-b, 10.175.160.0/19, which covers 10.175.160.0 through 10.175.191.255.> |
| P4 | <10.175.224.0/30> | Not valid | <The /30 prefix is outside the allowed prefix range of /16 through /28.> |
