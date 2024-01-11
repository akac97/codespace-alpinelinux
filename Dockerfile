FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add -U git git-lfs nano fish bash wget curl neovim python3 py3-pip shadow gcc g++ make ca-certificates openssl ncurses coreutils libgcc linux-headers grep util-linux binutils findutils && \
    mkdir -p ~/.config/pip && \
    echo "[global]" >> ~/.config/pip/pip.conf && \
    echo "break-system-packages = true" >> ~/.config/pip/pip.conf && \
    python3 -m pip install -U pip wheel setuptools && \
    curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
    curl -Lo install https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install && \
    chmod +x install && \
    fish -c "./install --noninteractive" && \
    rm install && \
    fish -c "omf install bass" && \
    mkdir /root/.config/fish/functions/ && \
    COPY nvm.fish /root/.config/fish/functions/nvm.fish && \
    COPY nvm_find_nvmrc.fish /root/.config/fish/functions/ && \
    COPY load_nvm.fish /root/.config/fish/functions/ && \
    echo 'load_nvm > /dev/stderr' >> ~/.config/fish/config.fish && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    fish -c "nvm install node" && \
    fish -c "nvm use node" && \
    fish -c "npm update -g npm" && \
    fish -c "npm update -g" && \
    usermod -s /usr/bin/fish root
