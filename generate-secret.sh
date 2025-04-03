#!/bin/bash

# Summary: This simple script creates a new branch based on your git username, and a datetimestamp.
#          Creates a new stripe like secret and adds it to a file.

username="$1"
branchname=${username%@*}-$(date +%Y%m%d%H%M%S)

git checkout main
git checkout -b $branchname

basestripestring="sk_live_"
stringrand=$(openssl rand -hex 50 | head -c 99)
echo "\n$basestripestring$stringrand" >> credentials.txt

git add credentials.txt && git commit -am "${username%@*} is testing push protection"
