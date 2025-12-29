#
# ~/.zprofile
#

if [[ -z $DISPLAY && $(tty) == /dev/tty1 ]]; then
  export XDG_SESSION_TYPE=wayland
  # exec-once /usr/lib/hyprpolkitagent/hyprpolkitagent
  exec start-hyprland
fi
