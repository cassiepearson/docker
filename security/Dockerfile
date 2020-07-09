FROM debian:latest
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
    libuser \
    && apt-get autoremove -y && apt clean -y

# Set python 3 to be the default python
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install ptf tools
RUN git clone https://github.com/trustedsec/ptf
WORKDIR ptf
COPY ./ptf_install_all $HOME/ptf/ptf_install_all
RUN chmod +x ptf_install_all
RUN pip3 install -r requirements.txt
RUN ./ptf_install_all

# Mount my code folder as volume and make it the docker working directory
VOLUME /code 
WORKDIR /code 
ENTRYPOINT /bin/zsh 
