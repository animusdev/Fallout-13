/*
Raider
*/
/datum/job/raider
	title = "Raider"
	desc = "No description."
	flag = RAIDER
	department_flag = WASTELAND
	faction = "raiders" //desert faction shall disable appearing as scavenger after readying
	status = "raider"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "gang leader"
	department_head = list("gang leader")
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/raider

	allowed_packs = list("starter", "super_ten", "raiders_pack")

	required_items = list(
	/obj/item/clothing/under/f13/merccharm,
	/obj/item/clothing/suit/armor/f13/supafly
	)

/datum/outfit/job/raider
	name = "Raider"
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/jackboots

/datum/job/gang_leader
	title = "Gang Leader"
	desc = "No description."
	flag = GANGLEAD
	department_flag = MEDSCI
	faction = "raiders"
	status = "gang_leader"
	total_positions = -1
	spawn_positions = -1
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/gang_leader

	allowed_packs = list("starter", "super_ten", "madmax")

/datum/outfit/job/gang_leader
	name = "Mercenarie"
	uniform = /obj/item/clothing/under/f13/brahmin
	shoes = /obj/item/clothing/shoes/f13/tan