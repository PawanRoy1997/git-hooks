#!/bin/sh

# Rule
# 1. Developer must ensure that code is getting compiled first
# 2. Developer cannot push directly into the develpment (main) branch.

tests=$(./gradlew assemble)
if [ tests ]; then
    echo "👻 🦹‍♂️ Do not push directly in development. 🦹‍♂️ 👻"
    exit 1
fi

branch=$(git rev-parse --abbrev-ref HEAD)
if [ "$branch" = "development" ]; then
    echo "👻 🦹‍♂️ Do not push directly in development. 🦹‍♂️ 👻"
    echo "You are in $branch"
    exit 1
fi