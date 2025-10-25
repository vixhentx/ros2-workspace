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
cp -r $INSTALL_PATH/deploy/* $DIR

# 5. 允许 X11 连接
echo "允许本地 X11 连接 (xhost)..."
xhost +local:docker

# 6. 进入新目录并启动容器
echo "正在启动容器..."
cd $DIR
if [ "$(docker ps -a -q -f name=ros2-dev)" ]; then
    echo "正在停止并删除现有的 'ros2-dev' 容器..."
    docker stop ros2-dev
    docker rm ros2-dev
fi
docker-compose up -d
set -e

echo "   成功! 您的 ROS 2 开发环境已启动并正在运行。"
echo "   容器名称: ros2-dev"
echo "   进入容器: docker exec -it ros2-dev bash"
echo "   停止容器: cd $DIR && docker-compose down"