ANSWER_1: It fails because it encounters Permissiion denied error in /etc/course-portal/portal.conf.
ANSWER_2: The file is owned by root and course-portal is only in the group. The file has permission 600, which means the group has no permission to read it.
ANSWER_3: 640
ANSWER_3_WHY: 400 sets permission to owner-read only, 755 will grant unnecessary permission to groups and others and 777 gives everyone read, write and execute access which is far more permission than needed and will cause security issues 
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Everyone who has access to the specific file can read, modify, and execute it which is a security risk
ANSWER_6: If users are able to access the portal without issues and if there are no error messages in the logs
ANSWER_7_BRIDGE: component=database, detect=system logging, recover=backups, proof=verification
