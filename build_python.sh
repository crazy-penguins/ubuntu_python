#!/bin/bash
version=${1:-"3.6.7"}
apt-get -qq update
apt-get -qq install software-properties-common
apt-get -qq update
apt-get -qq install wget zip gcc g++ libsqlite3-dev libbz2-dev \
  libffi-dev make libreadline-dev libz3-dev libfreetype6-dev \
  libncurses5-dev libncursesw5-dev tk-dev libgdbm-dev \
  libxml2-dev libxslt1-dev # libexpat1-dev  liblzma-dev
apt-get -qq install python python-pip
pip -q install awscli
url="https://www.python.org/ftp/python/${version}/Python-${version}.tgz"
filename="python-${version}.tgz"
wget -q $url -O $filename
tar xzf $filename --strip-components=1
rm $filename
./configure --enable-optimizations
make
