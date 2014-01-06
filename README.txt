address.tcl
-------------
a simple address book written in tcl/tk
by tony baldwin | http://wiki.tonybaldwin.info
released according to the the GPL v.3 or later
http://wiki.tonybaldwin.info/doku.php?id=hax:addresstcl
or http://tonyb.us/addresstcl (shorturl to above wiki page).

This program is cross-platform, and has been tested on 
Windows 7 and Debian 7.

Dependencies
-----------------
This program requires Tcl8.5 or newer.
Linux folks can simply install tcl with their usual package manager.
Windows folks, go to 
http://www.activestate.com/activetcl
to download and install Tcl.

Install and Use
-----------------

* GNU/Linux

Make sure you have Tcl8.5 or newer installed 
(user you distro's package manager, whether aptitude, yum, pacman, whatever).
Run the install.sh script from your terminal.
It will install address.tcl in ~/bin/address.tcl, give it execute permissions, 
create the address directory, and write the config file. No worries.

* Windows

Make sure you have Tcl installed.
Get it from http://www.activestate.com/activetcl
Copy the sample config file to C:\Users\YourName\.addresstcl.conf
and edit it accordingly (as instructed in the file).
Create the folder C:\Users\YourName\Documents\Addresses\
Now you can simply click on the address.tcl, and it should run.
You may make a desktop shortcut to it, etc.

* Mac

I think you folks can use the install.sh, but I don't know.
I haven't played with a Mac in a long time.
Also, of course, make sure you have Tcl installed.
I believe you can get it for Mac at
http://www.activestate.com/activetcl

Use
--------------
The program should be fairly self-explanatory.
You enter contact information and save it.
You can search that information.
Make use of tags and notes to make the search more useful.
The F7 "Website" option opens a contact's website in your browser,
IF this variable is set (clearly).
At the moment, it's very basic.
You can enter and save address information for your contacts.
You can search through the addresses.
Tags and notes are useful for adding extra information to facilitate searches.
If you open an existing address, change the name, and save it, 
you will now have a new file, with the new name, and the old file will still exist.
Likewise, when you "Save As", the old file still exists.
Sometimes that can be handy (someone gets married, 
and having a file under their maiden name is still useful, or
you have a file for Mom saved with her name, but also saved as "Mom.address")
but sometimes it just means extra files and possible confusion.

Think you can do better?
Hack it up, have a go, if you think it needs improvement.
It's GPL code.
Of course, there are already a million different address/contact management
programs out there, most of which are either very simple, like this,
or more "fully featured" (i.e. complex and bloated).
This one suits me, which is why I wrote it.
If you like it, too, great!

It's MEANT to be very basic and simple.
I didn't want to use the address book of a mail client or some other unwieldy nonsense, 
like a spreadsheet, or something.

tony | http://www.tonybaldwin.info
