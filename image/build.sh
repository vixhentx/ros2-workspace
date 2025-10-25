#代理根据实际情况设置成自己的
docker build --network host --build-arg HTTP_PROXY=$HTTP_PROXY --build-arg HTTPS_PROXY=$HTTPS_PROXY --build-arg NO_PROXY=$NO_PROXY -t ros2_workspace .