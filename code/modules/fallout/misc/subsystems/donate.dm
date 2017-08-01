//Fallout 13 - Loadsamoney

var/datum/subsystem/content/SScontent



/datum/subsystem/content
	name = "Content"
	init_order = 0
	priority = 0

	var/system_state = -1

	var/list/all_content_packs = list()

	wait = 600

/datum/subsystem/content/New()
	NEW_SS_GLOBAL(SScontent)

/datum/subsystem/content/Initialize(start_timeofday)
	system_state = check_connection()
	load_content_packs()
	update_all_data()
	..()

/datum/subsystem/content/fire(resumed = 0)
	system_state = check_connection()

/datum/subsystem/content/stat_entry()
	..("[system_state ? "Ok" : "Broken"]")

/datum/subsystem/content/proc/update_all_data()
	for(var/client/C)
		C.update_content_data()

/datum/subsystem/content/proc/get_pack(id)
	return all_content_packs[id]

/datum/subsystem/content/proc/get_user_money(ckey)
	var/DBQuery/query = dbcon.NewQuery("SELECT sum FROM Z_donators WHERE byond = '[ckey]'")
	query.Execute()
	if(!query.NextRow())
		return 0

	var/amount = round(text2num(query.item[1]))

	query = dbcon.NewQuery("SELECT sum(price) FROM donate WHERE ckey = '[ckey]'")
	query.Execute()

	if(!query.NextRow())
		return amount

	var/sum = round(text2num(query.item[1]))
	return amount - sum

/datum/subsystem/content/proc/get_packs(ckey)
	var/list/results = list()
	var/DBQuery/query = dbcon.NewQuery("SELECT pack FROM donate WHERE ckey = '[ckey]'")
	query.Execute()

	while(query.NextRow())
		results += query.item[1]

	return results

/datum/subsystem/content/proc/buy_pack(ckey, pack_id, price)
	if(system_state)
		var/DBQuery/query = dbcon.NewQuery("INSERT INTO donate(ckey, pack, price) VALUES ('[ckey]', '[pack_id]', [price])");
		query.Execute()

		return 1
	return 0


/datum/subsystem/content/proc/check_connection()
	return dbcon.IsConnected()

/datum/subsystem/content/proc/load_content_packs()
	var/list/all_packs = subtypesof(/datum/content_pack)
	if(!all_packs.len)
		to_chat(world, "<span class='boldannounce'>Error setting up jobs, no content packs datums found!</span>")
		return 0
	for(var/type in all_packs)
		var/datum/content_pack/D = new type()
		all_content_packs[D.id] = D