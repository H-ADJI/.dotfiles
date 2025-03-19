#!/bin/sh

case $1 in
    screen) grim - | wl-copy ;;
    region) grim -g "$(slurp)" - | wl-copy ;;
esac
