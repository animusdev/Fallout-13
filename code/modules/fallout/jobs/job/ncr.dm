/datum/job/squad_leader
	title = "NCR Squad Leader"
	flag = SQDLEAD
	department_head = list("NCR Command")
	department_flag = WASTELAND
	faction = "NCR"
	status = "Squad Leader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the NCR command"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	whitelist_on = 1

	outfit = /datum/outfit/job/squad_leader

	access = list()
	minimal_access = list()

/datum/outfit/job/squad_leader
	name = "NCR Squad Leader"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/combat
	head = /obj/item/clothing/head/helmet/f13/combat
	glasses = /obj/item/clothing/glasses/night
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/deagle
//	backpack_contents = list(/obj/item/ammo_box/magazine/m50 = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
//	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/ranger
	title = "NCR Ranger"
	flag = RANGER
	department_head = list("Squad Leader")
	department_flag = WASTELAND
	faction = "NCR"
	status = "Ranger"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_color = "#9d9fec"
	minimal_player_age = 7

	outfit = /datum/outfit/job/ranger

	access = list()
	minimal_access = list()

/datum/outfit/job/ranger
	name = "NCR Ranger"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/ranger
	glasses = /obj/item/clothing/glasses/night
//	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
//	backpack_contents = list(/obj/item/ammo_box/magazine/m556 = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
//	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/elite_trooper
	title = "NCR Elite Trooper"
	flag = SERGEANT
	department_head = list("Squad Leader")
	department_flag = WASTELAND
	faction = "NCR"
	status = "Elite Trooper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the squad leader"
	selection_color = "#9d9fec"
	minimal_player_age = 7


	outfit = /datum/outfit/job/elite_trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/elite_trooper
	name = "NCR Elite Trooper"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/power_armor/ncr
	head = /obj/item/clothing/head/helmet/power_armor/ncr
	glasses = /obj/item/clothing/glasses/night
	belt = /obj/item/weapon/storage/belt/military/army
	box = null
	suit_store = /obj/item/weapon/gun/ballistic/automatic/pistol/n99
	mask = /obj/item/clothing/mask/gas/sechailer
//	ears = /obj/item/device/radio/headset/headset_ncr
	var/list/belt_contents = list(/obj/item/weapon/restraints/handcuffs=2,/obj/item/weapon/reagent_containers/pill/patch/stimpak=2, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, /obj/item/ammo_box/magazine/m10mm_adv = 2)

/datum/outfit/job/elite_trooper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	back = /obj/item/weapon/minigunpack

/datum/outfit/job/elite_trooper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	for(var/path in belt_contents)
		var/number = belt_contents[path]
		for(var/i=0,i<number,i++)
			H.belt:handle_item_insertion(new path(H), 1, H)

/datum/job/trooper
	title = "NCR Trooper"
	flag = TROOPER
	department_head = list("Squad Leader")
	department_flag = WASTELAND
	faction = "NCR"
	status = "Trooper"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the squad leader"
	selection_color = "#9d9fec"
	minimal_player_age = 7


	outfit = /datum/outfit/job/trooper

	access = list()
	minimal_access = list()

/datum/outfit/job/trooper
	name = "NCR Trooper"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	head = /obj/item/clothing/head/helmet/f13/trooper
	glasses = /obj/item/clothing/glasses/f13/biker
//	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
//	backpack_contents = list(/obj/item/ammo_box/magazine/m10mm_adv = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
//	ears = /obj/item/device/radio/headset/headset_ncr