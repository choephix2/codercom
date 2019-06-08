#!/bin/bash
git config --global user.email "$GIT_USER_EMAIL" ; \
git config --global user.name "$GIT_USER_NAME" ; \
if [ $AUTOPULL_SETTINGS = true ] ; then
  echo "Startup update: Automatically pulling settings"
  git -c /ini pull
fi || true
echo - - - - - -
bash onboot.sh
