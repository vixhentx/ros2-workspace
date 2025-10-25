FROM osrf/ros:humble-desktop-full-jammy

ENV DEBIAN_FRONTEND=noninteractive
# 系统代理
ARG HTTP_PROXY
ARG HTTPS_PROXY
ARG NO_PROXY

ENV http_proxy=${HTTP_PROXY}
ENV https_proxy=${HTTPS_PROXY}
ENV no_proxy=${NO_PROXY}

# 阿里云Ubuntu镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

# 清华ROS镜像
RUN apt-get update && apt-get install -y curl gnupg2
RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] https://mirrors.tuna.tsinghua.edu.cn/ros2/ubuntu jammy main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

# 预装常用包
RUN apt-get update && apt-get install -y \ 
    lsb-release \ 
    wget \ 
    gnupg \
    git \
    x11-apps libxext-dev libxrender-dev libxtst-dev \
    neovim \
    htop nvtop \
    clang clangd clang-format \
    openssh-server \
    '~nros-humble-rqt*'

# 更新所有软件包
RUN apt full-upgrade -y

# 配置SSH
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config 
EXPOSE 22 
RUN apt install -y \
    rsync \
    inotify-tools
# 安装 Dev Container CLI 工具
RUN curl -fsSL https://raw.githubusercontent.com/devcontainers/cli/main/install.sh | sh

#开发用户
RUN useradd -m -s /bin/bash -G sudo vscode && \
    echo 'vscode ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    echo 'vscode:password' | chpasswd

# # 设置SSH自启脚本
# COPY entrypoint.sh /usr/local/bin/entrypoint.sh
# RUN chmod +x /usr/local/bin/entrypoint.sh
# ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# 清除apt缓存
RUN rm -rf /var/lib/apt/lists/*
# 清除代理
ENV http_proxy=
ENV https_proxy=
ENV no_proxy=


USER vscode
WORKDIR /home/vscode

# # # 默认命令, 保持容器运行, 方便dev-container和ssh连接
CMD ["sleep", "infinity"]
