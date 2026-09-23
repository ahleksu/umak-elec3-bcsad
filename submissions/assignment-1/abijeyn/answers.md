
ANSWER_1: The course portal application failed because it was denied permission to read its configuration file at /etc/course-portal/portal.conf.
ANSWER_2: The file portal.conf has permissions -rw------- (octal 600), meaning owner root has read and write (rw-), group course-portal has no permissions (---), and others have no permissions (---). Because the application runs under the course-portal account (which only matches group membership and not root ownership), it has 0 access and is blocked from reading the file.
ANSWER_3: 640
ANSWER_3_WHY: 400 removes root write access and still gives the course-portal group zero access. 755 and 777 both grant unnecessary execute permissions on a non-executable config file, and 777 dangerously opens full write access to all users. 640 gives root rw-, grants the course-portal group the required read access (r--), and keeps others at zero access.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Any local user or unauthorized process gains write and execute permissions, allowing anyone to modify, corrupt, or inject malicious content into the system configuration.
ANSWER_6: Successfully loading the portal web page in a browser with an HTTP 200 status and verifying that app.log records clean startup without permission errors.
ANSWER_7_BRIDGE: component=configuration file permissions, detect=log monitoring and automated health checks, recover=automated config deployment or configuration management rollback, proof=successful HTTP requests returning status 200 to active clients
