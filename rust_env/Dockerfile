FROM rust:stretch
MAINTAINER Christopher Negrich
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install curl git vim && apt-get autoremove -y && apt clean -y

# Mount my code folder as volume and make it the docker working directory
VOLUME /code 
WORKDIR /code 
ENTRYPOINT /bin/bash 
