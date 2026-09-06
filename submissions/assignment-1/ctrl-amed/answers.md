ANSWER_1: The Course Materials Portal failed because it was denied read access to /etc/course-portal/portal.conf.
ANSWER_2: The file mode is -rw------- (600), so only owner root has read/write access while group course-portal has no permissions (---). Since the course-portal user belongs to the group and is not root, access is denied.
ANSWER_3: 640
ANSWER_3_WHY: Mode 400 still denies group read access; modes 755 and 777 grant unnecessary execute permissions and grant world/others access, whereas 640 gives owner read-write, group read access, and denies others.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: It grants write and execute permissions to everyone (world/others), allowing an unauthorized user or attacker to tamper with or overwrite the file.
ANSWER_6: Checking app.log for successful startup messages without permission errors, or receiving an HTTP 200 response when opening the portal page in a browser.
ANSWER_7_BRIDGE: component=file permissions, detect=log monitoring, recover=automated permission remediation, proof=end-to-end HTTP health checks