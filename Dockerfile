FROM nvidia/cuda:11.0-devel-ubuntu18.04

WORKDIR /

RUN apt-get update && apt-get install -qy git cmake mesa-common-dev libidn11-dev python3-requests python3-git wget

RUN apt install -y libdbus-1-dev
RUN git clone https://github.com/ethereum-mining/ethminer.git && \
    cd ethminer && \
    git submodule update --init --recursive && \
    mkdir build  && \
    cd build && \
    cmake .. && \
    cmake --build . --config Release && \
    make install

# Env setup
ENV GPU_FORCE_64BIT_PTR=0
ENV GPU_MAX_HEAP_SIZE=100
ENV GPU_USE_SYNC_OBJECTS=1
ENV GPU_MAX_ALLOC_PERCENT=100
ENV GPU_SINGLE_ALLOC_PERCENT=100

ENTRYPOINT ["ethminer", "-U"]
