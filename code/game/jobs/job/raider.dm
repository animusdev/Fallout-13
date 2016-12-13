/*
Raider
*/
/datum/job/raider
	title = "Raider"
	flag = RAIDER
	department_flag = CIVILIAN
	faction = "Wasteland" //desert faction shall disable appearing as scavenger after readying
	total_positions = 3
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/raider

/datum/outfit/job/raider
	name = "Raider"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/outfit/job/raider/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/f13/mercadv,\
		/obj/item/clothing/under/f13/merccharm)
	shoes = /obj/item/clothing/shoes/jackboots
	//suit = pick(/obj/item/clothing/suit/armor/f13/supafly,\
		/obj/item/clothing/suit/armor/f13/bmetalarmor,\
		/obj/item/clothing/suit/armor/f13/yankee)
	//head = /obj/item/clothing/head/helmet/f13/supaflyhelmet
	l_pocket = /obj/item/weapon/reagent_containers/food/drinks/flask/survival
	r_pocket = /obj/item/device/flashlight/flare/torch
	belt = pick (simple_start_weapon)

	//backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1,\
	/obj/item/weapon/pipe=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/coin/coins = 2)
	//ears = /obj/item/clothing/ears/raider_mark
	//back = /obj/item/weapon/storage/backpack
	//backpack = /obj/item/weapon/storage/backpack
	//satchel = /obj/item/weapon/storage/backpack/satchel_norm