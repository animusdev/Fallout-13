/datum/f13_objective
	var
		name = "Objective"
		desc = "Objective description"
		difficulty = 0
		list/available_factions = list("all")
		list/available_roles = list("all")

		list/datum/objective_holder/holders = list()
	proc
		//Check can mob take this objective
		check_mob(mob/living/carbon/human/H)
			if(!available_factions.Find("all") && !available_factions.Find(H.social_faction))
				return 0
			if(!available_roles.Find("all") && !available_factions.Find(H.social_faction))
				return 0
			return 1
		assignto(datum/mind/M, var/list/data = list())
			var/datum/objective_holder/holder = new /datum/objective_holder(M, src, data)
			M.objective 	= holder
			holders 			+= holder

			to_chat(M.current, "<span class='notice'>Your current objective: <b>[name]</b></span>")
			to_chat(M.current, "\t<i>[desc]<i>")
			if(data["custom_desc"])
				to_chat(M.current, "\t[data["custom_desc"]]")

		check_complete(/datum/objective_holder/holder)
			return 1