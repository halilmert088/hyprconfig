#!/bin/bash

INTERFACE="it-mil-wg-003"

is_connected() {
  ip addr show "$INTERFACE" &>/dev/null
  return $?
}

if is_connected; then
  echo ""
else
  echo "󰿆"
fi

exit 0
