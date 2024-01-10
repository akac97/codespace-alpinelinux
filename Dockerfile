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
    ./install --noninteractive && \
    rm install && \
    fish -c "omf install bass" && \
    mkdir /root/.config/fish/functions/ && \
    echo '# ~/.config/fish/functions/nvm.fish' > ~/.config/fish/functions/nvm.fish && \
    echo 'function nvm' >> ~/.config/fish/functions/nvm.fish && \
    echo '  # Insert nvm function content here' >> ~/.config/fish/functions/nvm.fish && \
    echo '# ~/.config/fish/functions/nvm_find_nvmrc.fish' > ~/.config/fish/functions/nvm_find_nvmrc.fish && \
    echo 'function nvm_find_nvmrc' >> ~/.config/fish/functions/nvm_find_nvmrc.fish && \
    echo '  # Insert nvm_find_nvmrc function content here' >> ~/.config/fish/functions/nvm_find_nvmrc.fish && \
    echo '# ~/.config/fish/functions/load_nvm.fish' > ~/.config/fish/functions/load_nvm.fish && \
    echo 'function load_nvm --on-variable="PWD"' >> ~/.config/fish/functions/load_nvm.fish && \
    echo '  # Insert load_nvm function content here' >> ~/.config/fish/functions/load_nvm.fish && \
    echo '# ~/.config/fish/config.fish' > ~/.config/fish/config.fish && \
    echo 'load_nvm > /dev/stderr' >> ~/.config/fish/config.fish && \
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash && \
    fish -c "nvm install node" && \
    fish -c "nvm use node" && \
    npm update -g npm && \
    npm update -g && \
    usermod -s /usr/bin/fish root
