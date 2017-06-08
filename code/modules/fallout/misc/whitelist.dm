#define WHITELISTFILE "config/whitelist.txt"


/proc/load_whitelist()
	var/list/whitelist = list()
	for(var/line in file2list(WHITELISTFILE))
		if(!line)
			continue
		if(findtextEx(line,"#",1,2))
			continue
		whitelist += ckey(line)

	if(!whitelist.len)
		whitelist = null
	return whitelist

/proc/check_whitelist(var/ckey)
	if(!config.whitelist)
		return FALSE
	. = (ckey(ckey) in config.whitelist)

/datum/admins/proc/add_whitelist(nickname as text)
	set category = "Admin"
	set name = "Add Player To Whitelist"
	nickname = ckey(nickname)
	if(nickname in config.whitelist)
		to_chat(usr, "Player already in whitelist")
		return
	config.whitelist += nickname

/datum/admins/proc/remove_whitelist(nickname as text)
	set category = "Admin"
	set name = "Remove Player From Whitelist"
	nickname = ckey(nickname)
	if(!(nickname in config.whitelist))
		to_chat(usr, "No player in whitelist")
		return
	config.whitelist -= nickname

/datum/admins/proc/who_whitelist()
	set category = "Admin"
	set name = "Whitelist Who"
	for(var/c in config.whitelist)
		to_chat(usr,c)

/datum/admins/proc/toogle_whitelist()
	set category = "Admin"
	set name = "Whitelist Toggle"
	config.whitelist_on = !config.whitelist_on
	to_chat(usr, "Whitelist now is [config.whitelist_on ? "on" : "off"]")

#undef WHITELISTFILE
