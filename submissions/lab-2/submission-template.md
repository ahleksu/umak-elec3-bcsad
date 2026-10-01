# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-0e58afbf3da324d12
- Availability Zone: ap-southeast-1b

**Second Instance**
- Instance ID: i-0b0098484bda7e73b
- Availability Zone: ap-southeast-1a

## Proof (Screenshots)
1. **Activity History:** Add a screenshot showing the Auto Scaling group's Activity history when the second instance launched.
   
   ![alt text](<Screenshot 2026-10-01 110700.png>)

2. **CloudWatch Alarm:** Add a screenshot of the target tracking alarm in the "In alarm" state.

   ![alt text](<Screenshot 2026-10-01 110312.png>)

## Questions
1. Why did the group stop at 2 instances?
   The Auto Scaling Group had a maximum capacity of 2 instances. Once the group reached 2 instances, it could not launch additional instances.
2. Why did terminating an instance by hand not remove the cost?
   The Auto Scaling Group maintains its desired capacity by launching a replacement when an instance is terminated. Therefore, another instance can continue running and consuming resources.
3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?
   The assigned target of 75% allows Auto Scaling to respond before the CPU becomes excessively overloaded. A 99% target would wait until CPU utilization is extremely high before scaling.
4. What did the automatic cutoff protect us from?
   The automatic cutoff prevented the CPU-burning activity and AWS resources from running indefinitely. This helped limit unnecessary resource usage and potential costs.
5. What changes when a load balancer sits in front of the group?
   Instead of users connecting directly to individual instances, they connect to the load balancer. The load balancer then distributes traffic among the healthy instances in the Auto Scaling Group.
