# Lab 2 Submission

## Instance Information

### Instance 1
- Instance ID: i-0f40fad04d1624fb1
- Availability Zone: ap-southeast-1a

### Instance 2
- Instance ID: i-045f22ae98afd01ab
- Availability Zone: ap-southeast-1b

## Screenshots:

##1. Activity History
<img width="1366" height="730" alt="asg-activity-scale-out2" src="https://github.com/user-attachments/assets/25bd4ae7-6848-43a8-815a-c2f80f4ee43f" />

##2. CloudWatch Alarm
<img width="1366" height="727" alt="cloudwatch-cpu-scale-out" src="https://github.com/user-attachments/assets/5c8b2816-0bfd-4bbf-974b-02782a5df2b8" />

## Questions

### 1. Why did the group stop at 2 instances?

The group stopped at 2 instances because the maximum capacity was set to 2. Even if the CPU load increased, Auto Scaling could not launch
more than the configured maximum.

### 2. Why did terminating an instance by hand not remove the cost?

Terminating an instance did not remove the cost immediately because the Auto Scaling Group automatically launched a replacement instance to
maintain the group's desired capacity. The replacement instance can continue using AWS resources and therefore can still incur costs.

### 3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?

The target value was set to our assigned 40% CPU utilization because the lab uses different CPU targets for each group and wants Auto 
Scaling to respond to increasing CPU load. A 99% target would make scaling happen much later, leaving the server under very high CPU 
usage before another instance is launched. For our Group 3, the assigned target is 40%.

### 4. What did the automatic cutoff protect us from?

The automatic cutoff protected us from leaving AWS resources running for too long and potentially accumulating unnecessary costs. 
The lab notes that the group does not normally scale in during class because scale-in requires about 15 minutes of low CPU.

### 5. What changes when a load balancer sits in front of the group?

When a load balancer is used, users send their requests to the load balancer instead of directly to each instance.
The load balancer can then distribute incoming traffic among the instances in the Auto Scaling Group. In this lab, there is no 
load balancer, so we access each instance directly through its public IP.
