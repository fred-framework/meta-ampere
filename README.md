# meta-ampere

This is small Yocto Layer, and also a script, that configures a Petalinux project to generate the Linux image for the ZCU102 board used in the [AMPERE project](https://ampere-euproject.eu/).

Besides the default Xilinx layers, this Petalinux project consists of these additional Layers:
- [meta-fred](https://github.com/fred-framework/meta-fred): FRED is a framework to support the design, development, and execution of predictable software on FPGA system-on-chips platforms; 
- [meta-retis](https://github.com/fred-framework/meta-retis): Linux kernel ans rootfs customized for realtime development;
- [meta-ros](https://github.com/sssa-ampere/meta-ros): ROS2 middleware used by the AMPERE project demonstrators;
- [meta-dnn](https://github.com/sssa-ampere/meta-dnn): Vitis AI setup for the ZCU102 board;
- `meta-openmp`: **TODO** create Yocto layer for OpenMP based tools from BSC;
- `meta-extrae`: **TODO** create Yocto layer for [extrae](https://github.com/bsc-performance-tools/extrae);

This repository will also have a [repo manifest file](https://git-repo.info/en/docs/multi-repos/manifest-format/), like this [one](https://github.com/Xilinx/yocto-manifests), to easy the setup generation. All the Linux image generation is done with Petalinux 2020.2.

## Running the script

Go to the directory where the petalinux project will be generated and run:

    $ wget https://raw.githubusercontent.com/sssa-ampere/meta-ampere/main/config.sh .
    $ chmod +x config.sh
    $ wget https://raw.githubusercontent.com/sssa-ampere/meta-ampere/main/scripts/pt-config
    # wget bsp
    $ ./config.sh <prj-name> <full-path/bsp> <full-path/pt-config>

## Authors

 - Alexandre Amory (Frebruary 2022), [Real-Time Systems Laboratory (ReTiS Lab)](https://retis.santannapisa.it/), [Scuola Superiore Sant'Anna (SSSA)](https://www.santannapisa.it/), Pisa, Italy.

## Funding
 
This software package has been developed in the context of the [AMPERE project](https://ampere-euproject.eu/). This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 871669.
