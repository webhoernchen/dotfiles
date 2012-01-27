#!/bin/bash

for dir in $(ls); do 
  if ls ${dir}/.git > /dev/null 2>&1; then
    echo "Aktualisiere Git Repository in $dir ..."
    cd $dir
    git checkout master
    git pull
    cd ..
  fi
done

git add $(git status | grep "new commits" | awk '{print $3}')
git commit -m " * vim/bundle update"
