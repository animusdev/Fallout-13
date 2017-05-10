/datum/f13_objective/assassinate
	name = "Assassinate"
	desc = "Dis motherfucker killed your father"
	kind = INDIVIDUAL

	check_mob(mob/living/carbon/human/H)
		if(!..())
			return 0
		if(ticker.minds.len < 2)
			return 0
		return 1

	assignto_mind(datum/mind/M, var/list/data = list())
		var/list/minds = shuffle(ticker.minds)
		var/datum/mind/target
		for(var/mind in minds)
			if(mind != M)
				target = mind
				break
		if(target == M)
			CRASH("Same minds for assassinate objective")
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