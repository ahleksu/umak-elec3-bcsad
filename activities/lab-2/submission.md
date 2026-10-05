# Lab 2 Submission

## Instance Tracking

### First Instance
- Instance ID: i-0246a4d910f025397
- Availability Zone: ap-southeast-1b

### Second Instance
- Instance ID: i-0cc2149a2d11467a1
- Availability Zone: ap-southeast-1a

## Proof (Screenshots)

1. Activity History:
<img width="961" height="775" alt="image" src="https://github.com/user-attachments/assets/5f720eb2-1f4c-4e94-a512-fd255083b06b" />


3. CloudWatch Alarm:
<img width="956" height="859" alt="image" src="https://github.com/user-attachments/assets/1409d66d-cc4a-4be3-baa5-e1c957e741e3" />
<img width="960" height="838" alt="image" src="https://github.com/user-attachments/assets/5ecb7f9e-75a8-4c8c-a366-46346e8e6658" />



## Questions
1. Why did the group stop at 2 instances?
   The Auto Scaling Group reached its configured maximum limit (max-size: 2), preventing any further scale-out even if CPU utilization remained above the threshold.
2. Why did terminating an instance by hand not remove the cost?
   The Auto Scaling Group enforces a minimum/desired capacity (desired-capacity: 1). Manually terminating an instance causes the ASG health check to detect a deficiency and automatically launch a replacement instance, so compute usage and costs continue.
3. Why is the target value set to your assigned value (e.g., 30-85 percent) instead of 99 percent?
   Setting the target to 60% leaves adequate headroom and buffer for traffic spikes during the initialization/warmup period of newly launched instances, avoiding service degradation, packet loss, or crashes.
4. What did the automatic cutoff protect us from?
   The automated threshold and hard instance limits protect against runaway cloud infrastructure bills, resource exhaustion, and potential credit depletion caused by unhandled traffic loops or DDoS conditions.
5. What changes when a load balancer sits in front of the group?
   A load balancer distributes incoming network traffic evenly across all available healthy instances in the group. Instead of users needing the individual public IP addresses of each instance, they connect through a single, stable entry point (DNS name or public IP provided by the load balancer).
