/obj/effect/landmark/corpse/skeleton
	name = "skeletal remains"
	mobname = "skeleton"
	mob_species = /datum/species/skeleton
	mobgender = NEUTER
//These're here as a reminder of what can be set, so I don't have to go look back at corpse.dm
	corpseuniform = null //Set this to an object path to have the slot filled with said object on the corpse.
	corpsesuit = null
	corpseshoes = null
	corpsegloves = null
	corpseradio = null
	corpseglasses = null
	corpsemask = null
	corpsehelmet = null
	corpsebelt = null
	corpsepocket1 = null
	corpsepocket2 = null
	corpseback = null

/obj/effect/landmark/corpse/skeleton/cop
	corpseuniform = /obj/item/clothing/under/f13/police
	corpseshoes = /obj/item/clothing/shoes/jackboots
	corpseglasses = /obj/item/clothing/glasses/sunglasses
	corpsehelmet = /obj/item/clothing/head/f13/police
	corpsepocket1 = /obj/item/weapon/restraints/handcuffs