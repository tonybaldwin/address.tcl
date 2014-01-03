address.tcl
-------------
a simple address book written in tcl/tk
by tony baldwin | http://wiki.tonybaldwin.info
released according to the the GPL v.3 or later

This program is cross-platform, and has been tested on 
Windows 7 and Debian 7.

This program requires Tcl8.5 or newer.
Linux folks can simply install tcl with their usual package manager.
Windows folks, go to 
http://www.activestate.com/activetcl
to download and install Tcl.

Install and Use
-----------------
Linux folks, stick the address.tcl in your path.
Windows folks, probably just make a desktop shortcut to the file.
If you have installed ActiveTcl, Windows should know what to do with it.

Make sure you properly set the address file directory.
Edit line 14 to do so.
For Windows users, if you simply make a Folder in your My Documents
folder called "addresses", you're all set.
Linux folks are probably smart enough to figure this out,
but make a directory somewhere, maybe ~/.addresses, or something, and change line 14 of address.tcl to reflect that directory.

Eventually I'll make a proper config for this thing so when you install it,
it writes a config file and uses that to set the directory.

The program should be fairly self-explanatory.
At the moment, it's very basic.
You can enter and save address information for your contacts.
You can search through the addresses.
If you open an existing address, change the name, and save it,
you will now have a new file, with the new name, and the old file will still exist. Sometimes that can be handy (someone gets married, and having a file under their maiden name is still useful), but sometimes it just means extra files and possible confusion.

But, hey, what do you want? I wasted about 4 hours so far, one afternoon, snowed in, to whip up this very, very simple, but useful little program, and I'm giving it away for Free (as in price = $0.00 AND as in Freedom),
so, you can't really complain...

Hack it up, make it better, have a go, if you think it needs improvement.
It's GPL code.

I wrote it, because the little bash script program I wrote to manage my addresses on my Debian box won't work on a Windows box (http://tonyb.us/myaddy ), and I needed something very quick, simple, light, to manage some basic address information, and didn't want to use the address book of a mail client or some other unwieldy nonsense, nor have I the skill to make something of this nature in perl, or something, that would work in the CLI like my bash script thingy, and, besides, the Windows cmd.exe is about as useless as bicycle with a square wheels.


