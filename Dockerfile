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
RUN sudo apt install -y --force-yes sudo curl nano git tmux 

RUN sudo mkdir /ini
RUN sudo chmod -R 777 /ini
RUN git config --global user.email "$GIT_USER_EMAIL"
RUN git config --global user.name "$GIT_USER_NAME"
RUN git clone https://choephix2:lJaX0356@github.com/choephix2/codercom.git /ini
#### TODO: make ssh ^ ^ ^ ^

RUN sudo chmod -R 777 /home/coder
RUN sudo chmod -R 777 /root
RUN ln -s /ini/root/.bashrc
RUN ln -s /ini/coder/.bashrc
RUN ln -s /ini/coder/.tmux.conf
RUN ln -s /ini/coder/.tmux.conf.local
RUN ln -s /ini/coder/.local/share/code-server/User/settings.json
RUN ln -s /ini/coder/.local/share/code-server/User/keybindings.json
COPY .vscode /workspace/.vscode

EXPOSE 8443

## CMD ["code-server","--allow-http","--no-auth"]
