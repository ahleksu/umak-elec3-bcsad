# Lab 3: VPC Subnet Planning Case Study

**Group:** 3  
**Client:** Jeepney Fleet Tracking Service  
**VPC CIDR:** `172.23.48.0/20`

---

## Task 1. Divide the VPC into 8 equal subnets

The VPC has a `/20` prefix. Dividing it into 8 equal subnets requires 3 additional bits:

`20 + 3 = 23`

Therefore, each subnet is `/23`, with `2^(32-23) = 512` total addresses and `512 - 5 = 507` usable addresses.

| Subnet | CIDR | First address | Last address | Usable addresses | First usable | Last usable |
|---|---|---|---|---:|---|
| 1 | `172.23.48.0/23` | `172.23.48.0` | `172.23.49.255` | 507 | `172.23.48.4` | `172.23.49.254` |
| 2 | `172.23.50.0/23` | `172.23.50.0` | `172.23.51.255` | 507 | `172.23.50.4` | `172.23.51.254` |
| 3 | `172.23.52.0/23` | `172.23.52.0` | `172.23.53.255` | 507 | `172.23.52.4` | `172.23.53.254` |
| 4 | `172.23.54.0/23` | `172.23.54.0` | `172.23.55.255` | 507 | `172.23.54.4` | `172.23.55.254` |
| 5 | `172.23.56.0/23` | `172.23.56.0` | `172.23.57.255` | 507 | `172.23.56.4` | `172.23.57.254` |
| 6 | `172.23.58.0/23` | `172.23.58.0` | `172.23.59.255` | 507 | `172.23.58.4` | `172.23.59.254` |
| 7 | `172.23.60.0/23` | `172.23.60.0` | `172.23.61.255` | 507 | `172.23.60.4` | `172.23.61.254` |
| 8 | `172.23.62.0/23` | `172.23.62.0` | `172.23.63.255` | 507 | `172.23.62.4` | `172.23.63.254` |

**Working for subnet 1:** A `/23` contains 512 addresses. The first block starts at `172.23.48.0`; adding 511 gives `172.23.49.255`. AWS reserves the first four addresses and the final address, leaving 507 usable addresses (`172.23.48.4` through `172.23.49.254`).

**Five reserved addresses in subnet 1:**

1. `172.23.48.0` – Network address
2. `172.23.48.1` – VPC router
3. `172.23.48.2` – DNS server
4. `172.23.48.3` – Reserved by AWS for future use
5. `172.23.49.255` – Reserved broadcast address

---

## Task 2. Subnets of a given size

Given subnet size: `/25`; requested subnet number: 12.

**2a. Number of `/25` subnets that fit in the VPC**

`2^(25 - 20) = 2^5 = 32 subnets`

**2b. Usable addresses per `/25`**

`2^(32 - 25) = 128 total addresses`

`128 - 5 = 123 usable addresses`

**2c. Subnet number 12**

Subnet 1 starts at `172.23.48.0`. Each `/25` contains 128 addresses. Subnet 12 starts after 11 blocks:

`11 × 128 = 1,408 addresses`

Thus, subnet 12 is **`172.23.53.128/25`**.

- First address: `172.23.53.128`
- Last address: `172.23.53.255`
- Usable range: `172.23.53.132 – 172.23.53.254`

**2d. Last `/25` subnet**

The last subnet is **`172.23.63.128/25`**.

---

## Task 3. Size subnets from host counts

The private subnets each need 942 usable addresses. A `/22` has 1,024 total and 1,019 usable addresses, while a `/23` has only 507 usable addresses. Therefore, each private subnet is `/22`.

The public subnets each need 71 usable addresses. A `/25` has 128 total and 123 usable addresses, while a `/26` has only 59 usable addresses. Therefore, each public subnet is `/25`.

Subnets are placed in the required order: `private-a`, `private-b`, `public-a`, `public-b`.

| Subnet | Prefix | CIDR | Availability Zone | Usable addresses |
|---|---|---|---|---:|
| private-a | `/22` | `172.23.48.0/22` | `ap-southeast-1a` | 1,019 |
| private-b | `/22` | `172.23.52.0/22` | `ap-southeast-1b` | 1,019 |
| public-a | `/25` | `172.23.56.0/25` | `ap-southeast-1a` | 123 |
| public-b | `/25` | `172.23.56.128/25` | `ap-southeast-1b` | 123 |

**Usable ranges:**

| Subnet | First usable | Last usable |
|---|---|---|
| private-a | `172.23.48.4` | `172.23.51.254` |
| private-b | `172.23.52.4` | `172.23.55.254` |
| public-a | `172.23.56.4` | `172.23.56.126` |
| public-b | `172.23.56.132` | `172.23.56.254` |

---

## Task 4. Check the proposed subnets

A proposed subnet must be inside the VPC, start on a valid step, use a prefix from `/16` through `/28`, and not overlap the Task 3 subnets.

| Proposal | Result | Explanation |
|---|---|---|
| P1 `172.23.54.0/24` | **Not valid** | It overlaps `private-b` (`172.23.52.0/22`), which covers `172.23.52.0–172.23.55.255`. |
| P2 `172.23.58.0/30` | **Not valid** | `/30` is smaller than AWS's minimum allowed subnet size of `/28`. |
| P3 `172.23.63.0/25` | **Valid** | It is inside the VPC, aligned on a `/25` boundary, within AWS's allowed subnet sizes, and does not overlap any Task 3 subnet. |
| P4 `172.23.64.0/22` | **Not valid** | It is outside the VPC, whose range is `172.23.48.0–172.23.63.255`. |

