#!/bin/sh

# Inicia picom se não estiver rodando
if ! pgrep -x "picom" > /dev/null; then
    picom --config ~/.config/picom/picom.conf &
fi

dwmblocks &

# Configuração de monitores
if xrandr | grep -q "HDMI-A-0 connected"; then
    # Dois monitores
    xrandr --output DisplayPort-0 --primary --mode 2560x1080 --pos 0x1080 \
           --output HDMI-A-0 --mode 1920x1080 --pos 320x0 --above DisplayPort-0
else
    # Apenas o principal
    xrandr --output DisplayPort-0 --primary --mode 2560x1080 --pos 0x0 \
           --output HDMI-A-0 --off
fi

# Diretório dos wallpapers
PIC_DIR="$HOME/Pictures/wallpapers"

# Loop infinito com troca automática de wallpaper
while true; do
    # Escolhe uma imagem aleatória
    PIC=$(find "$PIC_DIR" -type f | shuf -n1)

    # Detecta quantos monitores estão ativos
    HEADS=$(xrandr --query | grep " connected" | wc -l)

    if [ "$HEADS" -eq 2 ]; then
        # Define o mesmo wallpaper em ambos (ou pode escolher 2 diferentes se quiser)
        nitrogen --set-zoom-fill "$PIC" --head=0 --save
        nitrogen --set-zoom-fill "$PIC" --head=1 --save
    else
        # Apenas um monitor
        nitrogen --set-zoom-fill "$PIC" --head=0 --save
    fi

    # (~25 minutos)
    sleep 1500
done &

# xrandr --output DisplayPort-0 --primary --mode 2560x1080 --pos 0x1080 \
#     --output HDMI-A-0 --mode 1920x1080 --pos 320x0 --above DisplayPort-0
#
#
#
# PIC_DIR="$HOME/Pictures/wallpapers"
# while true; do
#     PIC=$(find "$PIC_DIR" -type f | shuf -n1)
#     # nitrogen --set-zoom-fill "$PIC"
#     nitrogen --set-scaled "$PIC"
#     sleep 1500  # troca a cada 2 horas
# done &

# Restaura wallpaper com Nitrogen
# if command -v nitrogen >/dev/null 2>&1; then
#     nitrogen --restore &
# fi

