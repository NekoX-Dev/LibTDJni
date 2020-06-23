#!/usr/bin/env bash

tag="td@$(cd td && git log --pretty=format:'%h' -n 1)"

git tag "$tag" -f
git push origin "$tag" -f