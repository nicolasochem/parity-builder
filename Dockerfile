FROM ubuntu:16.04

ARG PARITY_VERSION=stable

ARG RUST_VERSION=stable

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
        curl https://sh.rustup.rs -sSf | sh -s -- --default-toolchain $RUST_VERSION -y

ENV PATH /root/.cargo/bin:$PATH

# build parity
RUN git clone https://github.com/paritytech/parity && \
        cd parity && \
        git checkout $PARITY_VERSION && \
        cargo build --release
