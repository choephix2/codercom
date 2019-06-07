FROM codercom/code-server
MAINTAINER cx2 choephix2@gmail.com

ARG WORKSPACE="/home/coder/project"
# really wish it can be /workspace ^ ^ ^ ^

VOLUME [$WORKSPACE]

RUN sudo chmod -R 777 $WORKSPACE
WORKDIR $WORKSPACE

ENV BOB "→"
ENV BOB_COLOR 93
ENV PASSWORD chimichanga
ENV GIT_USER_EMAIL ''
ENV GIT_USER_NAME ''
ENV SETTINGS_REPO "https://choephix2:lJaX0356@github.com/choephix2/codercom.git"
ENV AUTOPULL_SETTINGS false
#### TODO: make ssh ^ ^ ^ ^

RUN sudo apt update
RUN sudo apt install -y --no-install-recommends apt-utils
RUN sudo apt upgrade -y
RUN sudo apt install -y sudo curl nano git tmux 

RUN sudo mkdir /ini
RUN sudo chmod -R 777 /ini
RUN git clone $SETTINGS_REPO /ini

RUN sudo mkdir -p /home/coder/.local/share/code-server/User/
RUN sudo chmod -R 777 /home/coder
RUN sudo chmod -R 777 /root
RUN sudo ln -sf /ini/root/.bashrc /root/.bashrc
RUN sudo ln -sf /ini/coder/.bashrc /home/coder/.bashrc
RUN sudo ln -sf /ini/coder/.tmux.conf /home/coder/.tmux.conf
RUN sudo ln -sf /ini/coder/.tmux.conf.local /home/coder/.tmux.conf.local
RUN sudo ln -sf /ini/coder/.local/share/code-server/User/settings.json /home/coder/.local/share/code-server/User/settings.json
RUN sudo ln -sf /ini/coder/.local/share/code-server/User/keybindings.json /home/coder/.local/share/code-server/User/keybindings.json

COPY .vscode $WORKSPACE/.vscode

EXPOSE 8443

ENTRYPOINT ["/bin/bash","/ini/entrypoint.sh"]

CMD ["--allow-http"]
