#!/bin/bash

STATUS=$(playerctl --player=spotify status 2>/dev/null) # playerctl durumunu al, hataları gizle
EXIT_CODE=$? # playerctl komutunun çıkış kodunu kaydet

# Eğer playerctl komutu başarısız olursa veya boş çıktı verirse varsayılan ikonu göster
if [ $EXIT_CODE -ne 0 ] || [ -z "$STATUS" ]; then
    echo "" # Varsayılan/Medya oynatıcı yok ikonu
    exit 0
fi

case "$STATUS" in
    "Playing")
        echo "󰻂" # Play ikonu
        ;;
    "Paused")
        echo "" # Pause ikonu
        ;;
    "Stopped")
        echo "" # Stop ikonu
        ;;
    *) # Bilinmeyen veya beklenmeyen durumlar için
        echo "" # Varsayılan ikonu
        ;;
esac

exit 0
