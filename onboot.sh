#!/bin/bash
echo "Setting up symbolic links:"
sudo chmod -R 777 /home/coder
sudo chmod -R 777 /ini
sudo chmod -R 777 /root
sudo ln -sf /ini/root/.bashrc /root/.bashrc
sudo ln -sf /ini/coder/.bashrc /home/coder/.bashrc
sudo ln -sf /ini/coder/.tmux.conf /home/coder/.tmux.conf
sudo ln -sf /ini/coder/.tmux.conf.local /home/coder/.tmux.conf.local
sudo ln -sf /ini/coder/.local/share/code-server/User/settings.json /home/coder/.local/share/code-server/User/settings.json
sudo ln -sf /ini/coder/.local/share/code-server/User/keybindings.json /home/coder/.local/share/code-server/User/keybindings.json

if [[ -ez $PASSWORD ]] 
  AUTH_OPTION='--no-auth'
else
  AUTH_OPTION=''

echo "Staring code-server..."
code-server --help
dumb-init code-server --disable-telemetry --allow-http
