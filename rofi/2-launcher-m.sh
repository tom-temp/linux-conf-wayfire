#!/bin/bash

pgrep -x rofi > /dev/null || rofi -show drun -show-icons -icon-theme "Papirus" -theme ~/.config/rofi/2-launcher-m.rasi
