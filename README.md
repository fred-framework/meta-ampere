# meta-ampere

This is small Yocto Layer, and also a script, that configures a Petalinux 2020.2 project to generate the Linux image for the ZCU102 board used in the [AMPERE project](https://ampere-euproject.eu/).

Besides the default Xilinx layers, this Petalinux project consists of these additional Layers downloaded by a [manifest file](https://github.com/sssa-ampere/zcu102-manifest):
- [meta-fred](https://github.com/fred-framework/meta-fred): FRED is a framework to support the design, development, and execution of predictable software on FPGA system-on-chips platforms; 
- [meta-retis](https://github.com/fred-framework/meta-retis): Linux kernel ans rootfs customized for realtime development;
- [meta-ros](https://github.com/ros/meta-ros/tree/zeus): ROS2 (foxy) middleware used by the AMPERE project demonstrators;
- [meta-dnn](https://github.com/sssa-ampere/meta-dnn): Vitis AI setup for the ZCU102 board;
- `meta-openmp`: **TODO** create Yocto layer for OpenMP based tools from BSC;
- `meta-extrae`: **TODO** create Yocto layer for [extrae](https://github.com/bsc-performance-tools/extrae);

<!---
# TODO: create recipe for PAPI and Extrae
# extrae depedencies
sudo apt-get install libunwind-dev libxml2-dev libzip-dev

# download the source code
git clone https://bitbucket.org/icl/papi.git
git clone https://github.com/SSSA-ampere/extrae.git
https://gitlab.bsc.es/ampere-sw/wp2/extrae

cd papi/src
./configure
make -j 8 
sudo make install
cd ../..

cd extrae
autoconf
./configure
make -j 8 
sudo make install
cd ../..

# TODO create recipe for the version of libomp used by BSC
https://gitlab.bsc.es/ampere-sw/wp2/llvm/-/tree/master/openmp
--->

## Running the script

Go to the directory where the petalinux project will be generated and run:

    $ wget https://raw.githubusercontent.com/sssa-ampere/meta-ampere/main/config.sh .
    $ chmod +x config.sh
    $ wget https://raw.githubusercontent.com/sssa-ampere/meta-ampere/main/scripts/pt-config
    # wget bsp
    $ ./config.sh <prj-name> <full-path/bsp> <full-path/pt-config>

## Testing ROS2 on the Board


On Terminal 1:

```
$ source /usr/bin/ros_setup.bash
$ ros2 run examples_rclcpp_minimal_publisher publisher_lambda
```

On Terminal 2: 

```bash
$ ros2 node list
    /minimal_publisher
$ ros2 node info /minimal_publisher
    /minimal_publisher
    Subscribers:
        /parameter_events: rcl_interfaces/msg/ParameterEvent
    Publishers:
        /parameter_events: rcl_interfaces/msg/ParameterEvent
        /rosout: rcl_interfaces/msg/Log
        /topic: std_msgs/msg/String
    Service Servers:
        /minimal_publisher/describe_parameters: rcl_interfaces/srv/DescribeParameters
        /minimal_publisher/get_parameter_types: rcl_interfaces/srv/GetParameterTypes
        /minimal_publisher/get_parameters: rcl_interfaces/srv/GetParameters
        /minimal_publisher/list_parameters: rcl_interfaces/srv/ListParameters
        /minimal_publisher/set_parameters: rcl_interfaces/srv/SetParameters
        /minimal_publisher/set_parameters_atomically: rcl_interfaces/srv/SetParametersAtomically
    Service Clients:

    Action Servers:

    Action Clients:
$ ros2 topic list
    /parameter_events
    /rosout
    /topic
```

And finally,

```
$ source /usr/bin/ros_setup.bash
$ ros2 run examples_rclcpp_minimal_subscriber subscriber_lambda
```

## References

 - [ROS 2 in Kria kv260 with Petalinux 2021.2](https://www.hackster.io/jlamperez10/ros-2-in-kria-kv260-with-petalinux-2021-2-92ec3a). Most of the ROS2 and petalinux setup instructions came from this tutorial;
 - 

## Authors

 - Alexandre Amory (Frebruary 2022), [Real-Time Systems Laboratory (ReTiS Lab)](https://retis.santannapisa.it/), [Scuola Superiore Sant'Anna (SSSA)](https://www.santannapisa.it/), Pisa, Italy.

## Funding
 
This software package has been developed in the context of the [AMPERE project](https://ampere-euproject.eu/). This project has received funding from the European Union’s Horizon 2020 research and innovation programme under grant agreement No 871669.
