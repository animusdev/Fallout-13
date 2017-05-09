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
	for(var/datum/mind/mind in ticker.minds)
		if(!mind.current)
			continue
		give_random(mind)

/datum/subsystem/objectives/proc/on_roundend()
	return 1

/datum/subsystem/objectives/proc/give_random(datum/mind/mind)
	var/list/objectives = shuffle(all_objectives)
	for(var/datum/f13_objective/O in objectives)
		if(O.check_mob(mind.current))
			O.assignto(mind)
			break