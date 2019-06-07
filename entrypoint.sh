#!/bin/bash
git config --global user.email "$GIT_USER_EMAIL" ; \
git config --global user.name "$GIT_USER_NAME" ; \
sudo chmod -R 777 /home/coder ; \
sudo chmod -R 777 /ini ; \
if [ $AUTOPULL_SETTINGS = true ] ; then
  echo "Startup update: Automatically pulling settings"
  cd /ini
  git pull
fi || true
echo "Staring code-server..."
code-server --help
dumb-init code-server
