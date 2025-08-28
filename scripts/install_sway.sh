#!/usr/bin/env bash

DIRNAME=$(dirname "$0")

install_sway() {
  # install sway and deps
  sudo apt install -y \
      alacritty light sway swaybg swayidle swayimg waybar swaylock wofi fonts-font-awesome git curl
}

set_startup_options() {
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

}

install_swaylock_effects() {
  # download and build swaylock-effects in temp-dir
  cd /tmp
  git clone https://github.com/mortie/swaylock-effects.git

  if [ ! -d /tmp/swaylock-effects  ]; then
    echo "Unable to clone swaylock-effects repo"
    return 1
  fi

  cd /tmp/swaylock-effects

  # install build deps
  sudo apt install meson cmake pkg-config wayland-protocols libxkbcommon-dev libcairo2-dev scdoc

  # build
  meson build
  ninja -C build

  # install
  sudo ninja -C build install

  # add SUID bit to swaylock binary
  sudo chmod a+s $(command -v swaylock)

}



# main actions

install_sway
set_startup_options

