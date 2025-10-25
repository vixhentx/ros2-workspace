#!bin/bash
#用于安装rosup
set -e
INSTALL_DIR=~/.rosup
cp -r . $INSTALL_DIR 
chmod +x $INSTALL_DIR/rosup.sh
echo "alias 'rosup=bash $INSTALL_DIR/rosup.sh'" >> ~/.bashrc
source ~/.bashrc
set -e
echo "安装成功!"
echo $INSTALL_DIR