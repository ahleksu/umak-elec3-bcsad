ANSWER_1: The course materials portal cannot read /etc/course-portal/portal.conf because the group has no access to read.
ANSWER_2: The course-portal account cannot read the file because the owner is the only one that has read and write access. `-rw-------` in octal is 600 (4+2 | 0+0 | 0+0). Therefore, the group and others has no permission to access the file since it is both 0.
ANSWER_3: 640
ANSWER_3_WHY: Since the only access that the course-portal group needs is to read, the 640 grants them access to read only. 6 means read and write and is dedicated for the owner, 4 means read only and is dedicated for the group, and 0 means no access for the others. The access for the other three is either lacking or excess, therefore they are wrong. 
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: A risk that chmod 777 proposes is unauthorized access since all of the users (owner, group, others) gains read, write, and execute access.
ANSWER_6: A piece of evidence that proves that the service works again is if the user can access the course-portal without permission denial.
ANSWER_7_BRIDGE: component=file permissions, detect=logs, recover=correct permissions, proof=successful user access