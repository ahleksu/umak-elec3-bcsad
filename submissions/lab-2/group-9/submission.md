# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-0cf8b7ce32f760b16
- Availability Zone: ap-southeast-1b

**Second Instance**
- Instance ID: i-0cb7148ab2f06e819
- Availability Zone: ap-southeast-1a

## Proof (Screenshots)
1. **Activity History:** Add a screenshot showing the Auto Scaling group's Activity history when the second instance launched.
   
   ![Activity History](Activity%20History.png)

2. **CloudWatch Alarm:** Add a screenshot of the target tracking alarm in the "In alarm" state.

   ![CloudWatch Alarm](CloudWatch%20Alarm.png)

## Questions
1. Why did the group stop at 2 instances?
   We set the group's maximum capacity to 2. Even though the burn kept CPU high and the target tracking policy kept wanting more capacity, the Auto Scaling group never launches beyond its maximum, so desired capacity was capped at 2.

2. Why did terminating an instance by hand not remove the cost?
   The Auto Scaling group noticed it was below its desired capacity and launched a replacement instance from the launch template. The number of running (billed) instances stayed the same. To actually stop paying, you have to lower the capacity or delete the group itself, which is why cleanup deletes the ASG first.

3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?
   A new instance takes a few minutes to launch, boot, run the user data, and finish its 60-second warmup. The target leaves headroom so the existing instance can still serve traffic during that delay. At 99% the alarm would only fire once the server was already saturated, and users would see slow or failed requests before help arrived. It also gives the policy room to react to a spike before it becomes an outage.

4. What did the automatic cutoff protect us from?
   It protected the account from leftover resources running and billing after class if a team forgot cleanup. The ASG keeps replacing terminated instances, so a forgotten group could run (and cost money) indefinitely.

5. What changes when a load balancer sits in front of the group?
   Users get one stable DNS name instead of opening each instance by its public IP. The load balancer spreads requests across all healthy instances, automatically adds new instances as the group scales out and drops them as it scales in or when they fail health checks. The ASG can also use the load balancer's health checks (not just EC2 status checks) to replace instances whose app is broken. Instances can then sit in private subnets with only the load balancer exposed.
