#!/bin/bash
set -e;

if ! pgrep firefox >/dev/null; then echo "Launching firefox" && swaymsg "exec /usr/bin/firefox"; fi
#if ! pgrep spotify >/dev/null; then echo "Launching spotify" && swaymsg "exec spotify-launcher"; fi
if ! pgrep gammastep >/dev/null; then echo "Launching gammastep" && swaymsg "exec /usr/bin/gammastep"; fi
