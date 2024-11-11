#! /bin/bash

git add .
git commit -m "pushing changes"
git push

git tag -a $1 -m "Releasing version $1"
git push origin $1