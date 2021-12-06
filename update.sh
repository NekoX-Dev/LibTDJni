#!/usr/bin/env bash

cd td

git fetch origin master
git checkout master

if [ "$(git rev-parse HEAD)" = "$(git rev-parse FETCH_HEAD)" ]; then

  echo "<< No update"

  exit 1

fi

echo ">> Update to $(git rev-parse FETCH_HEAD)"

git reset --hard FETCH_HEAD

cd ..

git add .