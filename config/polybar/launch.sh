#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

# Run on the desired monitor
if [[ $(xrandr -q | grep 'HDMI-1-1 connected' ) ]]; then
	polybar top_external -r >>/tmp/polybar1.log 2>&1 & disown
	polybar top -r >>/tmp/polybar1.log 2>&1 & disown
else
	polybar top -r >>/tmp/polybar1.log 2>&1 & disown
fi

echo "Bars launched..."
