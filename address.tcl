#!/usr/bin/wish8.5

# a simple address book tool
# written in tcl/tk by tony baldwin
# released according to the terms of the
# GNU Public License, v.3 or later


package require fileutil
package require Tk
package require Ttk

uplevel #0 [list source ~/.addresstcl.conf]

cd $addir 

global filename
global addir
global lname
global fname
global company
global cell
global homephone
global ophone
global email
global email2
global website
global street
global street
global city
global state
global zcode
global country
global tags
global note
global novar
global sterm
global filetypes
global allvars
global browser
global bday
global addir

set allvars [list filename lname fname company cell homephone ophone email email2 website street city state zcode country bday tags note novar]

set filename ""
set lname ""
set fname ""
set company ""
set cell ""
set homephone ""
set ophone ""
set email ""
set email2 ""
set website ""
set street ""
set city ""
set state ""
set country ""
set tags ""
set note ""
set bday ""
set novar "EOF"
set sterm ""

bind . <Escape> {exit}
bind . <Control-s> {saveadd}
bind . <Control-x> {saveads}
bind . <Control-o> {openfile}
bind . <Control-w> {clear}
bind . <Control-q> {exit}
bind . <F1> {help}
bind . <F2> {seek}
bind . <F3> {listadds}
bind . <F7> {vieweb}


cd $addir

set file_types {
{"All Files" * }
{"Address" {.address}}
}

wm title . "Tcl Address Book"

frame .menu -relief raised

ttk::menubutton .menu.file -text "File Menu" -menu .menu.file.menu 
ttk::button .menu.list -text "List" -command {listadds}
ttk::button .menu.seek -text "Search" -command {seek}
ttk::button .menu.help -text "Help" -command {help}

menu .menu.file.menu -tearoff 0
.menu.file.menu add command -label "Open" -command {openfile} -accelerator Ctrl+o
.menu.file.menu add command -label  "Save" -command {saveadd} -accelerator Ctrl+s
.menu.file.menu  add command -label "SaveAs" -command {saveads} -accelerator Ctrl-x
.menu.file.menu add command -label "Close" -command {clear} -accelerator Ctrl+w
.menu.file.menu add separator
.menu.file.menu add command -label "Website" -command {vieweb} -accelerator F7
.menu.file.menu add command -label "List" -command {listadds} -accelerator F3
.menu.file.menu add command -label "Search" -command {seek} -accelerator F2
.menu.file.menu add command -label "Help" -command {help} -accelerator F1
.menu.file.menu add command -label "Quit" -command {exit} -accelerator Esc

pack .menu.file -in .menu -side left
pack .menu.help -in .menu -side right
# pack .menu.seek -in .menu -side right
# pack .menu.list -in .menu -side right
pack .menu -in . -fill x

frame .address
grid [ttk::label .address.fname -text "First Name: "]\
[ttk::entry .address.fn -width 50 -textvar fname]
	
grid [ttk::label .address.lname -text "Last Name: "]\
[ttk::entry .address.ln -width 50 -textvar lname]
	
grid [ttk::label .address.co -text "Company: "]\
[ttk::entry .address.cmpny -width 50 -textvar company]

grid [ttk::label .address.mobile -text "Cell Phone: "]\
[ttk::entry .address.mobi -width 50 -textvar cell]

grid [ttk::label .address.hph -text "Home Phone: "]\
[ttk::entry .address.homeph -width 50 -textvar homephone]
	     
grid [ttk::label .address.0ph -text "Other Phone: "]\
[ttk::entry .address.oph -width 50 -textvar ophone]

grid [ttk::label .address.eml -text "E-mail: "]\
[ttk::entry .address.email -width 50 -textvar email]
	     
grid [ttk::label .address.eml2 -text "E-mail 2: "]\
[ttk::entry .address.email2 -width 50 -textvar email2]	

grid [ttk::label .address.ws -text "Website: "]\
[ttk::entry .address.web -width 50 -textvar website]

grid [ttk::label .address.street -text "Street: "]\
[ttk::entry .address.st -width 50 -textvar street]
	
grid [ttk::label .address.city -text "City: "]\
[ttk::entry .address.cty -width 50 -textvar city]
	
grid [ttk::label .address.state -text "State: "]\
[ttk::entry .address.st8 -width 50 -textvar state]
	
grid [ttk::label .address.zip -text "Zip Code: "]\
[ttk::entry .address.zcode -width 50 -textvar zcode]
	
grid [ttk::label .address.country -text "Country: "]\
[ttk::entry .address.cntry -width 50 -textvar country]

grid [ttk::label .address.dob -text "Birthday: "]\
[ttk::entry .address.bday -width 50 -textvar bday]
	
grid [ttk::label .address.tags -text "Tags: "]\
[ttk::entry .address.tgz -width 50 -textvar tags]

pack .address -in .

frame .note
tk::label .note.label -text "Notes: "
text .note.text -width 59 -height 10 -wrap word -yscrollcommand ".note.scroll set"
scrollbar .note.scroll -command ".note.text yview"
set note [.note.text get 1.0 {end -1c}]
pack .note -in . 
pack .note.label -in .note -side left
pack .note.text -in .note -side left -fill both
pack .note.scroll -in .note -side left -fill y
	
proc listadds {} {
	toplevel .list
	wm title .list "Address List"
	bind .list <Escape> {destroy .list}
	frame .list.t
	text .list.t.l -width 30 -height 20 -wrap word -yscrollcommand ".list.t.ys set"
	scrollbar .list.t.ys -command ".list.t.l yview" 
   
	pack .list.t.l -in .list.t -side left -fill both
	pack .list.t.ys -in .list.t  -side left -fill y

	.list.t.l insert end "ADDRESS FILE LIST\n\n"
	set list [glob -tails -type f -directory $::addir *.address]
	foreach i $list {.list.t.l insert end $i\n}

	frame .list.b
	grid [ttk::button .list.b.b -text "Close List" -command {destroy .list}]

	pack .list.t -in .list
	pack .list.b -in .list
}

proc clear {} {
		foreach var $::allvars {global $var}
		foreach var $::allvars {set $var " "}
		wm title . "Address Book"
		set ::filename " "
		.note.text delete 1.0 end 
	}
	
proc saveadd {} {
	set novar "EOF"
	set ::note [.note.text get 1.0 {end -1c}]
	set filename "$::lname.$::fname.address"
	set fileid [open $filename w]
	foreach var $::allvars {puts $fileid [list set $var [set ::$var]]}
	wm title . "Now Tickling: $::filename"
	close $fileid
}

proc saveads {} { 
	set filename [tk_getSaveFile -filetypes $::file_types -initialdir $::addir]
	set novar "EOF"
	set ::note [.note.text get 1.0 {end -1c}]
	set fileid [open $filename w]
	foreach var $::allvars {puts $fileid [list set $var [set ::$var]]}
	wm title . "Now Tickling: $filename"
	close $fileid
}

proc openfile {} {
	     set file_types {
	     {"address file" {.address}}
	     }
	     set addressfile [tk_getOpenFile -filetypes $file_types -initialdir $::addir]
	     uplevel #0 [list source $addressfile]
	     .note.text insert end "$::note"
	     wm title . "Now Tickling: $addressfile"
}


proc seek {} {
	global sterm
	toplevel .seek
	wm title .seek "Search"
	bind .seek <Escape> {destroy .seek}
	frame .seek.s
	grid [ttk::label .seek.s.term -text "Enter search term: "]\
	[ttk::entry .seek.s.this -textvar sterm]\
	[ttk::button .seek.s.go -text "Go" -command {
		destroy .seek.results
		frame .seek.results
		frame .seek.results.t
		text .seek.results.t.list -width 64 -height 5  -wrap word  -yscrollcommand ".seek.results.t.s set"
		scrollbar .seek.results.t.s -command ".seek.results.t.list yview"
		set list [glob -tails -type f -directory $::addir *.address]
		set myList [::fileutil::grep (?i)$sterm $list]
		regsub -all {\{} $myList "" alist
		regsub -all {\}} $alist "\n" blist
		regsub -all {set} $blist "" clist
		.seek.results.t.list insert end "$clist"
		frame .seek.results.btn
		# ttk::button .seek.results.btn.done -text "Close Results" -command {destroy .seek.results}
		pack .seek.results -in .seek
		pack .seek.results.t -in .seek.results 
		pack .seek.results.t.list -in .seek.results.t -side left -fill both
		pack .seek.results.t.s -in .seek.results.t   -side left -fill y
		pack .seek.results.btn -in .seek.results
		# pack .seek.results.btn.done -in .seek.results.btn
		}]\
	[ttk::button .seek.done -text "Close Search" -command {destroy .seek}]
	pack .seek.s -in .seek
}

proc vieweb {} {
	if { $::website != " " } {
	eval exec "\"$::browser\" $::website"
	} else {
	eval exec "\"$::browser\" http://wiki.tonybaldwin.info/doku.php?id=hax:addresstcl &"
	}
}

proc wiki {} {
	eval exec "\"$::browser\" http://wiki.tonybaldwin.info/doku.php?id=hax:addresstcl &"
}

proc help {} {
	toplevel .help
	wm title .help "Tcl Address Help"
	bind .help <Escape> {destroy .help}
	frame .help.t
	grid [text .help.t.text -width 58 -height 7] 
	bind .help.t.text <KeyPress> break
	.help.t.text insert end "This is a simple address book program in tcl/tk.\nRead the README file or the wiki page,\nand if you still require assistance,\ncontact tony@tonybaldwin.info\nweb page:\nhttp://wiki.tonybaldwin.me/doku.php?id=hax:addresstcl\nor http://tonyb.us/addresstcl"
	frame .help.b
	grid [ttk::button .help.b.web -text "address.tcl wiki page" -command {wiki}]\
	[ttk::button .help.b.ok -text "Close Help" -command {destroy .help}]
	pack .help.t -in .help
	pack .help.b -in .help
}

# This program was written by tony baldwin - http://wiki.tonybaldwin.info 
# This program is free software; you can redistribute it and/or modify 
# it under the terms of the GNU General Public License as published by 
# the Free Software Foundation; either version 2 of the License, or 
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
