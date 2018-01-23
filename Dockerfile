FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    curl \
    git \
 && rm -rf /var/lib/apt/lists

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly-2018-01-23

ENV PATH $PATH:/root/.cargo/bin

RUN rustup component add rustfmt-preview --toolchain=nightly-2018-01-23
