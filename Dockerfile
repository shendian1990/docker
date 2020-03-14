FROM ubuntu:18.04
LABEL maintainer="Shen Yanbin <shendian1990@gmail.com>"

# install dependencies
#RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list \
RUN apt-get -y update \
&& apt-get -y upgrade 
RUN apt-get -y install build-essential cmake git apt-utils 
RUN apt-get -y install git curl unzip wget clang
#RUN git clone https://github.com/Microsoft/vcpkg.git 
#RUN cd vcpkg && ./bootstrap-vcpkg.sh && ./vcpkg integrate install 
