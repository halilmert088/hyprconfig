#!/bin/bash

options=("Oturumu Kapat" "Bilgisayarı Kapat" "İptal")

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Güç Menüsü:")

case "$choice" in
    "Oturumu Kapat")
        hyprlock && swaymsg exit
        ;;
    "Bilgisayarı Kapat")
        hyprlock && systemctl poweroff
        ;;
    "İptal")
        exit 0
        ;;
esac
