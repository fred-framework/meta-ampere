# meta-ampere
A collection of yocto layers required to build the image for the ZCU102 board used in the AMPERE project](https://ampere-euproject.eu/).

This repository will consist of the following git submodules:
- [meta-fred](https://github.com/fred-framework/meta-fred): FRED is a framework to support the design, development, and execution of predictable software on FPGA system-on-chips platforms; 
- meta-dnn: Vitis AI setup for the ZCU102 board;
- [meta-retis](https://github.com/fred-framework/meta-retis): Linux kernel ans rootfs customized for realtime development;
- meta-ros2: ROS2 middleware used by the AMPERE project demonstrators;

This repository will also have a [repo manifest file](https://git-repo.info/en/docs/multi-repos/manifest-format/) to easy the setup generation. All the Linux image generation is done with Petalinux 2020.2.

## Authors

 - Alexandre Amory (Frebruary 2022), [Real-Time Systems Laboratory (ReTiS Lab)](https://retis.santannapisa.it/), [Scuola Superiore Sant'Anna (SSSA)](https://www.santannapisa.it/), Pisa, Italy.

## Funding
 
This software package has been developed in the context of the [AMPERE project](https://ampere-euproject.eu/). This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 871669.
