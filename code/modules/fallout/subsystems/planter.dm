var/datum/subsystem/planter/SSplanter

/datum/subsystem/planter
	name = "Planter"
	wait = 300
	var/plants_on_start = 500

/datum/subsystem/planter/New()
	NEW_SS_GLOBAL(SSsunlight)

/datum/subsystem/planter/Initialize(timeofday, zlevel)
	for(var/i=0, i<plants_on_start, i++)
		spawn_plant()

/datum/subsystem/planter/fire()
	spawn_plant()

/datum/subsystem/planter/proc/spawn_plant()
	var/turf/open/turf = locate(rand(1,world.maxx), rand(1,world.maxy), rand(1,world.maxz))
	if(istype(turf) && !has_density(turf) && turf.allowed_plants && turf.allowed_plants.len && !(locate(/obj/structure/flora) in turf))
		new /obj/structure/flora/wild_plant(turf, pick(turf.allowed_plants))