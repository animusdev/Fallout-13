/datum/f13_objective/assassinate
	name = "Assassinate"
	desc = "Dis motherfucker killed your father"
	difficulty = 0

	assignto(datum/mind/M, var/list/data = list())
		var/datum/mind/target = pick(ticker.minds)
		data["target"] = target
		data["target_rank"] = target.assigned_role
		data["custom_desc"] = "Your target is <b>%target%</b> as <b>%target_rank%</b>"
		..()

	check_complete(var/datum/objective_holder/holder)
		if(!holder || !holder.data["target"])
			return 1
		var/datum/mind/target = holder.data["target"]
		if(target.current.stat == DEAD)
			return 1
		return 0