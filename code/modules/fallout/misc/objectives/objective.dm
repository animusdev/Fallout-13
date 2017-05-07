/datum/objective
	var
		name = "Objective"
		desc = "Objective description"
		difficulty = 0
		list/available_factions = list("all")
		list/available_roles = list("all")
	proc
		//Checks can mob take this objective
		check_mob(mob/living/carbon/human/H)
			if(!available_factions.Find("all") && !available_factions.Find(H.social_faction))
				return 0
			if(!available_roles.Find("all") && !available_factions.Find(H.social_faction))
				return 0
			return 1
		assignto(mob/living/human/H)
			return 1
		check_complete(/datum/objective_holder/holder)
			return 1