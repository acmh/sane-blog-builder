#!/bin/bash

# Make sure we're in the correct dir
git checkout blog-dev

# Temporarily stash changes
git stash

# Compile output pages/assets
nanoc

# Switch to Github Pages branch
git checkout blog-master
git rm * -r
git checkout blog-dev
git add .
git commit -m "Builds blog. (automated commit)"

# Push & deploy
git push blog/master blog-master

# Pop files
git checkout blog-dev
git stash pop