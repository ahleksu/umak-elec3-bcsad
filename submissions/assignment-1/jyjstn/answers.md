ANSWER_1: The app crashed because it got a "Permission denied" error when trying to read /etc/course-portal/portal.conf.
ANSWER_2: In octal, -rw------- is 600, which means only the owner (root) has read/write permissions, while the group (course-portal) and others have none (---). Even though the user course-portal belongs to the group, the group permission is set to 0, so it gets blocked from reading the file.
ANSWER_3: 640
ANSWER_3_WHY: 400: Group permissions stay at 0, so the user still can't read it (plus root loses write access). 755: Adds execute permissions that aren't needed for a config file, and lets everyone else on the system read it too. 777: Gives full read, write, and execute permissions to literally everyone on the machine, which is terrible for security.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: Anyone on the system would have write access to the config file, meaning another user or an attacker could easily mess with it, change settings, or delete it.
ANSWER_6: Checking /var/log/course-portal/app.log to confirm no new permission errors show up, and opening the portal page in a browser to see that it loads properly with a 200 OK status.
ANSWER_7_BRIDGE: component=configuration, detect=monitoring/health checks, recover=automation/automated remediation, proof=synthetic monitoring/automated health probe
