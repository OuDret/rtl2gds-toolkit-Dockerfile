FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    git \
    build-essential \
    cmake \
    python3 \
    python3-pip \
    python3-dev \
    libboost-all-dev \
    yosys \
    klayout \
    python3-pandas \
    nano

RUN git clone --recursive https://github.com/The-OpenROAD-Project/OpenROAD.git
RUN cd /OpenROAD
RUN /OpenROAD/etc/DependencyInstaller.sh
RUN mkdir /OpenROAD/build 
WORKDIR /OpenROAD/build
RUN cmake ..
RUN make
RUN make install 

WORKDIR /