#!/bin/bash

# Dbus fix
if [ -z "$DBUS_SESSION_BUS_ADDRESS" ]; then
    eval "$(dbus-launch --sh-syntax --exit-with-session)"
fi

# {{{ Resource and keymap settings
usermodmap="${HOME}/.Xmodmap"
userresources="${HOME}/.Xresources"
sysmodmap="/etc/X11/xinit/.Xmodmap"
sysresources="/etc/X11/xinit/.Xresources"

# Merge system and user resources and keymaps
[[ -r "${sysresources}" ]]  && xrdb -merge "${sysresources}"
[[ -r "${sysmodmap}" ]]     && xmodmap "${sysmodmap}"
[[ -r "${userresources}" ]] && xrdb -merge "${userresources}"
[[ -r "${usermodmap}" ]]    && xmodmap "${usermodmap}"
# }}}

# configure obmenu user
#sed -i 's/seal/'$(whoami)'/' ~/.config/obmenu-generator/schema.pl \
                             ~/.config/obmenu-generator/config.pl

# Change color temp to help eyes
redshift -O 3500K &

# X Composite manager - uncomment for shadows and transparency
#compton --config "$HOME/.config/compton.conf -b

# Generate window manager's menu
# FIND A BETTER PLACE
awemenugen &
xdg_menu --format awesome --root-menu /etc/xdg/menus/arch-applications.menu >~/.config/awesome/archmenu.lua &

# Launches window manager
exec awesome
# End of script
