/datum/f13_objective/expand
	name = "Expand"
	desc = "Your faction must contain %target_size% alive members."
	points = 0
	kind = FACTION

	assignto_faction(var/datum/f13_faction/F, var/list/data = list())
		data["target_size"] = F.members.len + round(max(5, F.members.len * rand(1.5,2.5)))
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/f13_faction/faction = holder.owner
		if(faction.members.len < holder.data["target_size"])
			return 0
		return 1