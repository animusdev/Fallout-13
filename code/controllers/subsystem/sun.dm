var/datum/subsystem/sun/SSsun
//For now it's using for change times of day
/datum/subsystem/sun
	name = "Sun"
	wait = 1
	priority = 2


	var/sunz = 1 //z coord where times of day are changing
	var/current_time_of_day = "Day"
	var/is_working = 0
	var/change_rate = 18000
	var/global_sun_light = 10
	var/next_change = 0
	var/max_sun = 10
	var/min_sun = 0.6
	var/curx
	var/dif = 0
/datum/subsystem/sun/New()
	NEW_SS_GLOBAL(SSsun)


/datum/subsystem/sun/Initialize(start_timeofday, zlevel)
	max_sun = config.max_sunlight
	min_sun = config.min_sunlight
	change_rate = config.time_of_day_rate
	next_change = change_rate + world.time
	..()

/datum/subsystem/sun/fire()
	if(!config.sun_enabled)
		return
		//<<1.NEED FOR WORK?>>
	if(is_working)
		///////////////////////
		/////////////////////
		//<<2.WORK HARD>>//
		/////////////////
		//<<2.1 Setting up new level of  sun light at the turf>>//
		if(curx <= 0)
			curx = world.maxy
			global_sun_light += dif
		//<<2.3 Updating y line of turfes>>//
		for(var/turf/t in block(locate(curx,1,sunz), locate(curx,world.maxy,sunz)))
			if(istype(t, /turf/ground))
				var/turf/ground/temp = t
				if(!temp.open_space)
					continue
				temp.sun_light = global_sun_light
				temp.redraw_lighting()
				temp.light.update_sunlight()
		curx--
		//<<2.3 Checking finish>>//
		if(global_sun_light == 0)
			global_sun_light = min_sun
		if(global_sun_light > max_sun)
			global_sun_light = max_sun
		if(global_sun_light < min_sun || global_sun_light == max_sun)

			if(dif == 1)
				global_sun_light = max_sun
				current_time_of_day = "Day"
			else
				global_sun_light = min_sun
				current_time_of_day = "Night"
			is_working = 0
			return
	/////////simple waiting//////
	else if (world.time > next_change)//Waiting for work
		if(current_time_of_day == "Day")
			current_time_of_day= "Evening"
			is_working = 1
			dif = -1
		else if(current_time_of_day == "Night")
			current_time_of_day = "Morning"
			is_working = 1
			dif = 1
		next_change = world.time + change_rate
		curx = world.maxx
		global_sun_light += dif
/datum/subsystem/sun/stat_entry(msg)
	msg += "Sun\[[global_sun_light]]"
	..(msg)