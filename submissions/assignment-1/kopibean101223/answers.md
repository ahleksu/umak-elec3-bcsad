ANSWER_1: The Course Materials Portal cannot read /etc/course-portal/portal.conf because it does not have permission to access the file.

ANSWER_2: The file has permission 600, so only the owner can read and write it. The course-portal group has no access to the file.

ANSWER_3: 640

ANSWER_3_WHY: 400 does not give the group read access. 755 and 777 give more permissions than needed.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: chmod 777 gives everyone full access, which can cause security problems.

ANSWER_6: If the portal works again without the permission denied error, it shows that the problem was fixed.

ANSWER_7_BRIDGE: Component = file permissions, Detect = logs and monitoring, Recover = fixing the permissions, Proof = successful access to the portal.