FROM alpine:latest

RUN apk update && \
    apk upgrade && \
    apk add --no-cache git git-lfs nano fish bash wget curl neovim python3 py3-pip shadow gcc g++ make ca-certificates openssl ncurses coreutils libgcc linux-headers grep util-linux binutils findutils && \
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
    mkdir -p /root/.config/fish/functions/ && \
    curl -o /root/.config/fish/functions/nvm.fish https://raw.githubusercontent.com/akac97/codespace-alpinelinux/main/nvm.fish && \
    curl -o /root/.config/fish/functions/nvm_find_nvmrc.fish https://raw.githubusercontent.com/akac97/codespace-alpinelinux/main/nvm_find_nvmrc.fish && \
    curl -o /root/.config/fish/functions/load_nvm.fish https://raw.githubusercontent.com/akac97/codespace-alpinelinux/main/load_nvm.fish && \
    echo 'load_nvm > /dev/stderr' >> ~/.config/fish/config.fish && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    fish -c "nvm install node" && \
    fish -c "nvm use node" && \
    fish -c "npm update -g npm" && \
    fish -c "npm update -g" && \
    fish -c "nvm cache clear" && \
    usermod -s /usr/bin/fish root
