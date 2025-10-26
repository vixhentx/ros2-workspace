FROM ros2_workspace:latest

WORKDIR /home/vscode/ros2_ws

#写入初始化配置
RUN echo "source /home/vscode/ros2_ws/init.sh" >> /home/vscode/.bashrc

#保持容器运行
ENTRYPOINT [ "tini", "--" ] 
CMD sleep infinity & wait $!