# Automated install of Nvidia grid drivers

Run `install.sh`.

# Manual install of Nvidia grid drivers

These are the steps to install the Nvidia grid drivers on Ubuntu.

```sh
doge01# wget https://core.fuga.cloud:8080/swift/v1/faba49e2b80249c68ebe11119c56b69a/nvidia/NVIDIA-Linux-x86_64-460.73.01-grid.run
doge01# apt update && apt install build-essential
doge01# sh NVIDIA-Linux-x86_64-460.73.01-grid.run
doge01# wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda_11.2.2_460.32.03_linux.run
doge01# sh cuda_11.2.2_460.32.03_linux.run --silent --toolkit --samples
doge01# cat <<HERE > /etc/nvidia/gridd.conf
ServerAddress=gridlicense1.core.fuga.cloud
ServerPort=7070
FeatureType=4
HERE
doge01# systemctl restart nvidia-gridd.service
```
