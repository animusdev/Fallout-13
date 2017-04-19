/datum/job/mayor
	title = "Mayor"
	flag = MAYOR
	department_flag = WASTELAND
	faction = "city"
	status = "mayor"
	total_positions = 1
	spawn_positions = 1
	supervisors = "nobody"
	selection_color = "#804B00"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/mayor

/datum/outfit/job/mayor
	name = "Mayor"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null

/datum/job/sheriff
	title = "Sheriff"
	flag = SHERIFF
	department_flag = WASTELAND
	faction = "city"
	status = "sheriff"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Mayor"
	selection_color = "#804B00"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/sheriff

/datum/outfit/job/sheriff
	name = "Sheriff"
	uniform = /obj/item/clothing/under/f13/cowboyb
	shoes = /obj/item/clothing/shoes/workboots
	suit = /obj/item/clothing/suit/f13/sheriff
	head = /obj/item/clothing/head/f13/cowboy
	weapon = /obj/item/weapon/gun/ballistic/automatic/pistol/m1911
	glasses = /obj/item/clothing/glasses/sunglasses
	back = /obj/item/weapon/gun/ballistic/shotgun

/datum/job/settler
	title = "Settler"
	flag = SETTLER
	department_flag = WASTELAND
	desc = "No description."
	faction = "city"
	status = "member"
	total_positions = 10
	spawn_positions = 10
	supervisors = "Mayor"
	selection_color = "#804B00"
	access = list()
	minimal_access = list()
	outfit = /datum/outfit/job/settler

/datum/outfit/job/settler
	name = "Settler"
	id = null
	ears = null
	belt = null
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/settler