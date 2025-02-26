#!/bin/bash

options=("Oturumu Kapat" "Bilgisayarı Kapat" "Yeniden Başlat" "İptal")

choice=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Güç Menüsü:")

case "$choice" in
    "Oturumu Kapat")
        hyprlock && hyprctl dispatch exit
        ;;
    "Bilgisayarı Kapat")
        hyprlock && systemctl poweroff
        ;;
    "Yeniden Başlat")
        hyprlock && reboot
        ;;
    "İptal")
        exit 0
        ;;
esac
