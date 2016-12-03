/*
Scavenger
*/
/datum/job/scavenger
	title = "Scavenger"
	flag = SCAVENGER
	department_flag = CIVILIAN
	faction = "Desert" //desert faction shall disable appearing as scavenger after readying
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/scavenger

/datum/outfit/job/scavenger
	name = "Scavenger"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/outfit/job/scavenger/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/f13/brahmin,\
		/obj/item/clothing/under/f13/relaxedwearm,\
		/obj/item/clothing/under/f13/springm,\
		/obj/item/clothing/under/f13/caravaneer,\
		/obj/item/clothing/under/f13/roving)
	head = pick(/obj/item/clothing/head/hardhat,\
		/obj/item/clothing/head/welding)
	l_pocket = /obj/item/weapon/reagent_containers/food/drinks/flask/survival
	r_pocket = /obj/item/device/flashlight/flare/torch
	belt = pick (simple_start_weapon)
	//if (prob(80))
	//	l_hand = pick(/obj/item/weapon/kitchen/knife,\
	//		/obj/item/weapon/storage/toolbox/mechanical)
	//back = /obj/item/weapon/storage/backpack
	//backpack = /obj/item/weapon/storage/backpack
	//satchel = /obj/item/weapon/storage/backpack/satchel_norm
	//backpack_contents = list(/obj/item/weapon/reagent_containers/food/drinks/nukacola = 2,\
		/obj/item/weapon/reagent_containers/food/snacks/beans = 2,\
		/obj/item/weapon/storage/wallet=1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/stack/coin/bag = 1)

