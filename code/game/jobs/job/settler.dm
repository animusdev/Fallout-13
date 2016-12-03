/*
Settler
*/
/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = CIVILIAN
	faction = "Desert" //desert faction shall disable appearing as scavenger after readying
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/settler

/datum/outfit/job/settler
	name = "Settler"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/outfit/job/settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/f13/settler,\
		/obj/item/clothing/under/f13/brahmin,\
		/obj/item/clothing/under/f13/machinist,\
		/obj/item/clothing/under/f13/lumberjack,\
		/obj/item/clothing/under/f13/roving)
	l_pocket = /obj/item/weapon/reagent_containers/food/drinks/flask/survival
	r_pocket = /obj/item/device/flashlight/flare/torch
	belt = pick (simple_start_weapon)
	//if (prob(80))
	//	l_hand = pick(/obj/item/weapon/kitchen/knife)


//	if (prob(100))
		//back = /obj/item/weapon/storage/backpack
		//backpack = /obj/item/weapon/storage/backpack
		//satchel = /obj/item/weapon/storage/backpack/satchel_norm
		//backpack_contents = list(/obj/item/device/analyzer/plant_analyzer = 1, \
			/obj/item/stack/cable_coil = 1, \
			/obj/item/stack/sheet/mineral/wood = 5, \
			/obj/item/stack/sheet/mineral/sandstone = 5, \
			/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)