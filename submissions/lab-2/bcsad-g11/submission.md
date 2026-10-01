# Lab 2 Submission

## Instance Tracking
**First Instance**
- Instance ID: i-08eb0c05dde836837
- Availability Zone: ap-southeast-1b

**Second Instance**
- Instance ID: i-0a95582f8d409b7ec
- Availability Zone: ap-southeast-1a

## Questions
1. Why did the group stop at 2 instances?
   because the maximum capacity is set to 2
2. Why did terminating an instance by hand not remove the cost?
   Because it will be automatically replaced.
3. Why is the target value 40 percent and not 90 percent?
   Group's assigned value is 80%. At 99%, the server is already overloaded and scaling would be too late. Setting it at 80% will trigger the scaling while the first instance is still working.
4. What did the automatic cutoff protect us from?
   It protects us from using AWS resources running indefinitely and accumulating unnecessary charges.
5. What changes when a load balancer sits in front of the group?
   Users will be connected to the load balancer and will be distributed accordingly.
