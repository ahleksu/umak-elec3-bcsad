ANSWER_1: The portal app can't read /etc/course-portal/portal.conf. The log shows "Permission denied" when it tries to open the file.

ANSWER_2: `-rw-------` is 600 in octal: owner gets read/write, group and others get nothing (`---`). The file's owner is root, not course-portal, so the owner bits don't apply. The course-portal account's group (course-portal, gid 995) matches the file's group, but group bits are 0, so being a group member still gives no access.

ANSWER_3: 640
ANSWER_3_WHY: 400 leaves group at `---`, so course-portal still can't read it as a group member, not the owner. 755 and 777 add execute permission, which a config file doesn't need. 777 is worst because it also gives write and execute to others, so any user on the system could edit or run it. 640 fixes the bug with the least access: owner keeps read/write, group gets read-only, others stay at zero.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: With 777, every account on the system gets write and execute on portal.conf. Any other user, or an attacker on a low-privilege account, could rewrite the config or drop something malicious in its place.

ANSWER_6: Tail app.log after the fix and confirm no new "Permission denied" errors when the config is read. Then load the portal and check it renders course materials. A passing chmod or a clean restart doesn't prove the app serves real content to users.

ANSWER_7_BRIDGE: component=file permissions/config layer, detect=log monitoring with alerts on repeated errors, recover=automated rollback of the bad config or self-healing restart, proof=an end-to-end check that a real user request loads the portal's content
