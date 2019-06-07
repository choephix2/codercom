#!/bin/bash
git config --global user.email "$GIT_USER_EMAIL" ; \
git config --global user.name "$GIT_USER_NAME" ; \
sudo chmod -R 777 /home/coder ; \
sudo chmod -R 777 /ini ; \
if [ $AUTOPULL_SETTINGS = true ] ; then
  echo "Automatically pulling settings at startup"
  cd /ini
  git pull
fi
