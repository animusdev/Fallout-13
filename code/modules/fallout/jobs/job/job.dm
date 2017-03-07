/datum/job

	var/status = "Wastelander"

	var/whitelist_on = 0

	var/donaters = 0

/datum/job/proc/is_quality_human(mob/new_player/M)
	return 1