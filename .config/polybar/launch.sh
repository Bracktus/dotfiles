# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar1.log 
polybar main >>/tmp/polybar1.log 2>&1 &
# Bar toggleFlag
echo "shown" | tee /tmp/bar_toggle
echo "Bars launched..."
