#!/usr/bin/env bash


#Part 1: Basic Commands
pwd
ls -la
mkdir practice_cli
cd practice_cli
touch notes.txt
echo "Hello Linux" > notes.txt
echo "Learning CLI is fun!" >> notes.txt
cat notes.txt

#Part 2: File Operations
cp notes.txt backup_notes.txt
mv backup_notes.txt notes_backup.txt
mkdir docs
mv notes_backup.txt docs/
ls -l notes.txt
chmod u+x notes.txt
chmod o-w notes.txt
ls -l notes.txt

#Part 3: System Information
whoami
date
ps aux
pgrep bash

#Part 4: Cleanup
cd ~
rm -rf practice_cli