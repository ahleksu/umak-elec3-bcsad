# Assignment #2: Explore a VPC

## Part A: Explore the Default VPC

## 1. Default VPC Details

| Item | Answer |
|---|---|
| VPC ID | vpc-02b29f02cd658307 |
| State | Available |
| IPv4 CIDR | 172.31.0.0/16 |
| IPv6 CIDR | None |
| Tenancy | Default |
| Default VPC | Yes |
| Owner ID | 548387266019 |

---

## 2. Subnets

The default VPC contains three default subnets located in different Availability Zones.

| Subnet ID | Availability Zone | IPv4 CIDR |
|---|---|---|
| subnet-00a19af925fdd4d | ap-southeast-1a | 172.31.32.0/20 |
| subnet-03a5209dd3590f3f5 | ap-southeast-1b | 172.31.16.0/20 |
| subnet-09c3dc46f64c311d1 | ap-southeast-1c | 172.31.0.0/20 |

---

## 3. Internet Gateway

| Item | Answer |
|---|---|
| Internet Gateway ID | igw-0943e7e688293168 |
| State | Attached |
| Attached VPC | vpc-02b29f02cd658307 |

The Internet Gateway allows communication between VPC resources and the Internet.

---

## 4. Route Table

| Item | Answer |
|---|---|
| Route Table ID | rtb-037b142ea7ed8c1c9 |
| Main Route Table | Yes |
| VPC ID | vpc-02b29f02cd658307 |

Routes:

| Destination | Target |
|---|---|
| 172.31.0.0/16 | local |
| 0.0.0.0/0 | igw-0943e7e688293168 |

---

## 5. Security Group

Security Group Name:

default

VPC:

vpc-02b29f02cd658307

Inbound Rules:
- Allows traffic from resources using the same security group.

Outbound Rules:
- Allows all outbound traffic.

---

# Part B: Proposed Small VPC Design

## Network Configuration

VPC CIDR:

10.0.0.0/16


Public Subnet:

10.0.1.0/24


Private Subnet:

10.0.2.0/24


## Components

### Internet Gateway

Provides Internet access for public resources.


### Public Subnet

Contains the EC2 Web Server because it requires Internet access.


### Private Subnet

Contains the database server to protect internal resources.


### Route Table

Routes:

0.0.0.0/0 → Internet Gateway


### Security Groups

EC2 Security Group:
- HTTP Port 80
- HTTPS Port 443
- SSH Port 22


Database Security Group:
- MySQL Port 3306
- Allows access only from the web server.


The proposed VPC separates public and private resources to improve security and network management.