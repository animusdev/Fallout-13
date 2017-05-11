/datum/f13_objective/find
	name = "Find"
	desc = "Find and hold %item_name%."
	points = 0
	kind = FACTION

	var/list/bos_items = list()
	var/list/enclave_items = list()
	var/list/city_items = list()
	var/list/other_items = list(/obj/item/ring)

	assignto_faction(var/datum/f13_faction/F, var/list/data = list())
		data["target_item"] = get_target(F.id)
		data["item_name"] = get_var_from_type(data["target_item"], "name")
		..()

	check_complete(var/datum/objective_holder/holder)
		var/datum/f13_faction/F = holder.owner
		var/item = holder.data["target_item"]
		for(var/atom/obj in world)
			if(obj.type != item)
				continue
			var/area/A = get_area(obj)
			if(F && A && istype(A.type, F.area))
				return 1
			for(var/mob/living/M in get_turf(obj))
				if(M.social_faction == F.id && obj in M.get_contents())
					return 1
		return 0

	proc/get_target(var/faction)
		switch(faction)
			if("brotherhood")
				. = pick(bos_items)
			if("enclave")
				. = pick(enclave_items)
			if("city")
				. = pick(city_items)

		if(!.)
			. = pick(other_items)