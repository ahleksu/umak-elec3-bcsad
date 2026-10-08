ANSWER_1: The Course Materials Portal cannot read /etc/course-portal/portal.conf because the file permissions deny the course-portal account access.
ANSWER_2: The permission -rw------- is 600, which means the owner (root) has read and write access, while the group (course-portal) and others have no access. Although course-portal belongs to the course-portal group, the group has no read permission, so the account cannot read the configuration file.
ANSWER_3: 640
ANSWER_3_WHY: 400 does not give the course-portal group read access. 755 gives unnecessary execute and other permissions, while 777 gives read, write, and execute access to everyone, which is more access than the application needs.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: chmod 777 gives every user write access to the configuration file, which could allow an unauthorized user or compromised process to modify its settings.
ANSWER_6: The portal successfully loads or responds to a request, and its logs show that it started without the previous permission error.
ANSWER_7_BRIDGE: component=configuration and file permissions, detect=monitoring and alerts, recover=automated remediation, proof=health checks