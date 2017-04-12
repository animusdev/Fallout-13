//Fallout 13 - Loadsamoney

var/datum/subsystem/ambient/SSdonate

/datum/subsystem/donate
	name = "Donate"
	init_order = 100
	priority = 100

	wait = 6000

/datum/subsystem/donate/New()
	NEW_SS_GLOBAL(SSdonate)
	load_donate_packs()
	update_all_data()

/datum/subsystem/donate/fire(resumed = 0)
	update_all_data()

/datum/subsystem/donate/proc/update_all_data()
	for(var/client/C)
		C.update_donate_data()