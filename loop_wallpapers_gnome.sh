#!/bin/bash
gnome_wallpaper() {
  path=$1
  gsettings set org.gnome.desktop.background \
    picture-uri $path
}

xfce_wallpaper() {
  path=$1
  # Pending
}

loop_wallpapers() {
  local IMAGES_PATH="/home/$USER/Imagens/Wallpapers"
  local IMAGES=$(ls $IMAGES_PATH)
  local INTERVAL=3 # seconds

  while; do
    for IMAGE in $(echo $IMAGES); do
      gnome_wallpaper "$IMAGES_PATH/$IMAGE"
      sleep $INTERVAL
    done
  done
}
# Testar desktop environment depois e trocar nome da função
# wmctrl -m | grep "Name:" | awk '{print $2}'
# echo $XDG_CURRENT_DESKTOP
# xfconf-query \
# 	--channel xfce4-desktop \
# 	--property /backdrop/screen0/monitor0/image-path \
# 	--set $IMAGE_PATH/$image

# deixar interval ser passado por parametros 