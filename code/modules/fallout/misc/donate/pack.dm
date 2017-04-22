//Fallout 13 contributor packs directory

/datum/content_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong! Maybe you already have this content pack?"
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


/datum/content_pack/starter
	name = "Starter"
	id = "starter"
	desc = "Available to: All roles!<br>Everyone has that, for free!<br><i>Note: All roles have the items that go to pocket slots. Although, some roles have certain clothing items disabled by default to preserve the general role stylistics. Settler role has it all.</i>"
	items = list(
		/obj/item/clothing/shoes/f13/rag,
		// Uniforms
		/obj/item/clothing/under/pants/f13/cloth,
		/obj/item/clothing/under/pants/f13/caravan,
		/obj/item/clothing/under/f13/rag,
		/obj/item/clothing/under/f13/tribal,
		/obj/item/clothing/under/f13/female/tribal,
		/obj/item/clothing/under/f13/settler,
		/obj/item/clothing/under/f13/brahmin,
		/obj/item/clothing/under/f13/female/brahmin,
		/obj/item/clothing/under/f13/worn,
		// Suits
		/obj/item/clothing/suit/f13/mantle_liz,
		// Items
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival,
		/obj/item/weapon/storage/fancy/cigarettes,
		/obj/item/weapon/storage/fancy/cigarettes/tortoise,
		/obj/item/weapon/storage/box/matches,
		/obj/item/device/flashlight/torch,
		// Weapons
		/obj/item/weapon/pipe,
		/obj/item/weapon/tireiron,
		/obj/item/weapon/kitchen/rollingpin,
		/obj/item/weapon/kitchen/knife,
		/obj/item/weapon/kitchen/knife/butcher
		)
	price = -1

/datum/content_pack/trooper_armor
	name = "Batallion themed NCR armor (+6 skins)"
	id = "trooper_armor"
	desc = "Available to: NCR only!<br>Form a strike squad with your friends, wearing the matching NCR armor sets!<br>A set includes:<br>White star insignia<br>Red star insignia<br>Holy cross insignia<br>Hear symbol insignia<br>Radiation symbol insignia<br>White skull insignia"
	items = list(
		/obj/item/clothing/suit/armor/f13/ncr/patriot,
		/obj/item/clothing/suit/armor/f13/ncr/commie,
		/obj/item/clothing/suit/armor/f13/ncr/preacher,
		/obj/item/clothing/suit/armor/f13/ncr/lover,
		/obj/item/clothing/suit/armor/f13/ncr/stalker,
		/obj/item/clothing/suit/armor/f13/ncr/punisher
		)
	price = 60

/datum/content_pack/super_ten
	name = "Super 10"
	id = "super_ten"
	desc = "Available to: All roles!<br>Pay-to-win pack of 10mm guns."
	items = list(
		/obj/item/weapon/gun/ballistic/automatic/pistol/n99,
		/obj/item/ammo_box/magazine/m10mm_adv,
		/obj/item/weapon/gun/ballistic/automatic/smg10mm,
		/obj/item/ammo_box/magazine/m10mm_auto
		)
	price = 240

/datum/content_pack/raiders_pack
	name = "Raider's additional armor"
	id = "raiderpack"
	desc = "Pack of raider's armor."
	items = list(
		/obj/item/clothing/suit/armor/f13/yankee,
		/obj/item/clothing/head/helmet/f13/yankee,
		/obj/item/clothing/head/helmet/f13/supaflyhelmet
		)
	price = 150

/datum/content_pack/madmax
	name = "Mad Max"
	id = "madmax"
	desc = "Carefully selected items from Mad Max movie franchise."
	items = list(
		/obj/item/clothing/suit/f13/mfp,
		/obj/item/clothing/head/f13/safari,
		/obj/item/weapon/reagent_containers/food/snacks/f13/dog,
		/obj/item/weapon/gun/ballistic/shotgun/trail
		)
	price = 300