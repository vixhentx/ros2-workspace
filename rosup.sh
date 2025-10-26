#!/bin/bash
#一个方便的小脚本,用于自动在当前目录生成工作区

set -e
INSTALL_PATH=~/.rosup
DIR=$1
if [[ ! -v 1 ]]; then 
   read -p "请输入要创建工作区的目录:" DIR
fi


# 4. 创建目录并复制部署文件
echo "正在创建工作区"
mkdir -p $DIR
# 复制 deploy 文件夹的内容
rsync -av $INSTALL_PATH/deploy/ $DIR

# 5. 允许 X11 连接
echo "允许本地 X11 连接 (xhost)..."
xhost +local:docker

# 6. 进入新目录并启动容器
echo "正在启动容器..."
cd $DIR
docker-compose up -d --build
set -e

echo "   成功! 开发环境已启动"