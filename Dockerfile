FROM codercom/code-server
MAINTAINER cx2 choephix2@gmail.com
WORKDIR /
ENV BOB →
RUN apt update
RUN apt upgrade
RUN apt install -y \
    sudo \
    curl \
    nano \
    git \
    tmux 
COPY root /root
COPY coder /home/coder
#### TODO: git clone the above somewhere else with symlinks, to be able to push changes

EXPOSE 8443

## CMD ["code-server","--allow-http","--no-auth"]
