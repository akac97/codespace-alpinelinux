FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add git git-lfs nano fish bash wget curl neovim python3 && \
    python3 -m pip install -U pip wheel setuptools && \
    python3 -m pip config set global.require-virtualenv false && \
    apk add --no-cache shadow && \
    usermod -s /usr/bin/fish root
