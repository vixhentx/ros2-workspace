#!/bin/bash
# 卸载 rosup

set -euo pipefail

INSTALL_DIR="$HOME/.rosup"
XPROFILE_FILE="$HOME/.xprofile"
BASHRC_FILE="$HOME/.bashrc"

rm -rf "$INSTALL_DIR"

#xhost
AUTOLOGIN_DIR=~/.config/autostart
AUTOLOGIN_FILE=$AUTOLOGIN_DIR/docker-xhost.desktop
rm -f $AUTOLOGIN_FILE

#rosup
if [ -f "$BASHRC_FILE" ]; then
  sed -i "/alias rosup=/d" "$BASHRC_FILE"
fi

set -euo pipefail

echo "rosup 卸载成功!"
echo "要立即应用更改,请执行 . $BASHRC_FILE."
