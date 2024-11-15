#! /bin/bash

VERSION=$( grep '^version:' pubspec.yaml | cut -d ' ' -f 2 | cut -d '+' -f 1 )

echo "Releasing version v$VERSION"

git add .
git commit -m "Release v$VERSION"
git push

git tag -a v$VERSION -m "Release v$VERSION"
git push origin v$VERSION