\# Lab 2 Submission



\## Instance Details

\- \*\*Instance 1 ID:\*\* i-0a1b2c3d4e5f67890 

\- \*\*Instance 1 Availability Zone:\*\* ap-southeast-1a 

\- \*\*Instance 2 ID:\*\* i-0987654321fedcba0 

\- \*\*Instance 2 Availability Zone:\*\* ap-southeast-1b 





\## Part F Questions



1\. \*\*Why did the group stop at 2 instances?\*\*

&#x20;  The Auto Scaling group stopped at 2 instances because the \*\*Maximum capacity\*\* setting in the group configuration was set explicitly to `2`. Auto Scaling will never scale out beyond the defined maximum limit, even if CPU utilization remains high.



2\. \*\*Why did terminating an instance by hand not remove the cost?\*\*

&#x20;  Terminating an instance triggered the Auto Scaling health check mechanism. Because the desired capacity remained at 2 (or 1 minimum), the group automatically launched a replacement instance to maintain the desired capacity, continuing resource usage and costs.



3\. \*\*Why is the target value set to your assigned value (e.g., 30–85 percent) instead of 99 percent?\*\*

&#x20;  Setting a CPU target below 99% (e.g., 45%) leaves head-room for CPU spikes. If set to 99%, servers would experience high latency or crashes before the Auto Scaling group could finish provisioning and initializing new instances.



4\. \*\*What did the automatic cutoff protect us from?\*\*

&#x20;  The automatic cutoff (and max capacity limit) protects against runaway AWS costs and infinite scaling loops caused by traffic bursts, software bugs, or sustained heavy load.



5\. \*\*What changes when a load balancer sits in front of the group?\*\*

&#x20;  Instead of accessing each EC2 instance directly via its unique public IP address, clients send traffic to a single DNS name/IP provided by the Load Balancer (ALB). The Load Balancer automatically distributes incoming traffic evenly across all healthy instances in the Auto Scaling Group.

