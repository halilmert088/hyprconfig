#!/bin/bash

MAX_LENGTH=20
INTERVAL=0.2 # Kaydırma hızı (saniye)
WAIT_TIME=1 # Döngü sonunda bekleme süresi (saniye)

while true; do
  music_info=$(playerctl --player=spotify metadata --format '{{ artist }} - {{ title }}' 2>/dev/null)
  music_length=${#music_info}

  if [[ $music_length -gt $MAX_LENGTH ]]; then
    for ((i=0; i<$music_length-$MAX_LENGTH+1; i++)); do
      echo "${music_info:$i:$MAX_LENGTH}"
      sleep $INTERVAL
    done
    sleep $WAIT_TIME # Kaydırma bittikten sonra bekle
  else
    echo "$music_info"
    sleep 1 # Kısa şarkılar için bekleme
  fi
done
