FROM ubuntu:16.04

WORKDIR /build

# Install the build environment
RUN apt-get update && \
        apt-get install -y \
        build-essential \
        curl \
        git \
        pkg-config \
        libudev-dev \
        libssl-dev && \
        curl https://sh.rustup.rs -sSf | sh -s -- -y

ENV PATH /root/.cargo/bin:$PATH

# build parity
RUN git clone https://github.com/paritytech/parity && \
        cd parity && \
        git checkout stable && \
        cargo build --release
