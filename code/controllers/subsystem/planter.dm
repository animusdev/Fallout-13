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
	var/x = rand(1,world.maxx)
	var/y = rand(1,world.maxy)
	var/z = rand(1,world.maxz)
	var/turf/turf = locate(x, y, z)
	if(istype(turf, /turf/ground/desert) || istype(turf, /turf/ground/mountain))
		return turf
	return null

/datum/subsystem/planter/proc/spawn_plant()
	var/turf/ground/turf = get_turf()
	if(turf != null && turf.contents.len <= 1)
		var/ob
		if(istype(turf,/turf/ground/desert))
			ob = pickweight(wild_plants)
		else
			ob = pickweight(wild_cave_plants)
		var/obj/machinery/hydroponics/soil/wild_plant/plant = new ob
		plant.loc = turf