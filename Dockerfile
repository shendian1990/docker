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
#install ripgrep
RUN add-apt-repository ppa:x4121/ripgrep && apt-get -y update

#RUN git clone https://github.com/Microsoft/vcpkg.git 
#RUN cd vcpkg && ./bootstrap-vcpkg.sh && ./vcpkg integrate install 
RUN git clone https://github.com/anishathalye/dotfiles.git \
&& cd dotfiles && ./install 
RUN $(which zsh) && git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions \
&& source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh