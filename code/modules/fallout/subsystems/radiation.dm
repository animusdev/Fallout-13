var/datum/subsystem/ambient/SSradiation

/datum/subsystem/radiation
	name = "Radiation"
	init_order = 20
	priority = 20

	wait = 50

	var/list/processing = list()
	var/list/currentrun = list()

/datum/subsystem/radiation/New()
	NEW_SS_GLOBAL(SSradiation)

/datum/subsystem/radiation/stat_entry()
	..("P:[processing.len]")

/datum/subsystem/radiation/fire(resumed = 0)
	if (!resumed)
		src.currentrun = processing.Copy()
	//cache for sanic speed (lists are references anyways)
	var/list/currentrun = src.currentrun

	while(currentrun.len)
		var/atom/thing = currentrun[currentrun.len]
		currentrun.len--
		if(thing)
			thing.RadiateRefresh()
		else
			SSradiation.processing -= thing
		if (MC_TICK_CHECK)
			return

/datum/subsystem/radiation/Recover()
	if (istype(SSradiation.processing))
		processing = SSradiation.processing