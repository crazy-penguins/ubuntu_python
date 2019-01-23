#!/bin/bash
version=${1:-"3.6.7"}
apt-get -qq update
apt-get -qq install software-properties-common
apt-get -qq update
apt-get -qq install wget zip gcc g++ libsqlite3-dev libbz2-dev \
  libffi-dev make libreadline-dev libz3-dev libfreetype6-dev \
  libncurses5-dev libncursesw5-dev tk-dev libgdbm-dev \
  libxml2-dev libxslt1-dev libssl-dev libgdbm-compat-dev \
  libdb-dev python python-pip
pip install awscli
url="https://www.python.org/ftp/python/${version}/Python-${version}.tgz"
mkdir -p /u/downloads
filename="/u/downloads/python-${version}.tgz"
wget -q $url -O $filename
build_dir="/u/python-${version}"
mkdir -p ${build_dir} && pushd ${build_dir}
tar xzf $filename --strip-components=1
./configure --enable-optimizations >/dev/null
make >/dev/null
make altinstall >/dev/null
popd
