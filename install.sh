#!/bin/bash

# installation script for address.tcl

if [ != "$HOME/bin/" ]; then
        mkdir $HOME/bin/
        $PATH=$PATH:/$HOME/bin/
        export PATH
fi

daddir="$HOME/.addresstcl"
dbrowser="/usr/bin/firefox"

echo "Creating config files ..."
echo "# address.tcl config " > $HOME/.addresstcl.conf
read -p "Enter your username: " uname
read -p "Where do you wish to keep address files ? (default is ~/.addresstcl/ If you choose another directory, do not forget the trailing slash/.): " addir
read -p "What is your preferred web browser? (default /usr/bin/firefox): " browser
if [[ $addir != "" ]]; then
	echo "set addir \"$addir\"" >> ~/.addresstcl.conf
else
	echo "set addir \"$daddir\"" >> ~/.addresstcl.conf
fi

if [[ $browser != "" ]]; then
	echo "set browser $browser" >> ~/.addresstcl.conf
else
	echo "set browser $dbrowser" >> ~/.addresstcl.conf
fi

echo "Installing address.tcl"
cp address.tcl ~/bin/
chmod +x ~/bin/address.tcl

echo "Installation complete.
To run address.tcl, simply run \"address.tcl\" from CLI,
or make a menu entry or desktop icon to point to
/home/$uname/bin/address.tcl"

echo "If you require assistance, contact tony - http://wiki.tonybaldwin.info "
exit 0


