/datum/f13_objective/jew
	name = "Jew"
	desc = "Collect %count% caps."
	kind = INDIVIDUAL

	assignto_mind(datum/mind/M, var/list/data = list())
		data["count"] = round(rand(100,500),50)
		..()
	check_complete(var/datum/objective_holder/holder)
		var/datum/mind/mind = holder.owner
		if(!mind.current)
			return 0
		var/current = 0
		for(var/obj/item/stack/caps/caps in mind.current.get_contents())
			current += caps.amount
		if(current < holder.data["count"])
			return 0
		return 1