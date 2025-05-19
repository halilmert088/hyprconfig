#!/bin/bash

INTERFACE_CONFIG="/etc/wireguard/it-mil-wg-003.conf"
INTERFACE_NAME="it-mil-wg-003"

is_connected() {
  ip addr show "$INTERFACE_NAME" &>/dev/null
  return $?
}

if is_connected; then
  sudo wg-quick down "$INTERFACE_NAME"
  if [ $? -eq 0 ]; then
    notify-send -i "network-vpn" "WireGuard" "Disconnected from $INTERFACE_NAME"
  else
    notify-send -u critical -i "network-vpn" "WireGuard" "Failed to disconnect from $INTERFACE_NAME"
  fi
else
  sudo wg-quick up "$INTERFACE_CONFIG"
  if [ $? -eq 0 ]; then
    notify-send -i "network-vpn" "WireGuard" "Connected to $INTERFACE_NAME"
  else
    notify-send -u critical -i "network-vpn" "WireGuard" "Failed to connect to $INTERFACE_NAME"
  fi
fi

exit 0
