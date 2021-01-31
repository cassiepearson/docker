FROM parrotsec/security:latest

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install gdb \
    lldb \
    zsh \
    python3 \
    python3-pip \
    vim \
    curl \
    git \
    libuser \
    && apt-get autoremove -y && apt clean -y

RUN curl -fsSL https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb > ripgrep_11.0.2_amd64.deb
RUN dpkg -i ripgrep_11.0.2_amd64.deb
RUN rm -f ripgrep_11.0.2_amd64.deb

# Set python 3 to be the default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Use code folder as volume and make it the docker working directory
VOLUME /code 
WORKDIR /code 
ENTRYPOINT /bin/zsh 
