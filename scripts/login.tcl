# This is heavaly work in progress
# This is meant to extend eggdrop's login feature 
# and by that, this will create a full d20-esque character sheet for all your needs
# This involves SQLite. A lot.
package require sqlite 
    if {[catch {source scripts/login.tcl>} err} {
            putlog "Error while loading login.tcl: $err"
    } else {
            putlog "login.tcl loaded without errors"
    }
namespace{


}
	
sqlite db1 ~/sql/database1.sqlite
db1 eval{CREATE TABLE IF NOT EXISTS db1.usersheet
        (
        	ID int(255)
        	Adventurer varchar(255)
        	Race varchar(255)
        	Bio varchar(255)
        	Catchphrase varchar(255)
        	STR int(255)
        	DEX int(255)
        	CON int(255)
        	WIZ int(255)
        	CHA int(255)
        )
        }
	bind join * * joinup
	procname joinup { nick hand idx chan }
	
	proc joinup {
	
	}
