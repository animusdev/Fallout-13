//Fallout 13 - Loadsamoney!
#define DONATE_UPDATE_DELAY 6000
client
	var
		list/allowed_roles
		list/allowed_factions
		list/allowed_items
		list/allowed_pets
		list/donate_packs
		donate_money
		next_donate_update
	proc
		update_donate_data(force = FALSE)
			if(!force && world.time < next_donate_update)
				return 0
			update_donate_packs()
			update_allowed_factions()
			load_donate_data()

			next_donate_update = world.time + DONATE_UPDATE_DELAY
			return 1

		update_donate_packs()
			donate_packs = list("default")

		buy_donate_pack(pack_id)
			donate_packs += pack_id
			update_donate_data(TRUE)
			return 1

		load_donate_data()
			generate_items_list()
			allowed_pets = list()
			allowed_roles = list()
			for(var/pack_id in donate_packs)
				var/datum/donate_pack/D = SSdonate.get_pack(pack_id)
				if(D != null)
					for(var/item in D.items)
						add_item(item)
					allowed_pets += D.pets
					allowed_roles += D.roles


		add_item(item)
			if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
				allowed_items["misc"] |= item
			allowed_items[slot_name_by_type(item)] |= item

		generate_items_list()
			allowed_items = list()
			allowed_items["weapon"] = list()
			allowed_items["misc"] = list()
			allowed_items["head"] = list()
			allowed_items["armor"] = list()
			allowed_items["gloves"] = list()
			allowed_items["shoes"] = list()
			allowed_items["uniform"] = list()

		update_allowed_factions()
			allowed_factions = list()
			for(var/f in human_factions)
				var/datum/f13_faction/F = human_factions[f]
				allowed_factions += F
//				if(!(F.flags & DONATE))
//					allowed_factions += F
//					continue
//				if(F in donate_factions)
//					allowed_factions += F
			return 1