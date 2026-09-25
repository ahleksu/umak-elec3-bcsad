# Lab 1 Submission

## Part B
**Error Action Name:** Instance launch failed

You are **not authorized to perform this operation.** User: arn:aws:iam::548387266019:user/bcsad-g07 is not authorized to perform: ec2:RunInstances on resource: arn:aws:ec2:ap-southeast-1:548387266019:instance/* because no identity-based policy allows the ec2:RunInstances action. Encoded authorization failure message: u4SmsjvWcTCWwhB6I3KsVeHUKwLJK1qgP6fIn1bP8w7d6r1asatDJaIbqaKJSIdN2ut0pJgdG6KFQBLdxlj5dSAOwv2zNu2de_LQxXwZNP2tbzoofaNVst6XFN4OvsIeQ7HU5zinkW1SazaLSNwgUNvV8KrE9GK9N3u142_jnxLKsjkEQ1_50K4thj6oLRhjW8u1GGnhOvs6NhU-A2BN_rEqh5QRU_Zz6orz7eeYBDGBOAzNyVpqA5D1r6hH0OlXUk9-RtWeP1pmwi_oMHyuSq-iouU0pZxQJF6oFZdZH-i5R_DZ7OTB-UgjMgEA8zmXkGIPeBIeOh6lDqfKg01BmFL83rG32ov4DDiJuVBdW1T56zbkrJRFkzHK8cr0gCTjCg79v_TdzjJfsCn9R1FZTQQBeQx53jlRcH06qiN6Fi7cn99NaNJVZHrlPQMo_SrgFOuNMpJ-bvuRbme1I5UWgyjEm0hP3hDfW9NQpdcsdw0IIoTkdUfs8TMXPiZ7qVsvoaRjPwBUpV0z-DQAei5gFBVsZ-dmILUuHqx8zt03NKoFcILO-Qa2RypxNiD73CdtzIdqYS_bGxQ8cDSVPuqo6OBYnW768VlJ-Fv9l6xEzkfDllumpdD0fDUH_fjreRcAzlFqGDwNvPtjjomCE8mt2Qhj0_j9E5CvX_L7vDSTPEAiZcmSmZaWvyKLfqkckvMqI1qic2kfJKSYpm-44iwkbP7F0-FZMOEfJn5BGkm2vuHnqwSqflXioQCZUTOV8O359DFRRgl5IJqFpOHhRXBkB9Y-36AWDe8MHF4koTCZLk7sZEr_dU9okHilrg
>

**Screenshot (Part B launch denial with username visible):**
![Part B Error]
<img width="625" height="297" alt="image" src="https://github.com/user-attachments/assets/f1c2d318-f3f9-4aca-9181-24a4f4289ae5" />


## Part C
**Policy Statement Blanks:**
- `"Action"`: `"ec2:RunInstances"`
- `"Resource"`: `"instance/*"`
- `"ec2:InstanceType"`: `"t3.micro"`

## Part D
**Security Group Error Text:** 

You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/bcsad-g07 is not authorized to perform: ec2:CreateSecurityGroup on resource: arn:aws:ec2:ap-southeast-1:548387266019:security-group/* because no identity-based policy allows the ec2:CreateSecurityGroup action. Encoded authorization failure message: jH5LFkIwu3w9gZXRMYjVuATxmOHWIIN8iqaPdxXCz4j4NsfaGMr4YUMOZOcN8arjhyLS36tI9w_9D_n1lJeXUYyuN9n0VMzr0kufiVYIb4u2IVGSBHAmvKW0yFFaErrTn-iYbyhywwpFLaNgVtFapFTEP7ZoqwugmZmr2X1xCUsTdZrWQ6BpjZ7CbkX30KPkrwUaBCK61InIo9L75xmjbNq8hoWIFGtFjMfJ5v6AcbBAC16MbjIKY724gdYEZotFzZuPQ5JZyAeq7ZSOIckPsOgpEMeqF9nCDY5PMtCKeQ_CHPg8ICnC2Sp2CSLn5IaTgPmj5o9IYcGltwERu6YItuvGKliIxl8ahhV_F8A8J96AhzdPsk9xn6gE7wb3g-L5K44OopM3yVf_TK1PCeYbjx2DI2tC0rMpAdqOVm5jtowIiV6EEg6Fbg8EcF4r4rK6p_mritUfkf_BY6HVAfdYUhW2VP5nsFjAPmKD7a9UnzTMCKkwKP1fgmcA_ewUeNCgeTjaItA1udGD5ZLWz9wZousCUauJgNlOImiOt8nhKofZ


**Running Instance Time:** 8:22 pm / 20:22 GMT + 18

**Screenshot 1 (Permissions tab listing <user>-launch):**
![Permissions Tab]

<img width="1911" height="912" alt="image" src="https://github.com/user-attachments/assets/e383c9aa-f7ca-434e-9954-cf33f9757d63" />

**Screenshot 2 (Instance in Running state):**
![Running Instance]

<img width="624" height="281" alt="image" src="https://github.com/user-attachments/assets/c69f9504-50fb-45fc-9823-11b0d61d5483" />


## Part E
**t3.small / Tokyo Denial Error:** 

Exception while fetching data (/Resources/EC2_Instances) : software.amazon.awssdk.services.ec2.model.Ec2Exception: You are not authorized to perform this operation. User: arn:aws:iam::548387266019:user/bcsad-g07 is not authorized to perform: ec2:DescribeInstances with an explicit deny in a permissions boundary: arn:aws:iam::548387266019:policy/umak-lab-boundary (Service: Ec2, Status Code: 403, Request ID: 529b3f7a-7ba5-480d-9098-a99482b2043a) (SDK Attempt Count: 1)

**Screenshot 1 (t3.small or Tokyo denial):**
![Boundary Denial]

<img width="627" height="291" alt="image" src="https://github.com/user-attachments/assets/fe85789b-3f30-4c25-ba6a-ff1a89d14c78" />


**Screenshot 2 (CloudTrail event showing errorMessage):**
![CloudTrail Event]

<img width="627" height="282" alt="image" src="https://github.com/user-attachments/assets/7d66844a-99fa-4989-b703-205cce3ab766" />

## Part F Questions
1. Which action did the Part B error name?
   
   <ec2:RunInstances>
2. In your policy, which condition limits `ec2:RunInstances`?
   
   The condition `"ec2:InstanceType": "t3.micro"` limits `ec2:RunInstances` so that the policy only allows launching `t3.micro` instances.
3. After you attached `ec2:*` on `*`, why was `t3.small` still denied? Name the boundary statement.
   
   `t3.small` was still denied because the permissions boundary contains an explicit deny that prevents instance types other than `t3.micro`. The boundary statement is `DenyAnyInstanceTypeButT3Micro`.
4. Why is `ec2:*` on `*` a poor policy even with a boundary?
   
   `ec2:*` on `*` grants very broad EC2 permissions across all EC2 resources. It violates the principle of least privilege because the user receives permissions that are not necessary for the task, even though the permissions boundary can restrict some of those actions.
5. In two sentences: what does the boundary control that your policy cannot?
   
   The permissions boundary sets the maximum permissions that the IAM user can receive, even when an identity policy grants broader permissions. It can therefore continue to deny restricted actions such as launching `t3.small` instances or performing actions outside the allowed Singapore region.
