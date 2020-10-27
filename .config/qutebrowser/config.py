import sys
sys.path.insert(1, '/home/bracktus/.config/cols/')
import colours

c.scrolling.smooth = True
c.hints.leave_on_load = False

# Downloads
c.downloads.location.remember = True
c.downloads.remove_finished = 5000
c.downloads.location.directory = "~/down"
c.downloads.location.prompt = False

# Bindings
config.bind('d', 'repeat 3 scroll down')
config.bind('D', "nop")
config.bind('u', 'repeat 3 scroll up')
config.bind('x', 'tab-close')
config.bind('X', 'undo')
config.bind('<Alt+Tab>', 'tab-next')
config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')
config.bind('yt', 'tab-clone')
config.bind('.', 'set-cmd-text :open {url:pretty}')
config.bind('gw', 'tab-give')
config.bind('gW', 'tab-give 0 ;; close')
config.bind(',m', 'hint links spawn -d mpv --force-window=immediate {hint-url}')
config.bind(',d', 'hint links spawn youtube-dl -o ~/vids/%(title)s.%(ext)s -i --all-subs {hint-url} ') 
config.bind('yl', 'hint links yank')

#Appearance Misc
c.statusbar.widgets = ["keypress", "url", "progress"]
c.fonts.default_family = "Fantasque Sans Mono"
c.fonts.default_size = "13pt"

#Text bar
c.colors.completion.category.bg = colours.color13
c.colors.completion.category.fg = colours.color0 

c.colors.completion.fg = colours.foreground
c.colors.completion.odd.bg = colours.color0
c.colors.completion.even.bg = colours.color0

c.colors.completion.item.selected.bg = colours.color11
c.colors.completion.item.selected.border.bottom = colours.color11 
c.colors.completion.item.selected.border.top = colours.color11

c.colors.completion.match.fg = colours.color9

#Hints
c.colors.keyhint.bg = colours.color13
c.colors.keyhint.fg = colours.color0
c.colors.keyhint.suffix.fg = colours.color0

c.colors.hints.bg = colours.color13
c.colors.hints.fg = colours.color0
c.hints.border = "1px solid " + colours.color13

#Statusbar
c.colors.statusbar.normal.bg = colours.color13
c.colors.statusbar.normal.fg = colours.color0
c.colors.statusbar.command.bg = colours.color13
c.colors.statusbar.command.fg = colours.color0
c.colors.statusbar.caret.bg = colours.color8
c.colors.statusbar.caret.fg = colours.color0
c.colors.statusbar.insert.bg = colours.color2
c.colors.statusbar.insert.fg = colours.color0
c.colors.statusbar.passthrough.bg = colours.color12
c.colors.statusbar.passthrough.fg = colours.color0
c.colors.statusbar.url.fg = colours.color0
c.colors.statusbar.url.hover.fg = colours.color0
c.colors.statusbar.url.success.http.fg = colours.color0
c.colors.statusbar.url.success.https.fg = colours.color0
c.colors.statusbar.url.warn.fg = colours.color0

c.colors.messages.error.bg = colours.color9
c.colors.messages.error.border = colours.color9
c.colors.messages.info.bg = colours.color10
c.colors.messages.info.border = colours.color10
c.colors.messages.warning.bg = colours.color3
c.colors.messages.warning.border = colours.color3

#Tabs
c.colors.tabs.bar.bg = colours.color12
c.colors.tabs.even.bg = colours.color12
c.colors.tabs.odd.bg = colours.color12
c.colors.tabs.even.fg = colours.color0
c.colors.tabs.odd.fg = colours.color0

c.colors.tabs.selected.even.bg = colours.color13
c.colors.tabs.selected.even.fg = colours.color0
c.colors.tabs.selected.odd.bg = colours.color13
c.colors.tabs.selected.odd.fg = colours.color0

c.colors.prompts.bg = colours.color14
c.colors.prompts.border = colours.color14


