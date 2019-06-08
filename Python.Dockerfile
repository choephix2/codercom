FROM choephix2/coder

RUN apt-get install -y python3 python3-pip
RUN sudo pip3 install pylint

RUN code-server --install-extension ms-python.python

# VSCode extensions
# RUN apt-get install -y bsdtar curl
# RUN mkdir -p /root/.code-server/extensions
# RUN curl -JL https://github.com/Microsoft/vscode-python/releases/download/2019.2.5558/ms-python-release.vsix | bsdtar -xvf - extension
# RUN mv extension /root/.code-server/extensions/ms-python.python-vscode-2.0.3
