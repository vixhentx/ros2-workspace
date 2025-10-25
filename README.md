# ROS2 in Docker
把ros-humble-desktop-full打包成了一个带工作区的Docker镜像,便于使用Dev Container开发:
- 启动时自动运行工作区`ros2_ws`的`init.sh`便于初始化
- 可选安装一个简易的脚本工具`rosup`来快速生成工作区
- 预装工具: 最新版的rqt,gcc,clang,x11桥接器等等
- 预装vscode插件: C++, Python, ROS, Clang全家桶
- 默认启用ssh连接



## 使用方法
编译镜像
```bash
bash build-image.sh
```
安装`rosup`
```bash
bash install.sh
```
创建工作区(交互式创建)
```bash
rosup
```
或者通过参数创建
```bash
rosup my_workspace
```

## Credits
[Hands On Workshop TurtleBot 3 Simulation in Gazebo](https://github.com/mateus-mos/Hands-On-Workshop-TurtleBot-3-Simulation-in-Gazebo)