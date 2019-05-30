FROM codercom/code-server
MAINTAINER cx2 choephix2@gmail.com
WORKDIR /workspace
VOLUME ["/workspace"]
ENV BOB "→"
RUN sudo apt update
RUN sudo apt install -y --no-install-recommends apt-utils
RUN sudo apt upgrade -y
RUN sudo apt install -y --force-yes \
    sudo \
    curl \
    nano \
    git \
    tmux 
COPY root /root
COPY coder /home/coder
COPY .vscode /workspace/.vscode
RUN sudo chmod -R 777 /home/coder

#### TODO: git clone the above somewhere else with symlinks, to be able to push changes

EXPOSE 8443

## CMD ["code-server","--allow-http","--no-auth"]
