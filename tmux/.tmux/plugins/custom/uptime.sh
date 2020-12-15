#! /bin/sh

# Script to display formated uptime in tmux status bar
# It was necessary because escaping characters in tmux is a pain in the ass

# TODO: make uptime printing dynamic
# Format: DD:HH:MM:SS
# awk '{printf("%d:%02d:%02d:%02d\n",($1/60/60/24),($1/60/60%24),($1/60%60),($1%60))}' /proc/uptime

# Format: XXh XXm
awk '{printf("%02dh %02dm\n",($1/60/60%24),($1/60%60))}' /proc/uptime
