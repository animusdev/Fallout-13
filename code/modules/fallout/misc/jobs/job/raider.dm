//Fallout 13 Raider faction roles

/datum/job/raider
	title = "Raider"
	desc = "A bloodthirsty savage.<br>You have broken all of the existing rules but one - Gang Leader is your supreme commander, the powerful Godfather of all bandits, the only one you trust with your life."
	flag = RAIDER
	department_head = list("gangleader")
	department_flag = WASTELAND
	faction = "raiders"
	status = "raider"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "the Gang Leader"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/raider

	allowed_packs = list("starter", "super_ten", "raiders_pack")

	required_items = list(
	/obj/item/weapon/golf9,
	/obj/item/weapon/restraints/legcuffs/bola/raider,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin
	)

/datum/outfit/job/raider
	name = "Raider"
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/jackboots

/datum/job/gangleader
	title = "Gang Leader"
	desc = "No description."
	flag = GANGLEAD
	department_flag = MEDSCI
	faction = "raiders"
	status = "gangleader"
	total_positions = 1
	spawn_positions = 1
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/gangleader

	allowed_packs = list("starter", "super_ten", "madmax")

/datum/outfit/job/gangleader
	name = "Gang Leader"
	uniform = /obj/item/clothing/under/f13/brahmin
	shoes = /obj/item/clothing/shoes/f13/tan