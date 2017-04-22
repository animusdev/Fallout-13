/datum/job/wastelander
	title = "Adventurer"
	desc = "No description."
	flag = ADVENTURER
	department_flag = WASTELAND
	faction = "none" //desert faction shall disable appearing as scavenger after readying
	status = "none"
	total_positions = -1
	spawn_positions = -1 //does not matter for late join
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/adventurer

	allowed_packs = list("starter", "super_ten", "madmax")

/datum/outfit/job/adventurer
	name = "Adventurer"
	uniform = /obj/item/clothing/under/f13/brahmin
	shoes = /obj/item/clothing/shoes/f13/tan