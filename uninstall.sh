#!/bin/bash
#用于卸载rosup
set -e
INSTALL_DIR=~/.rosup
rm -rf $INSTALL_DIR 
sed -i "/alias rosup=/d" ~/.bashrc
source ~/.bashrc
set -e
echo "卸载成功!"
echo $INSTALL_DIR