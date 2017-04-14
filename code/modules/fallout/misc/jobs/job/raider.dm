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
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/raider

/datum/outfit/job/raider
	name = "Raider"
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/weapon/reagent_containers/food/drinks/flask/survival
	r_pocket = /obj/item/device/flashlight/torch