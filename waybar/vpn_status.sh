#!/bin/bash

STATUS=$(mullvad status)

if echo "$STATUS" | grep -q "^Connected"; then
  ICON="󰌾"  # Locked/Secure icon
  COUNTRY=$(echo "$STATUS" | grep -m1 "Visible location" \
    | sed -E 's/.*location:[[:space:]]*//; s/[,.].*//')
  TOOLTIP="Connected - $COUNTRY"
  CLASS="connected"
else
  ICON="󰿆"  # Unlocked/Insecure icon
  TOOLTIP="Disconnected"
  CLASS="disconnected"
fi

printf '{"text": "%s", "tooltip": "%s", "class": "%s"}\n' "$ICON" "$TOOLTIP" "$CLASS"

exit 0
