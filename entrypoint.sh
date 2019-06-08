#!/bin/bash
git config --global user.email "$GIT_USER_EMAIL" ; \
git config --global user.name "$GIT_USER_NAME" ; \
sudo chmod -R 777 /home/coder ; \
sudo chmod -R 777 /ini ; \
if [ $AUTOPULL_SETTINGS = true ] ; then
  echo "Startup update: Automatically pulling settings"
  git -c /ini pull
fi || true
echo - - - - - -
echo - - - - - -
cat /ini/Dockerfile
echo - - - - - -
echo - - - - - -
cat /ini/entrypoint.sh
echo - - - - - -
echo - - - - - -
echo "Staring code-server..."
code-server --help
dumb-init code-server --disable-telemetry --allow-http
