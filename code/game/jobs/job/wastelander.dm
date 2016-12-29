/datum/job/wastelander
	title = "Wastelander"
	flag = WASTELANDER
	department_flag = CIVILIAN
	faction = "Wasteland" //desert faction shall disable appearing as scavenger after readying
	status = "Wastelander"
	total_positions = 4
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/wastelander

/datum/outfit/job/wastelander
	name = "Wastelander"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/outfit/job/wastelander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/f13/settler,\
		/obj/item/clothing/under/f13/brahmin,\
		/obj/item/clothing/under/f13/machinist,\
		/obj/item/clothing/under/f13/lumberjack,\
		/obj/item/clothing/under/f13/roving)
//	mask = /obj/item/clothing/mask/surgical
//	gloves = /obj/item/clothing/gloves/color/white
	l_pocket = /obj/item/weapon/reagent_containers/food/drinks/flask/survival
	r_pocket = /obj/item/device/flashlight/flare/torch
	belt = pick (simple_start_weapon)
	//back = /obj/item/weapon/storage/backpack
	//backpack = /obj/item/weapon/storage/backpack
	//satchel = /obj/item/weapon/storage/backpack/satchel_norm
	//backpack_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak=3, \
	/obj/item/weapon/reagent_containers/pill/patch/radaway=2, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/coin/coins = 1)
//	if (prob(80))
//		l_hand = pick(/obj/item/weapon/kitchen/knife)
