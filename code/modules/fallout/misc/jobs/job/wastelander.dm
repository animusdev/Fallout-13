/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = WASTELAND
	desc = "A true child of wasteland.<br>In badlands you are born, in badlands lays your grave."
	faction = "none"
	status = "none"
	total_positions = 10
	spawn_positions = 10
	supervisors = "none"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/settler

	allowed_packs = list("starter", "cigarettes")

/datum/outfit/job/settler
	name = "Settler"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/job/adventurer
	title = "Adventurer"
	desc = "A life is a journey.<br>You are free to choose what kind of a journey it is."
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

	allowed_packs = list("starter", "cigarettes", "super_ten", "madmax")

/datum/outfit/job/adventurer
	name = "Adventurer"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/mercadv
	shoes = /obj/item/clothing/shoes/f13/tan

/datum/job/mercenary
	title = "Mercenary"
	desc = "A peaceful ways, are not always the best ways.<br>No sense to waste time for diplomacy, when you can shoot bad guys and earn yourself a fortune."
	flag = MERCENARY
	department_flag = MEDSCI
	faction = "none"
	status = "none"
	total_positions = -1
	spawn_positions = -1
	supervisors = "nobody"
	selection_color = "#ece19d"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/mercenary

	allowed_packs = list("starter", "cigarettes", "super_ten", "madmax")

/datum/outfit/job/mercenary
	name = "Mercenary"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/merccharm
	shoes = /obj/item/clothing/shoes/f13/combat
	suit = /obj/item/clothing/suit/f13/veteran