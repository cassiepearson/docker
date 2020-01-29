FROM debian:buster
MAINTAINER Christopher Negrich
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install gcc gdb \
    zsh \
    python3 \
    python3-pip \
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
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
RUN ~/.cargo/bin/rustup component add rls rust-analysis rust-src

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install neovim dependencies
RUN pip3 install --no-cache-dir neovim 
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

# Mount my code folder as volume and make it the docker working directory
VOLUME /Repos 
WORKDIR /Repos 
ENTRYPOINT /bin/zsh 
