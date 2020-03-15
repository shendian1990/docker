FROM ubuntu:18.04
LABEL maintainer="Shen Yanbin <shendian1990@gmail.com>"

# install dependencies
#RUN sed -i 's/archive.ubuntu/mirrors.aliyun/g' /etc/apt/sources.list \
RUN apt-get -y update \
&& apt-get -y upgrade 
RUN apt-get -y install build-essential cmake git apt-utils
RUN apt-get -y install git curl unzip wget clang
RUN apt-get -y install openssl libssl-dev python
RUN apt-get -y install tree nodejs npm && npm install -g tldr && tldr --update

#RUN git clone https://github.com/Microsoft/vcpkg.git 
#RUN cd vcpkg && ./bootstrap-vcpkg.sh && ./vcpkg integrate install 

#install ripgrep
RUN apt-get install -y vim
RUN apt-get -y install software-properties-common && add-apt-repository ppa:x4121/ripgrep && apt-get -y update
RUN apt-get install -y zsh

#must run this manually after install complete
RUN $(which zsh) 
RUN git clone https://github.com/zsh-users/zsh-autosuggestions  ~/.zsh/zsh-autosuggestions \
&& source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

RUN git clone https://github.com/anishathalye/dotfiles.git \
&& cd dotfiles && ./install ; exit 0 
RUN apt-get -y install tmux htop iotop ncdu