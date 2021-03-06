# This is work in progress
# This is meant to extend eggdrop's login feature 
# This involves SQLite. A lot.
package require sqlite 

namespace eval login {

#Command used to lookup entries
variable login::lookup "!lookup"

#Command used to lookup entries via message-
variable login::lookup "!lookup"
#Authorization for the command-
variable login::lookupauth ""

#Command used to edit entries-
variable login::set "!set"
#Authorization for the command-
variable login::setAuth ""

#Command used to register entries-
variable login::register "!register"

#Authorization for the command-
variable login::registerAuth ""
}
   
   if {catch {source scripts/login.tcl>} err} {
            putlog "Error while loading login.tcl: $err"
    } 
	else {
            putlog "login.tcl loaded without errors"
    }
	

sqlite db1 ~/sql/database1.sqlite
db1 eval {CREATE TABLE IF NOT EXISTS db1.usersheet(
            ID int(255)
            Adventurer varchar(255)
            Race varchar(255)
            Role varchar(255)
            Bio varchar(255)
            Catchprase varchar(255)
            STR int(255)
            DEX int(255)
            CON int(255)
            WIZ int(255)
            CHA int(255)
        )
        }

bind join * * joinup
bind 

       procname joinup {nick hand idx chan} {
          if {db1 exists {SELECT * FROM Adventurer WHERE Adventurer=$nick} == true} {
	  puthelp "PRVMSG $nick: Welcome back $nick"
	  puthelp "PRVMSG $chan: $nick has joined!"
	  chattr $nick +v chan
          } 
		  else {
	 puthelp "PRVMSG $nick: Welcome, $nick. According to our Database, you haven't registered yet."
	 puthelp "PRVMSG $nick: To register, type '/msg goruchwyliwr $login' "
         puthelp "PRVMSG $chan: We have a new member. $nick! Now be nice..."
	 }   
          }
