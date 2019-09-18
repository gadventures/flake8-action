#!/bin/sh

printf "\n\nSearching for Python files with changes\n"
# Get the files changed by comparing to another branch, passed here via an arg. Only get python files that arent
# migrations
echo $(git status)
echo $(pwd)
echo $(ls)
MERGE_BASE=$(git merge-base $GITHUB_SHA $1)
FILES=$(git diff $MERGE_BASE --cached --name-only --diff-filter=ACM | grep -E ".py$" | grep -v "migrations/")
RETVAL=0

if [ -n "$FILES" ]; then
    printf "Checking python files for flake8 violations"
    for file in ${FILES}; do
        FLAKE8_ERRORS=$(git show :${file} | flake8 --ignore=E501,W503,W504 - | sed -e 's/^stdin\:/line /g')

        if [ "$FLAKE8_ERRORS" != "" ]; then
            printf "Flake8 errors detected in $file\n"
            printf "$FLAKE8_ERRORS\n"
            # A flake8 error shouldn't be a reason to mark a PR as 'failed'
            RETVAL=78
        fi
    done
else
    printf "No python files with changes\n"
fi

exit $RETVAL
