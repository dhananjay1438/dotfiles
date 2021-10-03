#! /bin/bash

# Terminate already running bar instances
killall -q polybar
#
## Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

if type "xrandr"; then
  # Launch mybar for each monitor
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload top &
  done
else
  # Launch mybar
  polybar top --reload &
fi

echo "Bars launched..."

###############################################

