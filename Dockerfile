FROM nvidia/cuda:9.2-devel-ubuntu18.04

WORKDIR /

# Install common dependencies
RUN apt-get update && apt-get install -qy git cmake mesa-common-dev libidn11-dev python3-requests python3-git wget

# Install ethminer
RUN wget https://github.com/ethereum-mining/ethminer/releases/download/v0.18.0/ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz
RUN tar -xvf ethminer-0.18.0-cuda-9-linux-x86_64.tar.gz

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["ethminer", "-U"]
