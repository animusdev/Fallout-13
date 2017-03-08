var/datum/subsystem/ambient/SSradiation

/datum/subsystem/radiation
	name = "Radiation"
	init_order = 20
	priority = 20
	wait = 5
	var/wait_part = 5
	var/wait_full = 50
	var/increment

	var/list/processing = list()
	var/list/currentrun = list()

/datum/subsystem/radiation/New()
	NEW_SS_GLOBAL(SSradiation)

/datum/subsystem/radiation/stat_entry()
	..("W:[wait]P:[processing.len]")

/datum/subsystem/radiation/fire(resumed = 0)
	if (!resumed && !src.currentrun.len)
		src.currentrun = processing.Copy()
		increment = round(src.currentrun.len * (wait_part/wait_full))
	//cache for sanic speed (lists are references anyways)
	var/started = world.time
	var/list/currentrun = src.currentrun
	CYCLE
	for(var/i = 0, i < increment, i++)
		var/atom/thing = currentrun[currentrun.len]
		currentrun.len--
		if(thing)
			thing.RadiateRefresh()
		else
			SSradiation.processing -= thing
		if (MC_TICK_CHECK)
			return
	if(currentrun.len && currentrun.len < increment)
		goto CYCLE
	wait = wait_part - (started - world.time)

/datum/subsystem/radiation/Recover()
	if (istype(SSradiation.processing))
		processing = SSradiation.processing