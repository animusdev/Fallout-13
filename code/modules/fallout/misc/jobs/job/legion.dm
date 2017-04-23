//Fallout 13 Legion faction directory

/datum/job/legate
	title = "Legate"
	desc = "No description."
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

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/leglegate

	access = list()
	minimal_access = list()

/datum/outfit/job/leglegate
	name = "Legate"
	uniform = /obj/item/clothing/under/pants/f13/caravan
	shoes = /obj/item/clothing/shoes/f13/military/legionlegate
	gloves = /obj/item/clothing/gloves/f13/legionlegate
	suit = /obj/item/clothing/suit/armor/f13/leglegate
	head = /obj/item/clothing/head/helmet/f13/leglegate
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/automatic/rifle

//centurion
/datum/job/centurion
	title = "Centurion"
	desc = "No description."
	flag = LEGCENTURION
	department_head = list("legate")
	department_flag = WASTELAND
	faction = "legion"
	status = "centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/legcenturion

	access = list()
	minimal_access = list()

/datum/outfit/job/legcenturion
	name = "Centurion"
	uniform = /obj/item/clothing/under/pants/f13/caravan
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legcenturion
	head = /obj/item/clothing/head/helmet/f13/legcenturion
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope

//vexillarius
/datum/job/vex
	title = "Vexillarius"
	desc = "No description."
	flag = LEGVEX
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "vexillarius"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the legate"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/legvex

	access = list()
	minimal_access = list()

/datum/outfit/job/legvex
	name = "Vexillarius"
	uniform = /obj/item/clothing/under/pants/f13/caravan
	shoes = /obj/item/clothing/shoes/f13/military/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legvexil
	head = /obj/item/clothing/head/helmet/f13/legvexil
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle/scope

//decan
/datum/job/decan
	title = "Decanus"
	desc = "No description."
	flag = LEGDECAN
	department_head = list("legate", "centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "decanus"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/legdecan

	access = list()
	minimal_access = list()

/datum/outfit/job/legdecan
	name = "Decanus"
	uniform = /obj/item/clothing/under/pants/f13/caravan
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legdecan
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legdecan
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle

//prime
/datum/job/prime
	title = "Prime"
	desc = "No description."
	flag = PRIME
	department_head = list("Centurion")
	department_flag = WASTELAND
	faction = "legion"
	status = "prime"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the centurion"
	selection_color = "#ec9d9d"
	minimal_player_age = 7
	disallowed_gender = FEMALE

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/prime

	access = list()
	minimal_access = list()

/datum/outfit/job/prime
	name = "Prime"
	uniform = /obj/item/clothing/under/pants/f13/caravan
	shoes = /obj/item/clothing/shoes/f13/military/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legrecruit
	glasses = /obj/item/clothing/glasses/sunglasses/f13/legion
	mask = /obj/item/clothing/mask/bandana/f13/legrecruit
	weapon = /obj/item/weapon/gun/ballistic/shotgun/rifle
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1)
