#!/bin/sh

# Credit to the following for comming up with this:
# https://code.krister.ee/lock-screen-in-sway/
# To Do: The fancier screen lock mentioned on that page might be cool to try.

# Times the screen off and puts it to background
swayidle \
    timeout 600 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &

# Locks the screen immediately
swaylock \
	--ignore-empty-password \
	--daemonize \
	--indicator-caps-lock \
#	--indicator \
#	--clock \
#	--timestr " %Hh %Mm %Ss"\
#	--datestr " %b-%d-%Y" \
#	--show-failed-attempts \
#	--indicator-idle-visible

# Kills last background task so idle timer doesn't keep running
kill %%
