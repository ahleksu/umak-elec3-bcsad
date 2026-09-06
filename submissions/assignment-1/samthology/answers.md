ANSWER_1: The portal failed because the service could not read /etc/course-portal/portal.conf, and the log recorded this as permission denied.
ANSWER_2: Root owns the file and holds the only read/write permission, but course-portal is not root, so owner rights do not apply to it. The file's group is course-portal, yet that group has zero permissions, so despite being a group member, course-portal still has no way in, and the others category is also blocked.
ANSWER_3: 640
ANSWER_3_WHY: 400 only lets root read the file, so course-portal is still shut out. 755 opens read and execute access to every account on the system, which a config file doesn't require. 777 hands out full read, write, and execute rights to all users, leaving the file open to being altered by anyone.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Every user on the system would gain the ability to modify or run the file, not just read it, creating an unnecessary tampering risk.
ANSWER_6: Checking app.log after the fix shows the Permission denied errors have stopped and the config loaded successfully, or the portal itself responds correctly when accessed, which is stronger proof than a command simply exiting without error.
ANSWER_7_BRIDGE: component=file permissions, detect=health checks, recover=automated remediation, proof=a successful response from the portal