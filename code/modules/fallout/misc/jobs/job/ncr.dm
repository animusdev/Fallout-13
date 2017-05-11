/datum/job/general
	title = "General"
	desc = "No description."
	flag = GENERAL
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_general"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7
	whitelist_on = 1


	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/general

	access = list()
	minimal_access = list()

/datum/outfit/job/general
	name = "General"
	id = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/sergeant
	head = /obj/item/clothing/head/f13/sergeant
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	belt_contents = list(/obj/item/ammo_box/magazine/m556 = 3, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/device/radio = 1, \
		/obj/item/device/flashlight/torch/flare/blue = 1)


/datum/job/sergeant
	title = "Sergeant"
	desc = "No description."
	flag = SERGEANT
	department_head = list("general")
	department_flag = WASTELAND
	faction = "ncr"
	status = "ncr_sergeant"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the General"
	selection_color = "#9d9fec"
	minimal_player_age = 7


	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/sergeant
	name = "Sergeant"
	id = null
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/sergeant
	head = /obj/item/clothing/head/f13/sergeant
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	belt_contents = list(/obj/item/ammo_box/magazine/m556 = 3, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/device/radio = 1, \
		/obj/item/device/flashlight/torch/flare/blue = 1)

/datum/job/vranger
	title = "Veteran Ranger"
	desc = "No description."
	flag = RANGER
	department_head = list("NCR Command HQ")
	department_flag = WASTELAND
	faction = "ncr"
	status = "vranger"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the NCR Command HQ"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	outfit = /datum/outfit/job/vranger

	allowed_packs = list("starter", "super_ten")

	required_items = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak)

	access = list()
	minimal_access = list()

/datum/outfit/job/vranger
	name = "Veteran Ranger"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/light
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/ranger
	belt = /obj/item/weapon/storage/belt/military/assault
	weapon = /obj/item/weapon/gun/ballistic/revolver/magnum
	belt_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/ammo_box/m44 = 3, \
		/obj/item/device/radio = 1)
/*
/datum/job/elite_trooper
	title = "Elite Trooper"
	desc = "No description."
	flag = SERGEANT
	department_head = list("general")
	department_flag = WASTELAND
	faction = "ncr"
	status = "etrooper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the general"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/elite_trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/elite_trooper
	name = "Elite Trooper"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/power_armor/ncr
	head = /obj/item/clothing/head/helmet/power_armor/ncr
	belt = /obj/item/weapon/storage/belt/military/army
	suit_store = /obj/item/weapon/gun/ballistic/automatic/pistol/n99
	mask = /obj/item/clothing/mask/gas/sechailer
	weapon = /obj/item/weapon/minigunpack
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak=2, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/ammo_box/magazine/m10mm_adv = 2, \
	/obj/item/device/radio = 1)
*/

/datum/job/trooper
	title = "Trooper"
	desc = "No description."
	flag = TROOPER
	department_head = list("general", "sergeant")
	department_flag = WASTELAND
	faction = "ncr"
	status = "trooper"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the General"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten", "trooper_armor")

	required_items = list(/obj/item/clothing/suit/armor/f13/ncr/facewrap)


	outfit = /datum/outfit/job/trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/trooper
	name = "Trooper"
	gloves = /obj/item/clothing/gloves/f13/military
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	head = /obj/item/clothing/head/helmet/f13/trooper
	glasses = /obj/item/clothing/glasses/f13/biker
	belt = /obj/item/weapon/storage/belt/military/army
	weapon = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak=1, \
	/obj/item/device/radio = 1, /obj/item/ammo_box/magazine/m556 = 3)