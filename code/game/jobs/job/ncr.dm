/datum/job/ranger
	title = "Ranger"
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
	name = "Ranger"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/rangercombat
	glasses = /obj/item/clothing/glasses/night
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/weapon/gun/projectile/automatic/pistol/deagle = 1, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset/headset_ncr

/datum/job/sergeant
	title = "Sergeant"
	flag = SERGEANT
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#02005C"
	minimal_player_age = 7

	whitelist_on = 1

	outfit = /datum/outfit/job/sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/sergeant
	name = "Sergeant"
	id = null
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/ncr
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/power_armor/ncr
	head = /obj/item/clothing/head/helmet/power_armor/ncr
	glasses = /obj/item/clothing/glasses/night
	suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/weapon/gun/projectile/automatic/pistol/deagle = 1, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset/headset_ncr