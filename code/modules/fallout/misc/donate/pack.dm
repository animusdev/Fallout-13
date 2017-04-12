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