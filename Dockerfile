FROM archlinux:base-devel

RUN pacman -Syu --noconfirm \
    && pacman -S git git-lfs nano fish bash wget curl --noconfirm \
    && mkdir -p ~/miniconda3 \
    && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh \
    && bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 \
    && rm -rf ~/miniconda3/miniconda.sh \
    && ~/miniconda3/bin/conda init --all --system \
    && ~/miniconda3/bin/conda update --all \
    && ~/miniconda3/bin/conda create -n pyenv python=3.11 \
    && ~/miniconda3/bin/conda activate pyenv \
    && usermod -s /usr/bin/fish root
