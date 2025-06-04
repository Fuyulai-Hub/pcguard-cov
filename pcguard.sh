#!/bin/bash
set -euxo pipefail
rm -f /etc/apt/sources.list.d/mono-official-stable.list
# 安装基础依赖
apt-get update 
apt-get upgrade -y
apt-get install -y unzip build-essential 
apt-get install -y llvm llvm-dev clang 

cd /root
# 克隆并构建 pcguard-cov
git clone https://gitee.com/fyulai/pcguard-cov.git
cd /root/pcguard-cov
unzip -o pcguard-cov.zip
make
# 构建 llvm_mode
cd /root/pcguard-cov/llvm_mode/
AFL_TRACE_PC=1 make