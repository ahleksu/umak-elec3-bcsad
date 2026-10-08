ANSWER_1: The application is failing because it has no read access to its configuration file at /etc/course-portal/portal.conf.
ANSWER_2: It is failing because the user trying to access is not the owner and the system permission is set to -rw------- which means only the owner only has read and write access, while the group and other users has no access
ANSWER_3: 640
ANSWER_3_WHY: 400 is wrong because it removes owners write access while still giving the group no access, 755 is wrong because it grants execute access to the owner group and other users, 777 is wrong because it grants read, write and execute access to every user in the system.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: it grants unauthorized access to other people or unwanted users that could read write or delete
ANSWER_6: Checking the /var/log/course-portal/app.log
ANSWER_7_BRIDGE: component=<file system>, detect=<constant monitoring>, recover=<backup configuration>, proof=<simulated user traffic>



