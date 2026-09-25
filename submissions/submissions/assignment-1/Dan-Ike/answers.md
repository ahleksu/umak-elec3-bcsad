ANSWER_1: The Course Materials Portal failed to read its config file, portal.conf, because permission was denied.
ANSWER_2: The file's permissions are 600, so only the owner (root) has read and write access, while the course-portal group has no access and others also have no access.
ANSWER_3: 640
ANSWER_3_WHY: 400 is wrong because it removes the owner's write permission and still gives the group no access. 755 is wrong because it gives the group and others unnecessary execute permission. 777 is wrong because it gives everyone full access, risking unauthorized changes.
ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H
ANSWER_5: A concrete risk of chmod 777 is that any user can modify or replace the file, which can allow unauthorized changes or malicious code.
ANSWER_6: Confirm that the service is actually working by testing its function—for example, access the website or connect to the service and verify it responds correctly, not just that the start command completed successfully.
ANSWER_7_BRIDGE: component=permissions, detect=read the error log for "Permission denied", recover=fix the ownership or permissions with chown or chmod, proof=verify the service starts successfully and works as expected.
