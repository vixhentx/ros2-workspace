# ROS2 in Docker
把ros-humble-desktop-full打包成了一个带工作区的Docker镜像

会把当前目录下的ros2_ws挂载到根目录,并自动执行init.sh

## 编译镜像
```shell
bash build.sh
```
## 快速部署
```shell
bash d.sh
```

## 使用方法
确保已经桥接好了x11
```shell
xhost +local:docker
```
创建工作区
```shell
mkdir ros2_ws
touch ros2_ws/init.sh
echo sleep infinity >> init.sh
```
后台运行镜像
```shell
docker-compose up -d
```

进入容器终端
```shell
#查看容器
docker ps | grep ros2
#进入容器
docker exec -it 容器名称 bash
```

## Credits
[Hands On Workshop TurtleBot 3 Simulation in Gazebo](https://github.com/mateus-mos/Hands-On-Workshop-TurtleBot-3-Simulation-in-Gazebo)