#!/bin/bash

# 启动 SSH 服务
echo "启动 SSH 服务..."
service ssh start

# 初始化 ROS2 工作空间
echo "初始化 ROS2 工作空间..."
if [ ! -f /home/vscode/ros2_ws/src/COLCON_IGNORE ]; then
    cd /home/vscode/ros2_ws
    source /opt/ros/humble/setup.bash
    colcon build
fi

# 启动 Code Server（可选）
echo "启动 Code Server..."
sudo -u vscode code-server \
    --auth password \
    --bind-addr 0.0.0.0:8080 \
    --disable-telemetry \
    /home/vscode/ros2_ws &

# 输出连接信息
echo "========================================"
echo "ROS2 开发环境已启动"
echo "SSH 连接: ssh -p 2222 vscode@localhost"
echo "Web IDE: http://localhost:8080"
echo "工作目录: /home/vscode/ros2_ws"
echo "========================================"

# 保持容器运行
tail -f /dev/null