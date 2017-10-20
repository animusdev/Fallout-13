#define WHITELISTFILE "config/whitelist.txt"
/*
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
*/
/proc/load_whitelist()

	log_admin("Loading whitelist")
	var/list/whitelist = list()

	var/DBQuery/query = dbcon.NewQuery("SELECT byond FROM forum2.Z_whitelist")

	if(!query.Execute())
		log_admin("Failed to load whitelist. Error: [dbcon.ErrorMsg()]. Failed to execute query.")
		world.log << "Failed to load whitelist. Error: [dbcon.ErrorMsg()]. Failed to execute query."
		return
	while(query.NextRow())
		whitelist += "[query.item[1]]"

	if(!whitelist.len)
		log_admin("Failed to load whitelist or its empty")
		world.log << "Failed to load whitelist or its empty"
		whitelist = null
	else
		log_admin("Loaded [whitelist.len] ckeys in whitelist.")
		world.log << "Loaded [whitelist.len] ckeys in whitelist."

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
		to_chat(usr, "That player is already on the whitelist!")
		return
	config.whitelist += nickname

/datum/admins/proc/remove_whitelist(nickname as text)
	set category = "Admin"
	set name = "Remove Player From Whitelist"
	nickname = ckey(nickname)
	if(!(nickname in config.whitelist))
		to_chat(usr, "That player is not on the whitelist!")
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
	to_chat(usr, "The whitelist is now [config.whitelist_on ? "on" : "off"]")

#undef WHITELISTFILE
