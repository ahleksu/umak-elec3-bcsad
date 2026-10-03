# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-02282eaa45c237fc8
- Availability Zone: ap-southeast-1a

**Second Instance**
- Instance ID: i-00c7a8599ca2802ac
- Availability Zone: ap-southeast-1b

## Questions
1. Why did the group stop at 2 instances?
   Because we configured the maximum capacity limit to 2, preventing the Auto Scaling group from scaling beyond that number.
2. Why did terminating an instance by hand not remove the cost?
   Because the service automatically attempts to maintain the minimum capacity, so it replaced the deleted instance with a fresh one. When the instance is terminated manually, the ASG detected it was missing and automatically launched a replacement to take its place.
3. Why is the target value 40 percent and not 90 percent?
   Setting a lower target provides a buffer because scaling is not instant. If the target was 90 percent, a sudden traffic spike would likely crash the server from overload before the new instance finishes its 60-second warmup and is ready to help.
4. What did the automatic cutoff protect us from?
   It protected the account from accumulating ongoing AWS EC2 hourly charges in case you forgot to manually delete the Auto Scaling group and instances after class.
5. What changes when a load balancer sits in front of the group?
   A load balancer provides a single entry point, so users wouldn't have to manually type the IP addresses of the individual instances to reach the application.
