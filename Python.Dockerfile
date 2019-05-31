FROM choephix2/coder
RUN apt-get update && apt-get -y upgrade

# VSCode extensions
RUN apt-get install -y bsdtar curl
RUN mkdir -p /root/.code-server/extensions
RUN curl -JL https://github.com/Microsoft/vscode-python/releases/download/2019.2.5558/ms-python-release.vsix | bsdtar -xvf - extension
RUN mv extension /root/.code-server/extensions/ms-python.python-vscode-2.0.3

CMD ["code-server", "--allow-http", "--no-auth"]
