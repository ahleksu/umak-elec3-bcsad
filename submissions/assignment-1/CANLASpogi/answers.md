ANSWER_1: The application failed to start because it was denied permission to read the /etc/course-portal/portal.conf file.
ANSWER_2: The course-portal account cannot read the file because the file's permissions are -rw------- (octal 600), granting read/write only to the root owner and zero access to its group (course-portal) and others.
ANSWER_3: 640
ANSWER_3_WHY: 400 would unnecessarily restrict root's write access. Meanwhile, 755 and 777 grant dangerous execute or write access to unauthorized users. 640 provides the exact read-only permission needed for the group while keeping root secure.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Using chmod 777 allows everyone on the system full permissions, leaving the configuration file prone to malicious tampering or unauthorized overwrites.
ANSWER_6: A successful HTTP 200 OK response from the server or the course materials portal successfully loading in a web browser.
ANSWER_7_BRIDGE: component=configuration file, detect=log monitoring, recover=automated script, proof=HTTP health check
