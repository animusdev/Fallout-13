/datum/job/colonel
	title = "Colonel"
	desc = "No description."
	flag = COLONEL
	department_head = list("Enclave command")
	department_flag = MEDSCI
	faction = "enclave"
	status = "colonel"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Enclave command"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/colonel

	access = list()
	minimal_access = list()

/datum/outfit/job/colonel
	name = "Colonel"


/datum/job/encl_sergeant
	title = "Sergeant"
	desc = "No description."
	flag = ENCL_SERGEANT
	department_head = list("Colonel")
	department_flag = MEDSCI
	faction = "enclave"
	status = "encl_sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/encl_sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/encl_sergeant
	name = "Enclave Segeant"

/datum/job/encl_private
	title = "Private"
	desc = "No description."
	flag = ENCL_PRIVATE
	department_head = list("Colonel", "Sergeant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "private"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Colonel, sergeant"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/encl_private

	access = list()
	minimal_access = list()

/datum/outfit/job/encl_private
	name = "Enclave Private"

/datum/job/encl_volunteer
	title = "Volunteer"
	desc = "No description."
	flag = VOLUNTEER
	department_head = list("Colonel", "Sergeant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "volunteer"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Colonel, sergeant"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "super_ten")

	outfit = /datum/outfit/job/encl_volunteer

	access = list()
	minimal_access = list()

/datum/outfit/job/encl_volunteer
	name = "Enclave Volunteer"