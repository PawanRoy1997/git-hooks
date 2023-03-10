#!/bin/sh

# Rule
# 1. Developer must ensure that code is getting compiled first
# 2. Developer cannot push directly into the develpment (main) branch.

tests=$(./gradlew assemble)
if [ tests ]; then
    echo "๐ป ๐ฆนโโ๏ธ Do not push directly in development. ๐ฆนโโ๏ธ ๐ป"
    exit 1
fi

branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" = "development" ]; then
    echo "๐ป ๐ฆนโโ๏ธ Do not push directly in development. ๐ฆนโโ๏ธ ๐ป"
    echo "You are in $branch"
    exit 1
fi