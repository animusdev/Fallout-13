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

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	outfit = /datum/outfit/job/colonel

	access = list()
	minimal_access = list()

/datum/outfit/job/colonel
	name = "Colonel"


/datum/job/enclave_sergeant
	title = "Sergeant"
	desc = "No description."
	flag = ENCLAVE_SERGEANT
	department_head = list("Colonel")
	department_flag = MEDSCI
	faction = "enclave"
	status = "enclave_sergeant"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Colonel"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	outfit = /datum/outfit/job/enclave_sergeant

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave_sergeant
	name = "Enclave Segeant"

/datum/job/enclave_private
	title = "Private"
	desc = "No description."
	flag = ENCLAVE_PRIVATE
	department_head = list("Colonel", "Sergeant")
	department_flag = MEDSCI
	faction = "enclave"
	status = "private"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Colonel, sergeant"
	selection_color = "#ec9d9d"
	minimal_player_age = 7

	allowed_packs = list("starter", "cigarettes", "bard", "super_ten")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/shoes/f13/explorer,
	/obj/item/clothing/under/f13/mercadv,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/under/f13/bodyguard,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/armor/f13/kit,
	/obj/item/clothing/suit/armor/f13/leatherarmor,
	/obj/item/clothing/suit/armor/f13/bmetalarmor,
	/obj/item/clothing/head/helmet/f13/tribal,
	/obj/item/clothing/head/helmet/f13/eyebot
	)

	denied_items = list(
	/obj/item/clothing/shoes/f13/rag,
	/obj/item/clothing/under/pants/f13/ghoul,
	/obj/item/clothing/under/pants/f13/cloth,
	/obj/item/clothing/under/pants/f13/caravan,
	/obj/item/clothing/under/f13/rag,
	/obj/item/clothing/under/f13/tribal,
	/obj/item/clothing/under/f13/female/tribal,
	/obj/item/clothing/under/f13/settler,
	/obj/item/clothing/under/f13/brahmin,
	/obj/item/clothing/under/f13/female/brahmin,
	/obj/item/clothing/suit/f13/mantle_liz
	)

	outfit = /datum/outfit/job/enclave_private

	access = list()
	minimal_access = list()

/datum/outfit/job/enclave_private
	name = "Enclave Private"