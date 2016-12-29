var/human_status = list()

proc/get_status_datum(status)
	if(!human_status[status])
		return null
	return human_status[status]

/datum/status
	var/name = "UNKNOWN"

	var/desc = ""

	var/welcome_text = ""

	var/verbs = list()

	var/change_faction = 1

	var/purge_faction = null

	var/list/can_invite_to = new()

	var/can_invite_to_himself = 0

	var/color = ""

/datum/status/New()
	..()
	if(can_invite_to_himself)
		can_invite_to += "[name]"
	if(name != "Wastelander")
		verbs += /mob/proc/convert_to_wastelander
	if(can_invite_to.len)
		verbs += /mob/proc/convert_to_status

mob/proc/set_status(var/status)
	var/datum/status/S = get_status_datum(status)
	var/datum/status/last_S = get_status_datum(src.status)
	if(!S)
		return 0
	if(last_S)
		src.verbs -= last_S.verbs


	src.status = S.name
	var/text
	text += "Now you are <span style='color: [S.color]'>[S.name]</span>"
	if(S.welcome_text)
		text += "<br>[S.welcome_text]"
	src << text
	src.verbs += S.verbs

	if(S.purge_faction != null)
		src.set_faction(S.purge_faction)

	return 1

/mob/proc/convert_to_wastelander()
	set name = "Become Wastelander"
	set category = "Abilities"
	if(status == "Wastelander")
		return
	if(alert("You are sure?",,"Yes","No")=="No")
		return
	set_status("Wastelander")


/mob/proc/convert_to_status(mob/M in oview(), status in get_can_invite_status())
	set name = "Invite To"
	set category = "Abilities"
	if(!M.mind || !M.client)
		return
	if(M.status == status)
		return
	if(alert(M, "[src.name] invite you to be [status]?",,"Yes","No")=="No")
		src << "<span class='warning'>[M.name] refused your suggestion</span>"
		return
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

/datum/status/legion/vexillarius
	name = "Vexillarius"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan")

/datum/status/legion/centurion
	name = "Centurion"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan", "Vexillarius")

/datum/status/legion/legat
	name = "Legat"
	change_faction = 1
	can_invite_to = list("Recruit", "Decan", "Vexillarius", "Legat")

/datum/status/ncr/ranger
	name = "Ranger"
	change_faction = 1
	can_invite_to = list("Recruit")
/datum/status/ncr/sergeant
	name = "Sergeant"
	change_faction = 1
	can_invite_to = list("Recruit", "Ranger")

/datum/status/raider
	name = "Raider"
	purge_faction = "Wasteland"
	can_invite_to_himself = 1
	color = "#FF0000"

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


/datum/status/vault/overseer
	name = "Overseer"
	can_invite_to = list("Member")
	purge_faction = "Vault"
