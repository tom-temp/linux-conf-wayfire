#!/bin/bash

export WLR_NO_HARDWARE_CURSORS=1
# export LIBGL_ALWAYS_SOFTWARE=1
export QT_QPA_PLATFORM=wayland-egl  # Qt5-based
export ELM_DISPLAY=wl               # EFL-based
export SDL_VIDEODRIVER=wayland      # SDL-based
export GDK_BACKEND=wayland          # GDK-based
export CLUTTER_BACKEND=wayland      # Clutter
export MOZ_ENABLE_WAYLAND=1         # Wayland firefox

export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=wayfire
export XDG_CURRENT_DESKTOP=wayfire

# export XCURSOR_PATH=/usr/share/icons:~/.local/share/icons

dbus-launch --exit-with-session wayfire -c ~/.config/wayfire.ini >> ~/.config/wayfire.log 2>&1