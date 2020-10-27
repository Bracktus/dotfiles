# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bar
echo "---" | tee -a /tmp/polybar1.log 
echo "---" | tee -a /tmp/polybar2.log 

# Bar toggleFlag
echo "shown" | tee /tmp/bar_toggle
polybar main >>/tmp/polybar1.log 2>&1 &
polybar secondary >>/tmp/polybar2.log 2>&1 &
echo "Bars launched..."
