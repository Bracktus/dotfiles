#!/usr/bin/env python3

#API reference for when you need it 👍
#https://lazka.github.io/pgi-docs/index.html

import gi

gi.require_version('Playerctl', '2.0')
from gi.repository import Playerctl, GLib, GdkPixbuf

gi.require_version('Notify', '0.7')
from gi.repository import Notify

import requests
from urllib.parse import urlparse

player = Playerctl.Player()
manager = Playerctl.PlayerManager()
Notify.init("Now Playing")

def on_metadata(player, metadata, manager):
    if lastTrackID != metadata["mpris:trackid"]:
        #Only trigger on new song
        notify(player)

def notify(player):
        #Getting info (and pic if it exists) and displaying the notification
        global lastTrackID
        metadata = player.props.metadata
        
        if 'xesam:artist' in metadata.keys() and 'xesam:title' in metadata.keys():
            artist = metadata['xesam:artist'][0]
            title = metadata['xesam:title']
            
            message = Notify.Notification.new(artist, title)
            message.set_timeout(3500)
            if 'mpris:artUrl' in metadata.keys():
                cover = getImg(lastTrackID, metadata)
                if cover != "": 
                    message.set_image_from_pixbuf(cover)
        
            lastTrackID = metadata["mpris:trackid"]
            message.show()

def getImg(lastTrackID, metadata):
    #Returns the image from internet or local files
    imageDir = "/home/bracktus/.local/share/icons/cover.jpeg"
    if lastTrackID == metadata["mpris:trackid"]:
        image = GdkPixbuf.Pixbuf.new_from_file(imageDir)
        return image
        # return the image that was already set
    else:
        result = urlparse(metadata["mpris:artUrl"])
        if result.scheme in ("https", "http"):
            imageUrl = metadata["mpris:artUrl"]
            imageFile = requests.get(imageUrl).content
            
            with open(imageDir, "wb") as writer:
                    writer.write(imageFile)
            
            image = GdkPixbuf.Pixbuf.new_from_file(imageDir)
            return image
        elif result.scheme == "file":
            url = result.path.replace("%20", " ")
            image = GdkPixbuf.Pixbuf.new_from_file(url)
            return image
        else:
            return ""

def init_player(name):
    #Connecting up the signals and the functions when a player appears
    player = Playerctl.Player.new_from_name(name)
    player.connect('metadata', on_metadata, manager)
    manager.manage_player(player)

def on_name_appeared(manager, name):
    init_player(name)

lastTrackID = None
manager.connect('name-appeared', on_name_appeared)

for name in manager.props.player_names:
    init_player(name)

# wait for events
main = GLib.MainLoop()
main.run()
