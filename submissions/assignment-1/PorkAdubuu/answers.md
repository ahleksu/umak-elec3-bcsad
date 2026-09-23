ANSWER_1: The Course Materials Portal cannot read /etc/course-portal/portal.conf because permission is denied.

ANSWER_2: The file is owned by root and has -rw------- permissions, which is 600: the owner has read and write permission, while the group and others have no permissions. The course-portal account is neither the owner nor a member of the file's group, so it cannot read the file.

ANSWER_3: 640
ANSWER_3_WHY: 400 does not give the course-portal group read access, while 755 and 777 give more permissions than necessary. The minimum fix is 640 because the group needs read access and others need none.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: chmod 777 gives everyone write and execute access, which allows unauthorized users to modify or execute the configuration file.

ANSWER_6: A successful Course Materials Portal request or page load that proves the application can read its configuration and serve users correctly.

ANSWER_7_BRIDGE: component=configuration/file-permissions, detect=monitoring, recover=automated remediation, proof=health check
