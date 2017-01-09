var/datum/subsystem/mobs/SSmob

/datum/subsystem/mobs
	name = "Mobs"
	priority = 4
	display = 4
	wait = 1
	var/list/working_list = list()
	var/max_wait = 20
	var/mob_pertick

/datum/subsystem/mobs/New()
	NEW_SS_GLOBAL(SSmob)


/datum/subsystem/mobs/stat_entry()
	..("P:[mob_list.len]")


/datum/subsystem/mobs/fire()
	if(!working_list.len)
		working_list = mob_list.Copy()
		mob_pertick = round(working_list.len / max_wait + 1)

	var/M = 0
	var/seconds = wait * 0.1
	for(var/thing in working_list)
		if(thing)
			thing:Life(seconds)
			working_list.Remove(thing)
			M++
			if(M > mob_pertick)
				break
			continue
		mob_list.Remove(thing)