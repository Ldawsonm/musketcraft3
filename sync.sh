#!/bin/sh

git stash
git fetch origin master
git pull origin master --no-edit
