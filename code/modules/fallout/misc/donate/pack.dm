//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong."
		list/items = list()
		list/sorted_items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1
		generate_sorted_list() //
			sorted_items["weapon"] = list()
			sorted_items["misc"] = list()
			sorted_items["head"] = list()
			sorted_items["armor"] = list()
			sorted_items["gloves"] = list()
			sorted_items["shoes"] = list()
			sorted_items["uniform"] = list()
		sort_items()
			for(var/item in items)
				if(get_var_from_type(item, "w_class") < WEIGHT_CLASS_NORMAL)
					sorted_items["misc"] |= item
				sorted_items[slot_name_by_type(item)] |= item
	New()
		. = ..()
		if(!items.len)
			return .
		generate_sorted_list()
		sort_items()



/datum/content_pack/default
	name = "Default"
	id = "default"
	desc = "Everyone has that."
	items = list(
		/obj/item/clothing/shoes/f13/brownie,
		/obj/item/clothing/shoes/f13/rag,
		/obj/item/clothing/shoes/f13/tan,
		// Uniforms
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/tribal,
		// Suits
		/obj/item/clothing/suit/f13/vest,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/hatchet,
		/obj/item/weapon/pipe
		)
	price = -1