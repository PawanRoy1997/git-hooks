#!/bin/sh

# Rules
# 1. Developer should only use company's provided email address.
# 2. Developer cannot commit directly into the development branch.

userEmail=$(git config user.email)
count=$(echo $userEmail|grep "@teckborn.com"|wc -l)
if [ $count != 1  ]; then
    echo "๐ป ๐ฆนโโ๏ธ Use Teckborn's provided email only. ๐ฆนโโ๏ธ ๐ป"
    exit $count
fi

branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" = "development" ]; then
    echo "๐ป ๐ฆนโโ๏ธ Do not comment directly in development. ๐ฆนโโ๏ธ ๐ป"
    echo "You are in $branch"
    exit 1
fi