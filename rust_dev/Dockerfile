FROM debian:buster
MAINTAINER Christopher Negrich
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install gcc \
    lldb \
    clang \
    libclang-dev \
    gdb \
    g++ \
    zsh \
    python3 \
    python3-pip \
    build-essential \
    cmake \
    vim-nox \
    mono-complete \
    nodejs \
    default-jdk \
    npm \
    python3-dev \
    vim \
    neovim \
    curl \
    git \
    ripgrep \
    libuser \
    && apt-get autoremove -y && apt clean -y

# Install ripgrep - only available through apt in ubuntu 18.10+ - Use this block if you change the image
#RUN curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb > ripgrep_11.0.2_amd64.deb
#RUN dpkg -i ripgrep_11.0.2_amd64.deb
#RUN rm -f ripgrep_11.0.2_amd64.deb

# Set python 3 to be the default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

# Install rust and rust live server
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install neovim dependencies
RUN pip3 install --no-cache-dir neovim 
RUN python3 -m pip install --user --upgrade pynvim
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN ~/.fzf/install
RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Clone dotfiles and copy to home
RUN git clone https://github.com/cnegrich/dotfiles.git
RUN chmod -R 755 /dotfiles
RUN mv /dotfiles/.zshrc $HOME/.zshrc \
    && mv /dotfiles/.vimrc $HOME/.vimrc \
    && mkdir $HOME/.config \
    && mkdir $HOME/.config/nvim \
    && mv /dotfiles/.config/nvim/init.vim $HOME/.config/nvim/init.vim \
    && mv /dotfiles/.zsh $HOME/ \
    && rm -rf /dotfiles \
    && touch $HOME/.bash_profile

# Install vim plugins - This will produce a bunch of warnings that do not matter
RUN nvim --noplugin --headless -i NONE -c VundleUpdate -c quitall

# Compile YCM-Core
RUN cd ~/.vim/bundle/YouCompleteMe && python3 install.py --clang-completer \
      --cs-completer \
      --java-completer \
      --js-completer \
      --rust-completer \
      --system-libclang

# Mount my code folder as volume and make it the docker working directory
VOLUME /code 
WORKDIR /code 
ENTRYPOINT /bin/zsh 
