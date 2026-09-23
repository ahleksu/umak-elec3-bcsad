Part B:
	Error name: ec2:RunInstances
	Screenshot:<img width="1366" height="734" alt="part-b-error" src="https://github.com/user-attachments/assets/09ac079c-0758-43cd-ba15-bd2c95f5ce46" />

Part C:
	Policy Statement Blanks:
		- Action: ec2:RunInstances`
		- Resource: instance
- ec2:InstanceType: t3.micro`

Part D:
Security Group Error Text: not authorized to perform: ec2:CreateSecurityGroup 
Running Instance Time: 9:45PM
Permissions Tab Screenshot: <img width="1366" height="730" alt="part-d-policy" src="https://github.com/user-attachments/assets/340ef209-1279-4863-b8ae-3c0564ddc378" />

Running Instance Tab Screenshot:<img width="1366" height="730" alt="part-d-instance" src="https://github.com/user-attachments/assets/805616f5-c59d-42af-93b0-62769748ec76" />

Part E:
	t3.small / Tokyo Denial Error: Instance launch failed: You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/bcsad-g03 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary.
	Boundary Denial Screenshot:<img width="1366" height="721" alt="part-e-denial" src="https://github.com/user-attachments/assets/564b3fe8-0f73-485a-adfc-9203dcd8a911" />
  CloudTrail Event Screenshot:<img width="1366" height="725" alt="part-e-cloudtrail" src="https://github.com/user-attachments/assets/2f537f58-8d48-46cf-bf4a-15cc2227453e" />

Part F:
1. Which action did the Part B error name?

The action named in the error was ec2:RunInstances.

2. In your policy, which condition limits ec2:RunInstances?

The StringEquals condition "ec2:InstanceType": "t3.micro" limits ec2:RunInstances to launching only t3.micro instances.

3. After attaching ec2:* on *, why was t3.small still denied? Name the boundary statement.

The t3.small launch was still denied because the permissions boundary contains an explicit deny that prevents instance types other than t3.micro. The boundary statement is DenyAnyInstanceTypeButT3Micro.

4. Why is ec2:* on * a poor policy even with a boundary?

ec2:* on * grants unnecessarily broad EC2 permissions instead of limiting the user to only the actions and resources required for the lab. Although the permissions boundary can restrict those permissions, the identity policy itself should still follow the principle of least privilege.

5. In two sentences: what does the boundary control that your policy cannot?

The permissions boundary sets the maximum permissions that the IAM user can receive, so an identity policy cannot grant permissions that the boundary explicitly denies. It can restrict permissions such as the allowed instance type and region even when the identity policy allows broader EC2 actions.
