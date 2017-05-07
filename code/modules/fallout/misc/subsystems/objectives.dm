var/datum/subsystem/objectives/SSobjectives



/datum/subsystem/objectives
	name = "Objectives"

	var/list/all_objectives = list()

/datum/subsystem/objectives/New()
	NEW_SS_GLOBAL(SSobjectives)

/datum/subsystem/objectives/Initialize(timeofday)
	var/list/objs = subtypesof(/datum/f13_objective)
	if(!objs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up objectives, no objective datums found!</span>")
		return 0
	for(var/type in objs)
		var/datum/f13_objective/O = new type()
		all_objectives += O

/datum/subsystem/objectives/proc/setup_objectives()
	for(var/datum/ in ticker.minds)