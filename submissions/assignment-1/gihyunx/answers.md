ANSWER_1: It can't read /etc/course-portal/portal.conf since only the owner (root) has read and write permissions.
ANSWER_2: The file owner is root, which has rw- access, but course-portal is not root, so owner permissions do not apply. The file's group is course-portal with --- (no permissions), so even though course-portal is a member of that group, it gains no read access. Others permissions are also ---, leaving course-portal with no path to read the file.
ANSWER_3: 640
ANSWER_3_WHY: 400 gives read only to root, so course-portal still won't be able to read the file. 755 makes the file readable and executable by everyone, but that is too much for a config file. 777 gives all users read, write, and execute access, but that exposes the config to tampering by any user on the system.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It grants write and execute access to every user on the system, so any user could overwrite/tamper with the file.
ANSWER_6: The application log at /var/log/course-portal/app.log shows no further Permission denied errors and records a successful startup or request, confirming the service is running and serving content.
ANSWER_7_BRIDGE: component=file permissions, detect=health checks, recover=automated remediation, proof=a successful response from the portal
