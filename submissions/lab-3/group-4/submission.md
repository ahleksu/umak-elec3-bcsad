# Lab 3 Submission

## About us

- Group number: 4
- Section: IV-BCSAD
- Client: A sari-sari store point-of-sale chain
- VPC CIDR: 10.170.224.0/20

## Task 1. Equal subnets

New prefix: /23

| # | CIDR | First | Last | Usable | First usable | Last usable |
| --- | --- | --- | --- | --- | --- | --- |
| 1 | 10.170.224.0/23 | 10.170.224.0 | 10.170.225.255 | 507 | 10.170.224.4 | 10.170.225.254 |
| 2 | 10.170.226.0/23 | 10.170.226.0 | 10.170.227.255 | 507 | 10.170.226.4 | 10.170.227.254 |
| 3 | 10.170.228.0/23 | 10.170.228.0 | 10.170.229.255 | 507 | 10.170.228.4 | 10.170.229.254 |
| 4 | 10.170.230.0/23 | 10.170.230.0 | 10.170.231.255 | 507 | 10.170.230.4 | 10.170.231.254 |
| 5 | 10.170.232.0/23 | 10.170.232.0 | 10.170.233.255 | 507 | 10.170.232.4 | 10.170.233.254 |
| 6 | 10.170.234.0/23 | 10.170.234.0 | 10.170.235.255 | 507 | 10.170.234.4 | 10.170.235.254 |
| 7 | 10.170.236.0/23 | 10.170.236.0 | 10.170.237.255 | 507 | 10.170.236.4 | 10.170.237.254 |
| 8 | 10.170.238.0/23 | 10.170.238.0 | 10.170.239.255 | 507 | 10.170.238.4 | 10.170.239.254 |

Reserved addresses of subnet 1: 10.170.224.0, 10.170.224.1, 10.170.224.2, 10.170.224.3, and 10.170.225.255.

Working for subnet 1:

```text
VPC CIDR = 10.170.224.0/20
Number of equal subnets = 8

Extra bits = 3, because 2^3 = 8
New prefix = 20 + 3 = /23

Total addresses per subnet = 2^(32 - 23)
                           = 512

Usable addresses = 512 - 5
                 = 507

Subnet 1 starts at 10.170.224.0.
A /23 contains 512 addresses, so its last address is
10.170.225.255.

First usable = 10.170.224.0 + 4
             = 10.170.224.4

Last usable = 10.170.225.255 - 1
            = 10.170.225.254
```

## Task 2. Subnets of a given size

- 2a. 16 subnets fit in the VPC.
- 2b. Each /24 subnet has 251 usable addresses.
- 2c. CIDR: 10.170.237.0/24. Usable range: 10.170.237.4 to 10.170.237.254.

Working for 2c:

```text
Subnet size = 2^(32 - 24)
            = 256 addresses

Subnet number = 14

Offset = (14 - 1) x 256
       = 13 x 256
       = 3,328 addresses

VPC starts at 10.170.224.0.
Adding 3,328 addresses gives 10.170.237.0.

CIDR = 10.170.237.0/24
Usable = 256 - 5 = 251
First usable = 10.170.237.4
Last usable = 10.170.237.254
```

- 2d. The last subnet is 10.170.239.0/24.

## Task 3. Subnets from host counts

| Subnet | Prefix | CIDR | Availability Zone | Usable |
| --- | --- | --- | --- | --- |
| private-a | /24 | 10.170.224.0/24 | ap-southeast-1a | 251 |
| private-b | /24 | 10.170.225.0/24 | ap-southeast-1b | 251 |
| public-a | /26 | 10.170.226.0/26 | ap-southeast-1a | 59 |
| public-b | /26 | 10.170.226.64/26 | ap-southeast-1b | 59 |

The smallest block that can provide 193 usable addresses is /24, which provides 251 usable addresses. A /25 provides only 123 usable addresses.

The smallest block that can provide 35 usable addresses is /26, which provides 59 usable addresses. A /27 provides only 27 usable addresses.

The private-a subnet starts at the beginning of the VPC. Private-b starts at the next /24 boundary after private-a. Public-a starts at the next /26 boundary after private-b, and public-b starts at the next /26 boundary after public-a.

## Task 4. Proposed subnets

| # | Proposal | Valid or not valid | Why |
| --- | --- | --- | --- |
| P1 | 10.170.231.27/26 | Not valid | It does not start on a /26 boundary. The valid /26 block containing this address is 10.170.231.0/26. |
| P2 | 10.170.235.192/26 | Valid | It is inside the VPC, starts on a /26 boundary, and does not overlap any subnet in the Task 3 plan. |
| P3 | 10.170.240.0/22 | Not valid | It is outside the VPC range, which ends at 10.170.239.255. |
| P4 | 10.170.225.128/25 | Not valid | It overlaps the private-b subnet, 10.170.225.0/24. |