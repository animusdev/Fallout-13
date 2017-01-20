var/human_status = list()

proc/get_status_datum(status)
	if(!human_status[status])
		return null
	return human_status[status]

proc/remove_everyone_from_status(status)
	var/datum/status/S = get_status_datum(status)
	if(!S)
		return 0
	for(var/mob/M in world)
		if(M.status == S.name)
			M.set_status("Wastelander")

/datum/status
	var/name = "UNKNOWN"

	var/desc = ""

	var/welcome_text = ""

	var/verbs = list()

	var/change_faction = 1

	var/purge_faction = null

	var/list/can_invite_to = new()

	var/can_invite_to_himself = 0

	var/color = "#171717"

	var/craft_recipes = list()

	var/flag = null

/datum/status/New()
	..()
	if(can_invite_to_himself)
		can_invite_to += "[name]"
	if(name != "Wastelander")
		verbs += /mob/proc/convert_to_wastelander
	if(can_invite_to.len)
		verbs += /mob/proc/convert_to_status

mob/proc/get_flag()
	var/datum/status/S = get_status_datum(src.status)
	var/datum/f13_faction/F = get_faction_datum(faction)

	if(!S.flag)
		return F.flag
	return null

mob/proc/set_status(var/status)
	var/datum/status/S = get_status_datum(status)
	var/datum/status/last_S = get_status_datum(src.status)
	if(!S)
		return 0
	if(last_S)
		src.verbs -= last_S.verbs
		src.allow_recipes -= last_S.craft_recipes


	src.status = S.name
	var/text
	text += "<span class='notice'>Now you are <span style='color: [S.color];'>[S.name]</span>.</span>"
	if(S.welcome_text)
		text += "<br>[S.welcome_text]"
	src << text
	src.verbs += S.verbs
	src.allow_recipes += S.craft_recipes
	if(S.purge_faction != null)
		src.set_faction(S.purge_faction)

	return 1

/mob/proc/convert_to_wastelander()
	set name = "Become Wastelander"
	set category = "Faction"
	if(status == "Wastelander")
		return
	if(alert("You are sure?",,"Yes","No")=="No")
		return
	set_status("Wastelander")


/mob/proc/convert_to_status(mob/M in oview(), status in get_can_invite_status())
	set name = "Invite To"
	set category = "Faction"
	if(!M.mind || !M.client)
		return
	if(M.status == status)
		return
	if(alert(M, "[src.name] invite you to be [status]?",,"Yes","No")=="No")
		src << "<span class='warning'>[M.name] refused your suggestion.</span>"
		return
	else
		src << "<span class='notice'>[M.name] accepted your suggestion.</span>"
	var/datum/status/S = get_status_datum(status)
	if(S && S.change_faction)
		M.set_faction(src.faction)
	M.set_status(status)
/mob/proc/get_can_invite_status()
	var/datum/status/S = get_status_datum(src.status)
	return S.can_invite_to

//***Status***

/datum/status/recruit
	name = "Recruit"
	change_faction = 1

/datum/status/legion/decan
	name = "Decan"
	change_faction = 1
	can_invite_to = list("Recruit")
	color = "#A6423B"
/datum/status/legion/vexillarius
	name = "Vexillarius"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan")
	craft_recipes = list(/datum/table_recipe/legion_vex_armor, /datum/table_recipe/legion_vex_helm)
	color = "#983C36"
/datum/status/legion/centurion
	name = "Centurion"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan", "Vexillarius")
	craft_recipes = list(/datum/table_recipe/legion_cent_armor, /datum/table_recipe/legion_cent_helm)
	color = "#8D3731"
/datum/status/legion/legat
	name = "Legat"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan", "Vexillarius", "Legat")
	craft_recipes = list(/datum/table_recipe/legion_legat_armor, /datum/table_recipe/legion_legat_helm, \
	/datum/table_recipe/legion_legat_gloves, /datum/table_recipe/legion_legat_shoes)
	color = "#7A302A"
/datum/status/ncr/ranger
	name = "Ranger"
	change_faction = 1
//	can_invite_to = list("Recruit")
	craft_recipes = list(/datum/table_recipe/ncr_ranger_helm, /datum/table_recipe/ncr_ranger_armor)
	color = "#020070"

/datum/status/ncr/squad_leader
	name = "Squad Leader"
	change_faction = 1
	can_invite_to = list("Recruit", "Ranger", "Trooper", "Elite Trooper")
	color = "#02005C"

/datum/status/ncr/trooper
	name = "Trooper"
	change_faction = 1
//	can_invite_to = list("Recruit", "Ranger")
	color = "#02005C"

/datum/status/ncr/elite_trooper
	name = "Elite Trooper"
	change_faction = 1
//	can_invite_to = list("Recruit", "Ranger")
	color = "#02005C"
/datum/status/raider
	name = "Raider"
	purge_faction = "Wasteland"
	can_invite_to_himself = 1
	color = "#FF0000"
	craft_recipes = list(/datum/table_recipe/raider_yankee_armor, /datum/table_recipe/raider_supafly_armor, \
	/datum/table_recipe/raider_supafly_helmet, /datum/table_recipe/raider_yankee_helmet)

/datum/status/wastelander
	name = "Wastelander"
	purge_faction = "Wasteland"

/datum/status/member
	name = "Member"
	change_faction = 1

/datum/status/den/sheriff
	name = "Sheriff"
	can_invite_to = list("Member")
	purge_faction = "Den"
	color = "#704200"


/datum/status/vault/overseer
	name = "Overseer"
	can_invite_to = list("Member")
	purge_faction = "Vault"
	color = "#00491A"
