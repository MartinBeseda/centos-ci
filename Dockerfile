FROM centos:latest

RUN yum clean all 
RUN yum -y update 
RUN yum -y -v install make build-essential wget git gcc gcc-c++ gfortran pkg-config

# Download the new version of CMake and "install" it
RUN wget https://github.com/Kitware/CMake/releases/download/v3.14.0-rc2/cmake-3.14.0-rc2-Linux-x86_64.sh
RUN chmod +x cmake-*.sh
RUN yes | ./cmake-3.14.0-rc2-Linux-x86_64.sh
WORKDIR "cmake-3.14.0-rc2-Linux-x86_64/bin"
RUN ln -s $(pwd)/cmake /usr/bin/cmake
