# Ethereum CUDA Miner


### Docker container for Ethereum mining with CUDA.

Simple and easy to run, if you have a Nvidia GPU and want to mine eth.

**Note:** This image builds upon ethminer: <https://github.com/ethereum-mining/ethminer>  
**Note:** Supports Ampere GPUs, e.g.: GeForce 3080/3090, etc. See branch cuda11.0.


### Requirements for master
- Nvidia device with compute compatibility: 3.0-7.2. and >= 4 GB VRAM. Supports Pascal and Turing (10x and 20x series).
- Nvidia drivers for your GPU, you can get them from here: [Nvidia drivers](http://www.nvidia.com/Download/index.aspx) 
- Nvidia-docker2 (so docker can access your GPU) install instructions here: [nvidia-docker]( https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)) .

### Requirements for cuda11.0
- Nvidia device with compute compatibility >= 8.0. Supports Ampere (30x series).
- Nvidia drivers for your GPU (version >= 455), you can get them from here: [Nvidia drivers](http://www.nvidia.com/Download/index.aspx)
- Nvidia-docker2 (so docker can access your GPU) install instructions here: [nvidia-docker]( https://github.com/nvidia/nvidia-docker/wiki/Installation-(version-2.0)) .

### How to run
```
$ nvidia-docker run -it inemo/ethminer -P stratum1+tcp://<ethaddress>.<node_name (e.g. node1)>@eu1.ethermine.org:4444
```

**Note:** `-U` option is set by default
