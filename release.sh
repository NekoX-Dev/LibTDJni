#!/usr/bin/env bash

cd td

git fetch origin master
git checkout master

if [ "$(git rev-parse HEAD)" = "$(git rev-parse FETCH_HEAD)" ]; then

  echo "<< 没有更新"

  exit 1

fi

echo ">> 更新到 $(git rev-parse FETCH_HEAD)"

git reset --hard FETCH_HEAD

cd ..

git add .

git commit -m "Update TDLib"

git push -f

tag="td@$(cd td && git log --pretty=format:'%h' -n 1)"
tag=${tag:0:-1}

git tag "$tag" -f
git push origin "$tag" -f