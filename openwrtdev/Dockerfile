FROM ubuntu:20.04

ENV PROXY http://192.168.0.189:7890

# 使用代理
RUN export http_proxy=${PROXY}
RUN export https_proxy=${PROXY}

# 更新源
RUN sed -i '1i\deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' /etc/apt/sources.list
RUN apt update -y
RUN apt full-upgrade -y
RUN apt upgrade -y

# 分批安装编译依赖
RUN apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential
RUN apt install -y bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib
RUN apt install -y git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev
RUN apt install -y libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz
RUN apt install -y mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pip qemu-utils
RUN apt install -y rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip vim wget xmlto xxd zlib1g-dev


RUN groupadd openwrt && useradd -g openwrt -m -d /home/openwrt -s /bin/bash openwrt

WORKDIR /home/openwrt

USER openwrt

RUN git config --global http.proxy ${PROXY}
RUN git config --global https.proxy ${PROXY}
RUN git clone https://github.com/coolsnowwolf/lede

WORKDIR /home/openwrt/lede



# FROM ubuntu:22.04

# ENV PROXY http://192.168.0.189:7890

# # 使用代理
# RUN export http_proxy=${PROXY}
# RUN export https_proxy=${PROXY}

# # 更新源
# # RUN sed -i '1i\deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse\ndeb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse' /etc/apt/sources.list
# RUN apt-get update
# # RUN apt upgrade -y

# # 安装开发依赖
# RUN echo -e "\n6\n\n70" | apt-get -y install libxml2
# RUN apt-get install -y build-essential git unzip libio-compress-perl

# # 设置环境变量
# RUN echo export THEOS=/opt/theos >> ~/.bashrc
# RUN echo alias nic=/opt/theos/bin/nic.pl >> ~/.bashrc
# RUN echo "umask 0022" >> ~/.bashrc
# RUN echo export PATH="\$THEOS/bin:\$PATH" >> ~/.bashrc
# RUN #!/bin/bash \
#     source ~/.bashrc

# # 搭建theos开发环境
# RUN git config --global http.proxy ${PROXY}
# RUN git config --global https.proxy ${PROXY}
# RUN cd /opt/ && git clone --recursive https://github.com/theos/theos.git
# RUN git config --global --unset http.proxy
# RUN git config --global --unset https.proxy

# # RUN mkdir -p /opt/theos/toolchain/linux/
# # COPY toolchain.tar.lzma /opt/theos/toolchain/linux/
# # RUN tar xf /opt/theos/toolchain/linux/toolchain.tar.lzma -C /opt/theos/toolchain/linux/
# # RUN mv /opt/theos/toolchain/linux/ios-arm64e-clang-toolchain /opt/theos/toolchain/linux/iphone
# # RUN rm /opt/theos/toolchain/linux/toolchain.tar.lzma
# # COPY sdk.zip /opt/theos/sdks/
# # RUN cd /opt/theos/sdks/ && unzip sdk.zip && rm sdk.zip

# RUN mkdir -p /opt/theos/toolchain/linux/
# COPY theos-ollvm-toolchain.tar.gz /opt/theos/toolchain/linux/
# RUN cd /opt/theos/toolchain/linux/ && tar zxvf theos-ollvm-toolchain.tar.gz
# RUN rm /opt/theos/toolchain/linux/theos-ollvm-toolchain.tar.gz
# COPY sdk.zip /opt/theos/sdks/
# RUN cd /opt/theos/sdks/ && unzip sdk.zip && rm sdk.zip

# RUN apt-get install -y libncurses5
# RUN apt-get install -y libstdc++6

# # 添加obfuscator-llvm混淆环境
# # RUN apt-get install -y cmake python3-dev ninja-build
# # RUN git config --global http.proxy http://192.168.0.189:7890
# # RUN git config --global https.proxy http://192.168.0.189:7890
# # RUN cd /home && git clone https://github.com/kk-laoguo/ollvm-13.git
# # RUN cd /home && git clone --recursive https://github.com/sbingner/llvm-project.git
# # RUN git config --global --unset http.proxy
# # RUN git config --global --unset https.proxy
# # RUN mkdir /usr/local/ollvm13
# # RUN cd /home/ollvm-13/llvm-project-13/ && mkdir build && cd build
 
# # RUN cmake -DCMAKE_BUILD_TYPE=Release -DLLVM_CREATE_XCODE_TOOLCHAIN=ON -DCMAKE_INSTALL_PREFIX=/usr/local/ollvm13 -DLLVM_ENABLE_PROJECTS="clang;lldb;ldid;tapi;libtapi;cctools-port" ../llvm
# # RUN cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/src/llvm -DLLVM_ENABLE_PROJECTS="clang;tapi;" -DLLVM_TARGETS_TO_BUILD="X86;AArch64;" ../llvm
# # RUN make -j8 && make install

# # apple
# # cd llvm-project
# # cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/src/llvm -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;" -DLLVM_USE_LINKER=gold -DLLVM_TARGETS_TO_BUILD="X86;AArch64;"
# # cmake -S llvm -B build -G Ninja -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/src/llvm -DLLVM_ENABLE_PROJECTS="clang;tapi;" -DLLVM_USE_LINKER=gold -DLLVM_TARGETS_TO_BUILD="X86;AArch64;"
# # cmake --build build
# # cmake --build .

# # 停用代理
# RUN export http_proxy=''
# RUN export https_proxy=''

# WORKDIR /home