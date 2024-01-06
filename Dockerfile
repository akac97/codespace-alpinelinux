FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add git git-lfs nano fish bash wget curl neovim python3 py3-pip shadow && \
    python3 -m pip config set global.require-virtualenv false && \
    python3 -m pip install -U pip wheel setuptools && \
    usermod -s /usr/bin/fish root
