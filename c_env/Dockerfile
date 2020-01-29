FROM ubuntu:bionic
MAINTAINER Christopher Negrich
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies available from the package manager
RUN apt-get update -qq && apt-get -qq --yes install gcc-4.8 gdb && apt-get autoremove -y && apt clean -y

# Mount my code folder as volume and make it the docker working directory
VOLUME /code 
WORKDIR /code 
