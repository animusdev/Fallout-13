	/*
Legion
*/

//recruit
/datum/job/recruit
	title = "Recruit"
	flag = LEGRECRUIT
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "recruit"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	outfit = /datum/outfit/job/legrecruit

	access = list()
	minimal_access = list()

/datum/outfit/legrecruit
	name = "Recruit"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legrecruit/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/f13/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legrecruit
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legrecruit
//	suit_store = /obj/item/weapon/gun/projectile/shotgun/boltaction
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
//	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
/*	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \*/
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1, \
/*	/obj/item/stack/caps = 1, \*/
/*	/obj/item/weapon/machete = 1*/)

//decan
/datum/job/decan
	title = "Decanus"
	flag = LEGDECAN
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "decanus"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	outfit = /datum/outfit/job/legdecan

	access = list()
	minimal_access = list()

/datum/outfit/job/legdecan
	name = "Decanus"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legdecan/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/f13/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legdecan
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legdecan
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
//	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel
//	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/stack/caps = 1, \
	/obj/item/weapon/machete = 1, \
	/obj/item/ammo_box/magazine/m10mm_adv = 2)

//vexillarius
/datum/job/vex
	title = "Vexillarius"
	flag = LEGVEX
	department_head = list("Legate")
	department_flag = WASTELAND
	faction = "legion"
	status = "vexillarius"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	outfit = /datum/outfit/job/legvex

	access = list()
	minimal_access = list()

/datum/outfit/job/legvex
	name = "Vexillarius"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legvex/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/f13/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legvexil
	head = /obj/item/clothing/head/helmet/f13/legvexil
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
//	suit_store = /obj/item/weapon/gun/projectile/shotgun/boltaction
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
//	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel
//	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/stack/caps = 1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/machete = 1, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 4, \
	/obj/item/ammo_box/magazine/m10mm_adv = 2)

//centurion
/datum/job/centurion
	title = "Centurion"
	flag = LEGCENTURION
	department_head = list("Legate")
	department_flag = WASTELAND
	faction = "legion"
	status = "centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	outfit = /datum/outfit/job/legcenturion

	access = list()
	minimal_access = list()

/datum/outfit/job/legcenturion
	name = "Centurion"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legcenturion/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/f13/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legcenturion
	head = /obj/item/clothing/head/helmet/f13/legcenturion
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
//	ears = /obj/item/device/radio/headset/headset_leg
	backpack = /obj/item/weapon/storage/backpack
	satchel = /obj/item/weapon/storage/backpack/satchel
//	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/caps = 3, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/weapon/powergauntlet = 1, \
	/obj/item/ammo_box/magazine/m10mm_adv = 2)

//legat
/datum/job/legate
	title = "Legate"
	flag = LEGLEGAT
	department_head = list("Caesar")
	department_flag = WASTELAND
	faction = "legion"
	status = "legate"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Caesar"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	whitelist_on = 1

	outfit = /datum/outfit/job/leglegate

	access = list()
	minimal_access = list()

/datum/outfit/job/leglegate
	name = "Legate"
	id = null
	ears = null
	belt = null

/datum/outfit/job/leglegat/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/f13/legionlegate
	gloves = /obj/item/clothing/gloves/f13/legionlegate
	suit = /obj/item/clothing/suit/armor/f13/leglegate
	head = /obj/item/clothing/head/helmet/f13/leglegate
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
//	ears = /obj/item/device/radio/headset/headset_leg
	backpack = /obj/item/weapon/storage/backpack
	satchel = /obj/item/weapon/storage/backpack/satchel
//	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/caps = 3, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/weapon/powergauntlet = 1, \
	/obj/item/ammo_box/magazine/m10mm_adv = 2)