ANSWER_1: The Course Materials Portal cannot read /etc/course-portal/portal.conf because permission is denied.
ANSWER_2: The file portal.conf has permissions -rw------- (octal 600), giving read and write access only to owner root. The course-portal account is a member of the course-portal group, but the group has no permissions (---), so the account cannot read the file.
ANSWER_3: 640
ANSWER_3_WHY: Option 400 gives the group no read permission, so the application still cannot read the file; options 755 and 777 grant more permissions than necessary, including execute access and access for others.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Giving 777 permissions lets any user or process on the system modify or overwrite the configuration file.
ANSWER_6: Clean startup log entries without permission errors and successful HTTP responses when accessing the portal website.
ANSWER_7_BRIDGE: component=configuration file access, detect=log monitoring, recover=minimum permission fix, proof=successful portal access
