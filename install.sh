#!/bin/bash
# rosup安装小脚本,可以自动配置rosup别名以及配置xhost
set -euo pipefail

INSTALL_DIR="$HOME/.rosup"
XPROFILE_FILE="$HOME/.xprofile"
BASHRC_FILE="$HOME/.bashrc"

rm -rf "$INSTALL_DIR"
cp -r . "$INSTALL_DIR"

chmod +x "$INSTALL_DIR/rosup.sh"

# xhost
AUTOLOGIN_DIR=~/.config/autostart
AUTOLOGIN_FILE=$AUTOLOGIN_DIR/docker-xhost.desktop

mkdir -p $AUTOLOGIN_DIR

cat > $AUTOLOGIN_FILE << EOL
[Desktop Entry]
Type=Application
Name=Docker Xhost Fix
Exec=sh -c "sleep 5 && xhost +local:docker"
Icon=utilities-terminal
Comment=Allow Docker containers to access the X server
EOL

chmod +x $AUTOLOGIN_FILE

#rosup alias
BASHRC_LINE="alias 'rosup=bash $INSTALL_DIR/rosup.sh'"
touch "$BASHRC_FILE"
if ! grep -qF -- "$BASHRC_LINE" "$BASHRC_FILE"; then
  echo "$BASHRC_LINE" >> "$BASHRC_FILE"
fi

set -euo pipefail

echo "rosup安装成功! 路径: $INSTALL_DIR"
echo "要立即应用更改,请执行 . $BASHRC_FILE."