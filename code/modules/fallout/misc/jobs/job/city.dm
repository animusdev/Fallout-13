/datum/job/mayor
	title = "Mayor"
	desc = "A trustworthy authority.<br>You were chosen to guide them, now you have to choose: carrot or stick."
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

	allowed_packs = list("starter", "cigarettes", "team_fortress", "wardrobe", "bard", "khan", "super_ten", "punk", "off", "madmax", "doom")

	required_items = list(
	/obj/item/clothing/shoes/f13/tan,
	/obj/item/clothing/under/suit_jacket,
	/obj/item/clothing/under/f13/gentlesuit,
	/obj/item/clothing/under/f13/female/mercadv,
	/obj/item/clothing/under/f13/female/merccharm,
	/obj/item/clothing/under/f13/doctor,
	/obj/item/clothing/under/f13/female/doctor,
	/obj/item/clothing/under/f13/bodyguard,
	/obj/item/clothing/suit/f13/duster,
	/obj/item/clothing/suit/f13/cowboygvest,
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

/datum/outfit/job/mayor
	name = "Mayor"
	backpack = null
	satchel = null
	uniform = /obj/item/clothing/under/f13/formal
	shoes = /obj/item/clothing/shoes/laceup
	suit = null
	head = /obj/item/clothing/head/f13/beaver

/datum/job/sheriff
	title = "Sheriff"
	desc = "A fearless lawkeeper.<br>You were chosen to protect them, now you have to choose: word or sword."
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

	allowed_packs = list("starter", "super_ten")

/datum/outfit/job/sheriff
	name = "Sheriff"
	uniform = /obj/item/clothing/under/f13/cowboyb
	shoes = /obj/item/clothing/shoes/workboots
	suit = /obj/item/clothing/suit/f13/sheriff
	head = /obj/item/clothing/head/f13/cowboy
	weapon = /obj/item/weapon/gun/ballistic/automatic/pistol/m1911
	glasses = /obj/item/clothing/glasses/sunglasses
	back = /obj/item/weapon/gun/ballistic/shotgun