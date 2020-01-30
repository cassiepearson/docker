FROM debian:buster
MAINTAINER Christopher Negrich
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install vim \
    curl \
    git \
    build-essential \
    && apt-get autoremove -y && apt clean -y

# Install Node JS and npm
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -
RUN apt-get install -y nodejs

# Mount my code folder as volume and make it the docker working directory
VOLUME /Repos 
WORKDIR /Repos 
ENTRYPOINT /bin/bash 
