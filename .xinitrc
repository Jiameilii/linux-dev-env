#! /bin/sh
#Copy fron pright/xinitrc

# xinitrc.d
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Xresources
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# xprofile
[[ -f /etc/xprofile ]] && source /etc/xprofile
[[ -f ~/.xprofile ]] && source ~/.xprofile

# stumpwm
exec /usr/local/bin/stumpwm

exit
#Copy from pschmitt/xinit-config
############
#  SYSTEM  #
############
stalonetray &
spacefm -d &
(
    urxvtd -q -o -f
    # TODO: Use a systemd service instead
    xrdb -merge $HOME/.config/Xresources/Xresources
    urxvtc -name "tmux" -e $SHELL -c "tmux -2u attach"
) &
nitrogen --restore &
