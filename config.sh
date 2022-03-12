#!/bin/sh
# configures a petalinux project to build the ZCU102 Linux image for the AMPERE project
# usage: config.sh <user> <ip> <path>

proj_name=$1
bsp_file=$2
defconf_file=$3

# initial project setup
petalinux-create -t project -s $bsp_file -n $proj_name
cd $proj_name
petalinux-config --silentconfig
cd build/
## ATTENTION !!! here you have to point to your own 'downloads' and 'sstate-cache' dirs.
# if you dont have them, just comment these two lines
ln -s /ssd/work/petalinux/2020.2/shared/zynqmp/downloads .
ln -s /ssd/work/petalinux/2020.2/shared/zynqmp/sstate-cache .
cd ..

# download the required yocto layers
mkdir -p components/ext_source
cd components/ext_source
repo init -u https://github.com/sssa-ampere/zcu102-manifest.git
repo sync

# load petalinux configuration
cd ../..
cp $defconf_file project-spec/configs/config

# set the ROS version
cat >> build/conf/bblayers.conf<< EOF
# define the ROS 2 Yocto target release
ROS_OE_RELEASE_SERIES = "zeus"

# define ROS 2 distro
ROS_DISTRO = "foxy"
EOF

# configure the project
petalinux-config --silentconfig 

# build
petalinux-build -c retis-dev-image

# pack
cd images/linux
petalinux-package --boot --force --fsbl zynqmp_fsbl.elf --fpga system.bit --pmufw pmufw.elf --atf bl31.elf --u-boot u-boot.elf
