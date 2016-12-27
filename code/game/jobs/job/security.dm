//Warden and regular officers add this result to their get_access()
/datum/job/proc/check_config_for_sec_maint()
	if(config.jobs_have_maint_access & SECURITY_HAS_MAINT_ACCESS)
		return list(access_maint_tunnels)
	return list()

/*
Head of Security
*/
/*
/datum/job/hos
	title = "Head of Security"
	flag = HOS
	department_head = list("Overseer")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the overseer"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	minimal_player_age = 14

	outfit = /datum/outfit/job/hos

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway)

/datum/outfit/job/hos
	name = "Head of Security"

	id = /obj/item/weapon/card/id/silver
	gloves = /obj/item/clothing/gloves/pda/heads/hos
	ears = /obj/item/device/radio/headset/heads/hos/alt
	uniform = /obj/item/clothing/under/f13/vault/v13
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/hos/trenchcoat
	//gloves = /obj/item/clothing/gloves/color/black/hos
	head = /obj/item/clothing/head/HoS/beret
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic=1,\
		/obj/item/weapon/restraints/handcuffs=1)

	backpack = /obj/item/weapon/storage/backpack/security
	satchel = /obj/item/weapon/storage/backpack/satchel_sec

/datum/outfit/job/hos/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

	announce_head(H, list("Security")) //tell underlings (security radio) they have a head
	*/
/*
Warden
*/
/*
/datum/job/warden
	title = "Warden"
	flag = WARDEN
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/warden

	access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_maint_tunnels, access_morgue, access_weapons, access_forensics_lockers)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_armory, access_court, access_weapons) //See /datum/job/warden/get_access()

/datum/job/warden/get_access()
	var/list/L = list()
	L = ..() | check_config_for_sec_maint()
	return L

/datum/outfit/job/warden
	name = "Warden"

	gloves = /obj/item/clothing/gloves/pda/warden
	ears = /obj/item/device/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/f13/vault/v13
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/warden
	//gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/warden
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses
	l_pocket = /obj/item/device/assembly/flash/handheld
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic=1,\
		/obj/item/weapon/restraints/handcuffs=1)

	backpack = /obj/item/weapon/storage/backpack/security
	satchel = /obj/item/weapon/storage/backpack/satchel_sec

/datum/outfit/job/warden/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(visualsOnly)
		return

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()
*/
/*
Ranger
*/
/datum/job/detective
	title = "Ranger"
	flag = DETECTIVE
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "NCR"
	status = "Ranger"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffddf0"
	minimal_player_age = 7

	outfit = /datum/outfit/job/detective

	access = list()
	minimal_access = list()

/datum/outfit/job/detective
	name = "Ranger"
	gloves = /obj/item/clothing/gloves/combat
	uniform = /obj/item/clothing/under/f13/cowboyb
	shoes = /obj/item/clothing/shoes/combat/swat
	suit = /obj/item/clothing/suit/armor/f13/rangercombat
	head = /obj/item/clothing/head/helmet/f13/rangercombat
	glasses = /obj/item/clothing/glasses/night
	//suit_store = /obj/item/weapon/gun/projectile/automatic/assault_rifle
	backpack_contents = list(/obj/item/weapon/gun/projectile/automatic/pistol/deagle = 1, \
		/obj/item/weapon/restraints/handcuffs=2, \
		/obj/item/weapon/reagent_containers/pill/patch/stimpak = 1, \
		/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
		/obj/item/weapon/melee/classic_baton/telescopic=1)
	mask = /obj/item/clothing/mask/gas/sechailer
	ears = /obj/item/device/radio/headset/headset_ncr
	/*
Legion
*/
//recruit
/datum/job/legrecruit
	title = "Legion Recruit"
	flag = LEGRECRUIT
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Legion"
	status = "Recruit"
	total_positions = 10
	spawn_positions = 10
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/legrecruit

	access = list()
	minimal_access = list()

/datum/outfit/job/legrecruit
	name = "Legion Recruit"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legrecruit/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legrecruit
	glasses = /obj/item/clothing/glasses/sunglasses/legion
	mask = /obj/item/clothing/mask/bandana/legrecruit
	suit_store = /obj/item/weapon/gun/projectile/shotgun/boltaction
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel_norm
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/stack/coin/coins = 1, \
	/obj/item/weapon/machete = 1)

//decan
/datum/job/legdecan
	title = "Legion Decan"
	flag = LEGDECAN
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Legion"
	status = "Decan"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/legdecan

	access = list()
	minimal_access = list()

/datum/outfit/job/legdecan
	name = "Legion Decan"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legdecan/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/legionleather
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legrecruit
	head = /obj/item/clothing/head/helmet/f13/legdecan
	glasses = /obj/item/clothing/glasses/sunglasses/legion
	mask = /obj/item/clothing/mask/bandana/legdecan
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel_norm
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/stack/coin/coins = 3, \
	/obj/item/weapon/machete = 1)

//vexillarius
/datum/job/legvex
	title = "Legion Vexillarius"
	flag = LEGVEX
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Legion"
	status = "Vexillarius"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/legvex

	access = list()
	minimal_access = list()

/datum/outfit/job/legvex
	name = "Legion Vexillarius"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legvex/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legvexil
	head = /obj/item/clothing/head/helmet/f13/legvexil
	glasses = /obj/item/clothing/glasses/sunglasses/legion
	suit_store = /obj/item/weapon/gun/projectile/shotgun/boltaction
	back = /obj/item/weapon/storage/backpack
	backpack = /obj/item/weapon/storage/backpack
	ears = /obj/item/device/radio/headset/headset_leg
	satchel = /obj/item/weapon/storage/backpack/satchel_norm
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/stack/coin/coins = 3, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/weapon/machete = 1, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 4)

//centurion
/datum/job/legcenturion
	title = "Legion Centurion"
	flag = LEGCENTURION
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Legion"
	status = "Centurion"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/legcenturion

	access = list()
	minimal_access = list()

/datum/outfit/job/legcenturion
	name = "Legion Centurion"
	id = null
	ears = null
	belt = null

/datum/outfit/job/legcenturion/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/legionmetal
	gloves = /obj/item/clothing/gloves/f13/legion
	suit = /obj/item/clothing/suit/armor/f13/legcenturion
	head = /obj/item/clothing/head/helmet/f13/legcenturion
	glasses = /obj/item/clothing/glasses/sunglasses/legion
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
	ears = /obj/item/device/radio/headset/headset_leg
	backpack = /obj/item/weapon/storage/backpack
	satchel = /obj/item/weapon/storage/backpack/satchel_norm
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/coin/coins = 3, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/weapon/powergauntlet = 1)

//legat
/datum/job/leglegat
	title = "Legion Legat"
	flag = LEGLEGAT
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Legion"
	status = "Legat"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7

	outfit = /datum/outfit/job/leglegat

	access = list()
	minimal_access = list()

/datum/outfit/job/leglegat
	name = "Legion Legat"
	id = null
	ears = null
	belt = null

/datum/outfit/job/leglegat/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(/obj/item/clothing/under/pants/f13/caravan)
	shoes = /obj/item/clothing/shoes/legionlegat
	gloves = /obj/item/clothing/gloves/f13/legionlegat
	suit = /obj/item/clothing/suit/armor/f13/leglegat
	head = /obj/item/clothing/head/helmet/f13/leglegat
	glasses = /obj/item/clothing/glasses/sunglasses/legion
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	back = /obj/item/weapon/storage/backpack
	ears = /obj/item/device/radio/headset/headset_leg
	backpack = /obj/item/weapon/storage/backpack
	satchel = /obj/item/weapon/storage/backpack/satchel_norm
	backpack_contents = list(/obj/item/weapon/restraints/handcuffs=1, \
	/obj/item/weapon/storage/wallet=1, \
	/obj/item/weapon/reagent_containers/food/drinks/flask/survival=1, \
	/obj/item/stack/coin/coins = 3, \
	/obj/item/weapon/reagent_containers/pill/patch/healpowder = 1, \
	/obj/item/weapon/powergauntlet = 1)
/*
Security Officer
*/
/datum/job/officer
	title = "Security Officer"
	flag = OFFICER
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Vault"
	status = "Member"
	total_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	spawn_positions = 8 //Handled in /datum/controller/occupations/proc/setup_officer_positions()
	supervisors = "the head of security, and the head of your assigned department (if applicable)"
	selection_color = "#ccccff"
	minimal_player_age = 7

	outfit = /datum/outfit/job/security

	access = list(access_security, access_sec_doors, access_brig, access_court, access_maint_tunnels, access_morgue, access_weapons, access_forensics_lockers)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_court, access_weapons) //But see /datum/job/warden/get_access()

/datum/job/officer/get_access()
	var/list/L = list()
	L |= ..() | check_config_for_sec_maint()
	return L

var/list/sec_departments = list("engineering", "supply", "medical", "science")

/datum/outfit/job/security
	name = "Security Officer"

	gloves = /obj/item/clothing/gloves/pda/security
	ears = /obj/item/device/radio/headset/headset_vlt
	uniform = /obj/item/clothing/under/f13/vault/v13
	//gloves = /obj/item/clothing/gloves/color/black
	//head = /obj/item/clothing/head/helmet/sec
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/jackboots
	l_pocket = /obj/item/device/assembly/flash/handheld
	suit_store = /obj/item/weapon/gun/projectile/automatic/pistol/n99
	backpack_contents = list(/obj/item/weapon/melee/classic_baton/telescopic=1,\
		/obj/item/weapon/restraints/handcuffs=1)

	backpack = /obj/item/weapon/storage/backpack/security
	satchel = /obj/item/weapon/storage/backpack/satchel_sec
	box = /obj/item/weapon/storage/box/security

	var/department = null
	var/tie = null
	var/list/dep_access = null
	var/destination = null
	var/spawn_point = null

/datum/outfit/job/security/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	if(sec_departments.len)
		department = pick(sec_departments)
		if(!visualsOnly)
			sec_departments -= department
		switch(department)
			if("supply")
				//ears = /obj/item/device/radio/headset/headset_sec/alt/department/supply
				dep_access = list(access_mailsorting, access_mining)
				destination = /area/security/checkpoint/supply
				spawn_point = locate(/obj/effect/landmark/start/depsec/supply) in department_security_spawns
				tie = /obj/item/clothing/tie/armband/cargo
			if("engineering")
				//ears = /obj/item/device/radio/headset/headset_sec/alt/department/engi
				dep_access = list(access_construction, access_engine)
				destination = /area/security/checkpoint/engineering
				spawn_point = locate(/obj/effect/landmark/start/depsec/engineering) in department_security_spawns
				tie = /obj/item/clothing/tie/armband/engine
			if("medical")
				//ears = /obj/item/device/radio/headset/headset_sec/alt/department/med
				dep_access = list(access_medical)
				destination = /area/security/checkpoint/medical
				spawn_point = locate(/obj/effect/landmark/start/depsec/medical) in department_security_spawns
				tie =  /obj/item/clothing/tie/armband/medblue
			if("science")
				//ears = /obj/item/device/radio/headset/headset_sec/alt/department/sci
				dep_access = list(access_research)
				destination = /area/security/checkpoint/science
				spawn_point = locate(/obj/effect/landmark/start/depsec/science) in department_security_spawns
				tie = /obj/item/clothing/tie/armband/science

/datum/outfit/job/security/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()

	var/obj/item/clothing/under/U = H.w_uniform
	if(tie)
		U.attachTie(new tie)

	if(visualsOnly)
		return

	var/obj/item/weapon/implant/loyalty/L = new/obj/item/weapon/implant/loyalty(H)
	L.imp_in = H
	L.implanted = 1
	H.sec_hud_set_implants()

	var/obj/item/weapon/card/id/W = H.wear_id
	W.access |= dep_access

	var/teleport = 0
	if(!config.sec_start_brig)
		if(destination || spawn_point)
			teleport = 1
	if(teleport)
		var/turf/T
		if(spawn_point)
			T = get_turf(spawn_point)
			H.Move(T)
		else
			var/safety = 0
			while(safety < 25)
				T = safepick(get_area_turfs(destination))
				if(T && !H.Move(T))
					safety += 1
					continue
				else
					break
	H << "<b>You have been assigned to [department]!</b>"

/obj/item/device/radio/headset/headset_sec/department/New()
	wires = new(src)
	secure_radio_connections = new

	initialize()
	recalculateChannels()

/obj/item/device/radio/headset/headset_sec/alt/department/engi
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_eng

/obj/item/device/radio/headset/headset_sec/alt/department/supply
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_cargo

/obj/item/device/radio/headset/headset_sec/alt/department/med
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_med

/obj/item/device/radio/headset/headset_sec/alt/department/sci
	keyslot = new /obj/item/device/encryptionkey/headset_sec
	keyslot2 = new /obj/item/device/encryptionkey/headset_sci
