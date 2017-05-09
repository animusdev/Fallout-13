var/datum/subsystem/objectives/SSobjectives



/datum/subsystem/objectives
	name = "Objectives"
	flags = SS_NO_FIRE

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
	var/text
	text += "<h2>Faction Objectives Results:</h2>"
	//Blabla
	text += "<br>---<br>---<br>---<br>"

	text += "<h2>Individual Objectives Results:</h2>"

	for(var/datum/mind in ticker.minds)
		if(!mind.objective)
			continue
		var/datum/f13_objective/O = mind.objective.parent
		var/desc = mind.objective.data["custom_desc"]
		if(!desc)
			desc = O.desc
		if(O.check_complete(mind.objective))
			give_points(mind, O.points)
			text += "\t<b>[mind]</b> <font color='#00FF00'>succes</font> objective:<br>"
			text += "\t\t <i>[desc]</i><br>"
		else
			text += "\t<b>[mind]</b> <font color='#FF0000'>fail</font> objective:<br>"
			text += "\t\t <i>[desc]</i><br>"
	to_chat(world, text)

	return 1

/datum/subsystem/objectives/proc/give_random(datum/mind/mind)
	var/list/objectives = shuffle(all_objectives)
	for(var/datum/f13_objective/O in objectives)
		if(O.check_mob(mind.current))
			O.assignto(mind)
			break
	if(!mind.objective)
		CRASH("Can't give objective to [mind]")

/datum/subsystem/objectives/proc/give_points(datum/mind/mind, count)
	return 1