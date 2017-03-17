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
	belt = /obj/item/weapon/storage/belt/military/army
	back = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/clothing/glasses/night
	belt_contents = list(/obj/item/ammo_box/magazine/m556 = 3, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 2, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)

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
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/ranger
	belt = /obj/item/weapon/storage/belt/military/assault
	suit_store = /obj/item/weapon/gun/ballistic/automatic/smg10mm
	belt_contents = list(/obj/item/ammo_box/magazine/m10mm_auto = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 3)

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
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/power_armor/ncr
	head = /obj/item/clothing/head/helmet/power_armor/ncr
	belt = /obj/item/weapon/storage/belt/military/army
	suit_store = /obj/item/weapon/gun/ballistic/automatic/pistol/n99
	mask = /obj/item/clothing/mask/gas/sechailer
	back = /obj/item/weapon/minigunpack
	l_pocket = /obj/item/device/radio
	r_pocket = /obj/item/clothing/glasses/night
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak=2, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, /obj/item/ammo_box/magazine/m10mm_adv = 2)

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
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/ncr/soldier
	head = /obj/item/clothing/head/helmet/f13/trooper
	glasses = /obj/item/clothing/glasses/f13/biker
	belt = /obj/item/weapon/storage/belt/military/army
	back = /obj/item/weapon/gun/ballistic/automatic/assault_rifle
	l_pocket = /obj/item/device/radio
	belt_contents = list(/obj/item/weapon/reagent_containers/pill/patch/stimpak=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, /obj/item/ammo_box/magazine/m556 = 2)