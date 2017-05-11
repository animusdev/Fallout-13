/datum/f13_objective/join
	name = "Join"
	desc = "Join to %target_faction%."
	points = 0
	kind = INDIVIDUAL

	check_mob(mob/living/carbon/human/H)
		return 1

	assignto_mind(datum/mind/M, var/list/data = list())
		var/mob/living/mob = M.current
		for(var/f_name in human_factions)
			var/datum/f13_faction/target = human_factions[f_name]
			if(target.id != mob.social_faction)
				data["target_faction"] = target.id
				break
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/mind/mind = holder.owner
		var/mob/living/mob = mind.current
		if(mob.social_faction != holder.data["target_faction"])
			return 0
		return 1