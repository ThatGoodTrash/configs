#!/usr/bin/env bash

DIRNAME=$(dirname "$0")

# install sway and deps
sudo apt install -y \
    alacritty light sway swaybg swayidle swayimg waybar wofi fonts-font-awesome

# enable firefox tiling
echo "MOZ_ENABLE_WAYLAND=1" >> ${HOME}/.bash_profile

# ensure that ~/bin exists
mkdir -p ${HOME}/bin

# copy script to start sway into ~/bin
cp ${DIRNAME}/startw ${HOME}/bin/startw
chmod +x ${HOME}/bin/startw

# set bash_profile to execute sway on login

cat << 'EOF' >> ${HOME}/.bash_profile
# automatically login into sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  exec startw
fi
EOF
