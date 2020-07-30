TMP_FILE=/tmp/bar_toggle

is_shown(){
	if [ "$(cat $TMP_FILE)" == "shown" ]; then
		echo shown
		return 0
	else 
		echo hidden
		return 1
	fi
}

toggle_bar(){
	if is_shown; then
		hide_bar
	else
		show_bar
	fi
}

hide_bar(){
    polybar-msg cmd hide
    bspc config top_padding 0
    echo hidden > $TMP_FILE
}

show_bar(){
    polybar-msg cmd show
    bspc config top_padding 40
    echo shown > $TMP_FILE
}

case "$1" in
    show)
        show_bar;;
    hide)
        hide_bar;;
    toggle)
        toggle_bar;;
    is_shown)
        is_shown;;
    *)
        echo "Unknown option $1"
        echo "option_menu [show|hide|toggle|is_shown]"
esac
