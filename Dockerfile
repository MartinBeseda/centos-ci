FROM centos:latest

RUN yum clean all 
RUN yum -y update 
RUN yum -y -v install make wget git pkg-config mpich mpich-devel python2 python36 bison flex
RUN yum -y groupinstall "Development Tools"
RUN yum -y install kernel-devel kernel-headers

RUN alias python="python2"
RUN alias python3="python3.6"

# Install GCC/G++ 8.*
#RUN yum -y install devtoolset-8-gcc devtoolset-8-gcc-c++ devtoolset-8-gcc-gfortran

# Download the new version of CMake and "install" it
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.0-rc2/cmake-3.14.0-rc2-Linux-x86_64.sh
RUN chmod +x cmake-*.sh
RUN yes | ./cmake-3.14.0-rc2-Linux-x86_64.sh
WORKDIR "cmake-3.14.0-rc2-Linux-x86_64/bin"
RUN ln -s $(pwd)/cmake /usr/bin/cmake
