/datum/subsystem/planter
	name = "Planter"
	wait = 300
	var/plants_on_start = 500

/datum/subsystem/planter/Initialize(timeofday, zlevel)
	for(var/i=0, i<plants_on_start, i++)
		spawn_plant()
/datum/subsystem/planter/fire()
	spawn_plant()

/datum/subsystem/planter/proc/get_turf()
	var/turf/turf = locate(rand(1,world.maxx), rand(1,world.maxy), rand(1,world.maxz))
	if(istype(turf, /turf/open/indestructible/ground/desert) || istype(turf, /turf/open/indestructible/ground/mountain))
		return turf
	return null

/datum/subsystem/planter/proc/spawn_plant()
	var/turf/open/indestructible/ground/desert/turf = get_turf()
	if(turf != null && turf.contents.len <= 1)
		var/ob
		if(istype(turf,/turf/open/indestructible/ground/desert))
			ob = pickweight(wild_plants)
		else
			ob = pickweight(wild_cave_plants)
		var/obj/machinery/hydroponics/soil/wild_plant/plant = new ob
		plant.loc = turf