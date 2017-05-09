/datum/objective_holder
	var/datum/mind/owner
	var/datum/f13_objective/objective
	var/list/data

/datum/objective_holder/New(mind/client, datum/f13_objective/O, list/data)
	src.objective = O
	src.owner = client
	src.data = data