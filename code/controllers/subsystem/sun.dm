var/datum/subsystem/sun/SSsun
var/global_sun_light = 10
//For now it's using for change times of day
/datum/subsystem/sun
	name = "Sun"
	wait = 600
	priority = 2

	var/angle
	var/dx
	var/dy
	var/rate
	var/list/solars	= list()
	var/sunz = 1 //z coord where times of day are changing
	var/current_time_of_day = "day"
	var/is_working = 0
	var/times_changing = 18000
	var/next_changing = 0
/datum/subsystem/sun/New()
	NEW_SS_GLOBAL(SSsun)

	angle = rand (0,360)			// the station position to the sun is randomised at round start
	rate = rand(50,200)/100			// 50% - 200% of standard rotation
	if(prob(50))					// same chance to rotate clockwise than counter-clockwise
		rate = -rate
	next_changing = world.time + times_changing


/datum/subsystem/sun/stat_entry(msg)
	..("P:[solars.len]")

/datum/subsystem/sun/fire()
	angle = (360 + angle + rate * 6) % 360	 // increase/decrease the angle to the sun, adjusted by the rate

	// now calculate and cache the (dx,dy) increments for line drawing
	var/s = sin(angle)
	var/c = cos(angle)

	// Either "abs(s) < abs(c)" or "abs(s) >= abs(c)"
	// In both cases, the greater is greater than 0, so, no "if 0" check is needed for the divisions

	if(abs(s) < abs(c))
		dx = s / abs(c)
		dy = c / abs(c)
	else
		dx = s / abs(s)
		dy = c / abs(s)

	//now tell the solar control computers to update their status and linked devices
	for(var/obj/machinery/power/solar_control/SC in solars)
		if(!SC.powernet)
			solars.Remove(SC)
			continue
		SC.update()

	if(world.time >= next_changing)
		spawn(0)
			toogle_times()
			next_changing = world.time + times_changing

/datum/subsystem/sun/proc/toogle_times()
	if(is_working)
		usr << "Not now"
		return
	var/x
	var/y
	var/sun_light_finish
	var/turf/ground/turf
//	var/area/space/space = locate(/area/space) in world
	is_working = 1
	//space.lighting_use_dynamic = DYNAMIC_LIGHTING_ENABLED
	if(current_time_of_day == "day")
		global_sun_light = 10
		sun_light_finish = 0.2
		world << "It's evening"
	else
		global_sun_light = 1
		sun_light_finish = 10
		world << "It's morning"
	for(,,)
		if(current_time_of_day == "day")
			if(global_sun_light < 0.2)
				break
			global_sun_light--
			if(global_sun_light <= 0)
				global_sun_light = 0.2
		else
			if(global_sun_light == sun_light_finish + 1.2)
				break
			global_sun_light++
		for(x=world.maxx, x>1, x--)
			for(y=1, y<world.maxy, y++)
				turf = locate(x,y,sunz)
				if(istype(turf,/turf/ground))
					var/turf/ground/g = turf
					if(!g.open_space)
						continue
					g.sun_light = global_sun_light
					g.redraw_lighting()
					g.update_sunlight()
		//		else if(turf.loc == space || istype(turf,/turf/ground/mountain))
		//			turf.redraw_lighting()
			sleep(1.5)
		sleep(100)
	is_working = 0
	if(current_time_of_day == "day")
		current_time_of_day = "night"
		world << "It's night"
	else
		current_time_of_day = "day"
		world << "It's day"
	//	space.lighting_use_dynamic = DYNAMIC_LIGHTING_DISABLED



