var/datum/subsystem/sun/SSsun
//For now it's using for change times of day
/datum/subsystem/sun
	name = "Sun"
	wait = 2
	priority = 2


	var/sunz = 1 //z coord where times of day are changing
	var/current_time_of_day = "day"
	var/is_working = 0
	var/change_rate = 18000
	var/global_sun_light = 10
	var/next_change = 0
	var/max_sun = 10
	var/min_sun = 0.3
	var/sun_light_finish = 0
	var/curx
	var/dif = 0
/datum/subsystem/sun/New()
	NEW_SS_GLOBAL(SSsun)


/datum/subsystem/sun/Initialize(start_timeofday, zlevel)
	next_change = change_rate + world.time
	..()

/datum/subsystem/sun/fire()
		//<<1.NEED FOR WORK?>>
	if(is_working)
		///////////////////////
		/////////////////////
		//<<2.WORK HARD>>//
		/////////////////
		//<<2.1 Updating y line of turfes>>//
		for(var/turf/t in block(locate(curx,1,sunz), locate(curx,world.maxy,sunz)))
			if(istype(t, /turf/ground))
				var/turf/ground/temp = t
				if(!temp.open_space)
					continue
				temp.sun_light = global_sun_light
				temp.redraw_lighting()
				temp.update_sunlight()

		//<<2.2 Checking finish>>//
		if(sun_light_finish == global_sun_light)

			if(dif == 1)

				current_time_of_day = "day"
			else
				current_time_of_day = "night"
			is_working = 0
			next_change += change_rate
			return
		//<<2.3 Setting up new level of  sun light at the turf>>//
		curx--
		if(curx <= 0)
			curx = world.maxy
			global_sun_light = global_sun_light + dif
			if(global_sun_light > max_sun)
				global_sun_light = max_sun
			if(global_sun_light < min_sun)
				global_sun_light = min_sun

	/////////simple waiting//////
	else if (world.time > next_change)//Waiting for work
		if(current_time_of_day == "day")
			sun_light_finish = min_sun
			current_time_of_day= "evening"
			is_working = 1
			dif = -1
		else if(current_time_of_day == "night")

			sun_light_finish = max_sun
			current_time_of_day = "morning"
			is_working = 1
			dif = 1
		curx = world.maxx
		global_sun_light += dif