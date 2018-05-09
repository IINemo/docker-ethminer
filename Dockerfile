FROM nvidia/cuda:9.0-devel-ubuntu16.04

WORKDIR /

# Package and dependency setup
RUN apt-get update \
    && apt-get -y install software-properties-common \
    && add-apt-repository -y ppa:ethereum/ethereum -y \
    && apt-get update \
    && apt-get install -y \
     wget \
     libcryptopp-dev \
     libleveldb-dev \
     libjsoncpp-dev \
     libjsonrpccpp-dev \
     libboost-all-dev \
     libgmp-dev \
     libreadline-dev \
     libcurl4-gnutls-dev \
     ocl-icd-libopencl1 \
     mesa-common-dev \
     libmicrohttpd-dev

RUN wget https://github.com/ethereum-mining/ethminer/releases/download/v0.13.0/ethminer-0.13.0-Linux.tar.gz
RUN tar -xvf ethminer-0.13.0-Linux.tar.gz

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["ethminer", "-U"]
