#! /usr/bin/bash

set -e
clean_up () {
    ARG=$?
    echo "> clean_up"
    echo "rm -rf ${DL}"
    exit $ARG
} 
trap clean_up EXIT

source /etc/os-release

if [ "${ID_LIKE}" == 'debian' ]
then
        sudo apt update
	sudo DEBIAN_FRONTEND=noninteractive apt install -q -y build-essential wget
elif [ "${ID_LIKE}" == 'rhel fedora' ]
then
	sudo yum -q -y groupinstall 'Development Tools'
	sudo yum -q -y install wget kernel-devel kernel-headers
else
	echo "Unsupported distro ${ID_LIKE}. See README.md for manual installation."
fi

DL=$(mktemp -d)

wget -P ${DL} https://core.fuga.cloud:8080/swift/v1/faba49e2b80249c68ebe11119c56b69a/nvidia/NVIDIA-Linux-x86_64-460.73.01-grid.run
wget -P ${DL} https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda_11.2.2_460.32.03_linux.run

sudo bash ${DL}/NVIDIA-Linux-x86_64-460.73.01-grid.run -s
sudo bash ${DL}/cuda_11.2.2_460.32.03_linux.run --silent --samples --toolkit
