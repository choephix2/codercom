FROM codercom/code-server
MAINTAINER cx2 choephix2@gmail.com

ENV WORKSPACE="/home/coder/project"
# really wish it can be /workspace ^ ^ ^ ^

RUN sudo chmod -R 777 $WORKSPACE
WORKDIR $WORKSPACE

ENV BOB "→"
ENV BOB_COLOR 93
ENV PASSWORD chimichanga
ENV GIT_USER_EMAIL ''
ENV GIT_USER_NAME ''
ENV AUTOPULL_SETTINGS false
ENV SETTINGS_REPO "https://choephix2:lJaX0356@github.com/choephix2/codercom.git"
#### TODO: make ssh ^ ^ ^ ^

RUN sudo apt-get update
RUN sudo apt-get install -y --no-install-recommends apt-utils
RUN sudo apt-get upgrade -y
RUN sudo apt-get install -y sudo curl nano git tmux 

RUN sudo mkdir -m 777 /ini
RUN git clone $SETTINGS_REPO /ini

RUN code-server --install-extension daylerees.rainglow
RUN code-server --install-extension fabiospampinato.vscode-terminals
RUN code-server --install-extension fabiospampinato.vscode-commands
RUN code-server --install-extension actboy168.tasks

RUN sudo mkdir -p /home/coder/.local/share/code-server/User/
RUN sudo chmod -R 777 /home/coder

COPY .vscode $WORKSPACE/.vscode

EXPOSE 8443

ENTRYPOINT ["/bin/bash","/ini/scripts/entrypoint.sh"]

CMD ["/usr/bin/tmux"]
