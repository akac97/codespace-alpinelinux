FROM alpine:latest

RUN apk update && apk upgrade \
    && apk add git git-lfs nano fish bash wget curl gcompat python \
    && mkdir -p ~/miniconda3 \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh \
    && bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 \
    && rm -rf ~/miniconda3/miniconda.sh \
    && ~/miniconda3/bin/conda init --all --system \
    && ~/miniconda3/bin/conda update --all \
    && ~/miniconda3/bin/conda create -n pyenv python=3.11 \
    && ~/miniconda3/bin/conda run -n pyenv bash -c "pip install -U pip wheel setuptools" \
    && usermod -s /usr/bin/fish root
