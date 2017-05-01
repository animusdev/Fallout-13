/datum/job/elder
	title = "Elder"
	desc = "No description."
	flag = ELDER
	department_head = list("BS command")
	department_flag = ENGSEC
	faction = "bs"
	status = "elder"
	total_positions = 1
	spawn_positions = 1
	supervisors = "BS command"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/elder

	access = list()
	minimal_access = list()

/datum/outfit/job/elder
	name = "Elder"


/datum/job/paladin
	title = "Paladin"
	desc = "No description."
	flag = PALADIN
	department_head = list("Elder")
	department_flag = ENGSEC
	faction = "bs"
	status = "paladin"
	total_positions = 1
	spawn_positions = 1
	supervisors = "elder"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/paladin

	access = list()
	minimal_access = list()

/datum/outfit/job/paladin
	name = "Paladin"

/datum/job/knight
	title = "Knight"
	desc = "No description."
	flag = KNIGHT
	department_head = list("Elder", "Paladin")
	department_flag = ENGSEC
	faction = "bs"
	status = "knight"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Elder, Paladin"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/knight

	access = list()
	minimal_access = list()

/datum/outfit/job/knight
	name = "Knight"