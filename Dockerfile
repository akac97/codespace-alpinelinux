FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add git git-lfs nano fish bash wget curl neovim python3 py3-pip shadow && \
    mkdir -p ~/.config/pip && \
    echo "[global]" >> ~/.config/pip/pip.conf && \
    echo "break-system-packages = true" >> ~/.config/pip/pip.conf && \
    python3 -m pip install -U pip wheel setuptools && \
    usermod -s /usr/bin/fish root
