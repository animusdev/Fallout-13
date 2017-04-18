//Fallout 13 contributor packs directory

/datum/donate_pack
	var
		name = "What?"
		id = "shit"
		desc = "Something is wrong."
		list/items = list()
		list/roles = list()
		list/pets = list()
		price = 99999
	proc
		on_set(client/client)
			return 1

/datum/donate_pack/default
	name = "Default"
	id = "default"
	desc = "Everyone has that."
	items = list(/obj/item/device/flashlight/torch, /obj/item/clothing/head/helmet/f13/eyebot,
	/obj/item/clothing/head/helmet/f13/supaflyhelmet, /obj/item/weapon/machete,
	/obj/item/clothing/head/helmet/f13/tribal, /obj/item/clothing/head/helmet/f13/yankee)
	price = -1