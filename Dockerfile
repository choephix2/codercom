FROM codercom/code-server
MAINTAINER cx2 choephix2@gmail.com

WORKDIR /workspace
VOLUME ["/workspace"]
RUN sudo chmod -R 777 /workspace


ENV BOB "→" 
ENV PASSWORD chimichanga
ENV GIT_USER_EMAIL "the.nameless.one@example.com"
ENV GIT_USER_NAME "The Nameless One"

RUN sudo apt update
RUN sudo apt install -y --no-install-recommends apt-utils
RUN sudo apt upgrade -y
RUN sudo apt install -y sudo curl nano git tmux 

RUN sudo mkdir /ini
RUN sudo chmod -R 777 /ini
RUN git config --global user.email "$GIT_USER_EMAIL"
RUN git config --global user.name "$GIT_USER_NAME"
RUN git clone https://choephix2:lJaX0356@github.com/choephix2/codercom.git /ini
#### TODO: make ssh ^ ^ ^ ^

RUN sudo chmod -R 777 /home/coder
RUN sudo chmod -R 777 /root
RUN sudo ln -s /ini/root/.bashrc /root/.bashrc
RUN sudo ln -s /ini/coder/.bashrc /home/coder/.bashrc
RUN sudo ln -s /ini/coder/.tmux.conf /home/coder/.tmux.conf
RUN sudo ln -s /ini/coder/.tmux.conf.local /home/coder/.tmux.conf.local
RUN sudo ln -s /ini/coder/.local/share/code-server/User/settings.json /home/coder/.local/share/code-server/User/settings.json
RUN sudo ln -s /ini/coder/.local/share/code-server/User/keybindings.json /home/coder/.local/share/code-server/User/keybindings.json
RUN sudo chmod -R 777 /home/coder
RUN sudo chmod -R 777 /root
COPY .vscode /workspace/.vscode

EXPOSE 8443
EXPOSE 8080
EXPOSE 22

## CMD ["code-server","--allow-http","--no-auth"]
