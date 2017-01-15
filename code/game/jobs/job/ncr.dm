/datum/job/squad_leader
	title = "NCR Squad Leader"
	flag = SQDLEAD
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Squad Leader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#020070"
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
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/deagle
	backpack_contents = list(/obj/item/ammo_box/magazine/m50 = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/ranger
	title = "NCR Ranger"
	flag = RANGER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Ranger"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#020070"
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
	head = /obj/item/clothing/head/helmet/f13/rangercombat
	glasses = /obj/item/clothing/glasses/night
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/ammo_box/magazine/m556 = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/elite_trooper
	title = "NCR Elite Trooper"
	flag = SERGEANT
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Elite Trooper"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#020070"
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
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/ammo_box/magazine/m556 = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/trooper
	title = "NCR Trooper"
	flag = TROOPER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Trooper"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#020070"
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
	suit = /obj/item/clothing/suit/armor/f13/ncrarmor
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	backpack_contents = list(/obj/item/ammo_box/magazine/m10mm_adv = 2, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1)
	ears = /obj/item/device/radio/headset/headset_ncr