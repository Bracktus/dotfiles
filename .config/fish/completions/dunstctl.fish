set -l commands action close close-all context history-pop is-paused set-paused debug help

complete -c dunstctl -f

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a action -d "Perform the default action, or open the context menu of the notification at the given position"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a close -d "Close the last notification"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a close-all -d "Close all the notifications"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a context -d "Open context menu"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a history-pop -d "Pop one notification from history"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a is-paused -d "Check if dunst is running or paused"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a set-paused -d "Set the pause status"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a debug -d "Print debugging information"

complete -c dunstctl -n "not __fish_seen_subcommand_from $commands" -a help -d "Show this help"

# set-paused
complete -c dunstctl -n "__fish_seen_subcommand_from set-paused" -a true
complete -c dunstctl -n "__fish_seen_subcommand_from set-paused" -a false
complete -c dunstctl -n "__fish_seen_subcommand_from set-paused" -a toggle
