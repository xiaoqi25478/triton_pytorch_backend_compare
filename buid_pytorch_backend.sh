set -ex

cd buid_pytorch_backend/
mkdir -p build
cd build

if [ ! -f cmake-3.23.0-rc3-linux-x86_64.tar.gz ];then 
    wget -c https://cmake.org/files/v3.23/cmake-3.23.0-rc3-linux-x86_64.tar.gz
    tar -zxvf cmake-3.23.0-rc3-linux-x86_64.tar.gz
    cp cmake-3.23.0-rc3-linux-x86_64 /opt/cmake-3.23.0 -r
    ln -sf /opt/cmake-3.23.0/bin/* /usr/bin
fi

cmake -DCMAKE_INSTALL_PREFIX:PATH=`pwd`/install -DTRITON_PYTORCH_DOCKER_IMAGE="nvcr.io/nvidia/pytorch:21.02-py3" ..
make install