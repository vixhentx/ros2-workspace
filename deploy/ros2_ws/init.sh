#!/bin/bash
echo ROS2 Workspace OK!!
source /opt/ros/$ROS_DISTRO/setup.bash
#如果已经配好了工作区,可以换成以下源
#source install/setup.bash
export CC=clang
export CXX=clang++
#需要启动ssh就启用它
#sudo /usr/sbin/sshd

#维持容器运行
sleep infinity &
wait $!