#! /bin/bash

git add .
git commit -m "pushing changes"
git push

if [ $1 -eq "" ]; then
    echo "Please provide a tag version"
    exit 1
fi
git tag -a $1 -m "Releasing version $1"
git push origin $1