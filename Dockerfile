FROM ubuntu:16.04

RUN apt-get update && apt-get install -y \
    build-essential g++ \
    curl \
    git \
    flex byacc bison libgmp-dev \
 && rm -rf /var/lib/apt/lists

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly-2018-01-23

ENV PATH $PATH:/root/.cargo/bin

RUN rustup component add rustfmt-preview --toolchain=nightly-2018-01-23

RUN curl -O https://crypto.stanford.edu/pbc/files/pbc-0.5.14.tar.gz \
    && tar zxvf pbc-0.5.14.tar.gz \
    && cd pbc-0.5.14 \
    && ./configure \
    && make \
    && make install

