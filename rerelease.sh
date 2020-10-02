#!/usr/bin/env bash

git add .

git commit --amend --no-edit

git push -f

tag="td@$(cd td && git log --pretty=format:'%h' -n 1)"

git tag "$tag" -f
git push origin "$tag" -f