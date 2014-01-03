#!/usr/bin/wish8.5

# a simple address book tool
# written in tcl/tk by tony baldwin
# released according to the terms of the
# GNU Public License, v.3 or later

package require fileutil

bind . <Escape> {exit}

global addir
# edit the following to indicate where you keep your address files
set addir "~\\Documents\\Addresses" 

cd $addir

set file_types {
{"All Files" * }
{"Address" {.address}}
}

wm title . "Address Book"

frame .name 

grid [ttk::label .name.name -text "Tcl Address Book"]

pack .name -in . -fill x

frame .fields

grid [ttk::button .fields.open -text "Open Address" -command {openadd}]\
[ttk::button .fields.new -text "New Address" -command {newadd}]\
[ttk::button .fields.list -text "List Addresses" -command {listadds}]\
[ttk::button .fields.search -text "Search" -command {seek}]\
[ttk::button .fields.out -text "QUIT" -command {exit}]\
[ttk::button .fields.help -text "Help" -command {help}]

pack .fields -in . -fill x

proc listadds {} {
	frame .list
	frame .list.t
	text .list.t.l -width 56 -height 10 -wrap word -yscrollcommand ".list.t.ys set"
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
	pack .list -in .
}

proc newadd {} {
		frame .new 
		set allvars [list lname fname cell homephone ophone email email2 street city state zcode country tags note novar]
		foreach var $allvars {global $var}
		foreach var $allvars {set $var " "}
		
	grid [ttk::label .new.fname -text "First Name: "]\
	[ttk::entry .new.fn -width 50 -textvar fname]
	
	grid [ttk::label .new.lname -text "Last Name: "]\
	[ttk::entry .new.ln -width 50 -textvar lname]
	
	grid [ttk::label .new.mobile -text "Cell Phone: "]\
	[ttk::entry .new.mobi -width 50 -textvar cell]

	grid [ttk::label .new.hph -text "Home Phone: "]\
	[ttk::entry .new.homeph -width 50 -textvar homephone]
	
	grid [ttk::label .new.0ph -text "Other Phone: "]\
	[ttk::entry .new.oph -width 50 -textvar ophone]

	grid [ttk::label .new.eml -text "E-mail 1: "]\
	[ttk::entry .new.email -width 50 -textvar email]

	grid [ttk::label .new.eml2 -text "E-mail 2: "]\
	[ttk::entry .new.email2 -width 50 -textvar email2]	
	
	grid [ttk::label .new.street -text "Street: "]\
	[ttk::entry .new.st -width 50 -textvar street]
	
	grid [ttk::label .new.city -text "City: "]\
	[ttk::entry .new.cty -width 50 -textvar city]
	
	grid [ttk::label .new.state -text "State: "]\
	[ttk::entry .new.st8 -width 50 -textvar state]
	
	grid [ttk::label .new.zip -text "Zip Code: "]\
	[ttk::entry .new.zcode -width 50 -textvar zcode]
	
	grid [ttk::label .new.country -text "Country: "]\
	[ttk::entry .new.cntry -width 50 -textvar country]
	
	grid [ttk::label .new.tags -text "Tags: "]\
	[ttk::entry .new.tgz -width 50 -textvar tags]
	
	grid [ttk::label .new.note -text "Note: "]\
	[ttk::entry .new.not -width 50 -textvar note]
	
	grid [ttk::button .new.save -text "Save Address" -command {
		set novar EOF
		set allvars [list lname fname cell homephone ophone email street city state zcode country tags note novar]
		set filename "$lname.$fname.address"
		set fileid [open $filename w]
		foreach var $::allvars {puts $fileid [list set $var [set ::$var]]}
		close $fileid}]\
	[ttk::button .new.close -text "Close Address" -command {destroy .new}]
	
	pack .new -in .
	}
	
proc savenew {} {
	set allvars [list lname fname street city state zcode novar]
	set filename "$lname.$fname.address"
	set fileid [open $filename w]
	foreach var $::allvars {puts $fileid [list set $var [set ::$var]]}
	close $fileid
}

proc openadd {} {
	     set file_types {
	     {"address file" {.address}}
	     }
	     set addressfile [tk_getOpenFile -filetypes $file_types -initialdir $::addir]
	     uplevel #0 [list source $addressfile]
	     wm title . "Now Tickling: $addressfile"
	     frame .address
	     grid [ttk::label .address.fname -text "First Name: "]\
	     [ttk::entry .address.fn -width 50 -textvar fname]
	
	     grid [ttk::label .address.lname -text "Last Name: "]\
	     [ttk::entry .address.ln -width 50 -textvar lname]
	
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
	
	     grid [ttk::label .address.tags -text "Tags: "]\
	     [ttk::entry .address.tgz -width 50 -textvar tags]
	     
	     grid [ttk::label .address.note -text "Note: "]\
	     [ttk::entry .address.not -width 50 -textvar note]
	     
	     grid [ttk::button .address.save -text "Save Address" -command {
		set novar EOF
		set allvars [list lname fname cell homephone ophone email email2 street city state zcode country tags note novar]
		set filename "$lname.$fname.address"
		set fileid [open $filename w]
		foreach var $::allvars {puts $fileid [list set $var [set ::$var]]}
		close $fileid}]\
            [ttk::button .address.close -text "Close Address" -command {destroy .address}]
	    pack .address -in .
}


proc seek {} {
	frame .seek
	grid [ttk::label .seek.term -text "Enter search term: "]\
	[ttk::entry .seek.this -textvar sterm]\
	[ttk::button .seek.go -text "Go" -command {
		destroy .matches
		frame .matches
		frame .matches.t
		text .matches.t.list -width 56 -height 5  -wrap word  -yscrollcommand ".matches.t.s set"
		scrollbar .matches.t.s -command ".matches.t.list yview"
		set list [glob -tails -type f -directory $::addir *.address]
		set myList [::fileutil::grep (?i)$sterm $list]
		regsub -all {\{} $myList "" alist
		regsub -all {\}} $alist "\n" blist
		regsub -all {set} $blist "" clist
		.matches.t.list insert end "$clist"
		frame .matches.btn
		ttk::button .matches.btn.done -text "Close Results" -command {destroy .matches}
		pack .matches -in .
		pack .matches.t -in .matches
		pack .matches.t.list -in .matches.t  -side left -fill both
		pack .matches.t.s -in .matches.t   -side left -fill y
		pack .matches.btn -in .matches
		pack .matches.btn.done -in .matches.btn
		}]\
	[ttk::button .seek.done -text "Close Search" -command {destroy .seek}]

	pack .seek -in .
	}

proc help {} {
	frame .help
	grid [text .help.t -width 58 -height 3] 
	.help.t insert end "This is a simple address program in tcl/tk.\nif you require assistance, contact tony\nhttp://wiki.tonybaldwin.me"
	grid [ttk::button .help.ok -text "Close Help" -command {destroy .help}]
	
	pack .help -in .
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
