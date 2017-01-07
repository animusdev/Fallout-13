/obj/item/weapon/pinpointer
	name = "pinpointer"
	icon = 'icons/obj/device.dmi'
	icon_state = "pinoff"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	w_class = 2
	item_state = "electronic"
	throw_speed = 3
	throw_range = 7
	materials = list(MAT_METAL=500)
	var/obj/item/weapon/disk/nuclear/the_disk = null
	var/active = 0

/obj/item/weapon/pinpointer/Destroy()
	active = 0
	return ..()

/obj/item/weapon/pinpointer/attack_self()
	if(!active)
		active = 1
		workdisk()
		usr << "<span class='notice'>You activate the pinpointer.</span>"
	else
		active = 0
		icon_state = "pinoff"
		usr << "<span class='notice'>You deactivate the pinpointer.</span>"

/obj/item/weapon/pinpointer/proc/scandisk()
	if(!the_disk)
		the_disk = locate()

/obj/item/weapon/pinpointer/proc/point_at(atom/target, spawnself = 1)
	if(!active)
		return
	if(!target)
		icon_state = "pinonnull"
		return

	var/turf/T = get_turf(target)
	var/turf/L = get_turf(src)

	if(T.z != L.z)
		icon_state = "pinonnull"
	else
		dir = get_dir(L, T)
		switch(get_dist(L, T))
			if(-1)
				icon_state = "pinondirect"
			if(1 to 8)
				icon_state = "pinonclose"
			if(9 to 16)
				icon_state = "pinonmedium"
			if(16 to INFINITY)
				icon_state = "pinonfar"
	if(spawnself)
		spawn(5)
			.()

/obj/item/weapon/pinpointer/proc/workdisk()
	scandisk()
	point_at(the_disk, 0)
	spawn(5)
		.()

/obj/item/weapon/pinpointer/examine(mob/user)
	..()
	for(var/obj/machinery/nuclearbomb/bomb in machines)
		if(bomb.timing)
			user << "Extreme danger.  Arming signal detected.   Time remaining: [bomb.timeleft]"


/obj/item/weapon/pinpointer/advpinpointer
	name = "advanced pinpointer"
	icon = 'icons/obj/device.dmi'
	desc = "A larger version of the normal pinpointer, this unit features a helpful quantum entanglement detection system to locate various objects that do not broadcast a locator signal."
	var/mode = 0  // Mode 0 locates disk, mode 1 locates coordinates.
	var/turf/location = null
	var/obj/target = null

/obj/item/weapon/pinpointer/advpinpointer/attack_self()
	if(!active)
		active = 1
		if(mode == 0)
			workdisk()
		if(mode == 1)
			point_at(location)
		if(mode == 2)
			point_at(target)
		usr << "<span class='notice'>You activate the pinpointer.</span>"
	else
		active = 0
		icon_state = "pinoff"
		usr << "<span class='notice'>You deactivate the pinpointer.</span>"


/obj/item/weapon/pinpointer/advpinpointer/verb/toggle_mode()
	set category = "Object"
	set name = "Toggle Pinpointer Mode"
	set src in view(1)

	if(usr.stat || usr.restrained() || !usr.canmove)
		return

	active = 0
	icon_state = "pinoff"
	target=null
	location = null

	switch(alert("Please select the mode you want to put the pinpointer in.", "Pinpointer Mode Select", "Location", "Disk Recovery", "Other Signature"))
		if("Location")
			mode = 1

			var/locationx = input(usr, "Please input the x coordinate to search for.", "Location?" , "") as num
			if(!locationx || !(usr in view(1,src)))
				return
			var/locationy = input(usr, "Please input the y coordinate to search for.", "Location?" , "") as num
			if(!locationy || !(usr in view(1,src)))
				return

			var/turf/Z = get_turf(src)

			location = locate(locationx,locationy,Z.z)

			usr << "<span class='notice'>You set the pinpointer to locate [locationx],[locationy]</span>"


			return attack_self()

		if("Disk Recovery")
			mode = 0
			return attack_self()

		if("Other Signature")
			mode = 2
			switch(alert("Search for item signature or DNA fragment?" , "Signature Mode Select" , "" , "Item" , "DNA"))
				if("Item")
					var/targetitem = input("Select item to search for.", "Item Mode Select","") as null|anything in possible_items
					if(!targetitem)
						return
					target=locate(possible_items[targetitem])
					if(!target)
						usr << "<span class='warning'>Failed to locate [targetitem]!</span>"
						return
					usr << "<span class='notice'>You set the pinpointer to locate [targetitem].</span>"
				if("DNA")
					var/DNAstring = input("Input DNA string to search for." , "Please Enter String." , "")
					if(!DNAstring)
						return
					for(var/mob/living/carbon/C in mob_list)
						if(!C.dna)
							continue
						if(C.dna.unique_enzymes == DNAstring)
							target = C
							break

			return attack_self()


///////////////////////
//nuke op pinpointers//
///////////////////////


/obj/item/weapon/pinpointer/nukeop
	var/mode = 0	//Mode 0 locates disk, mode 1 locates the shuttle
	var/obj/docking_port/mobile/home


/obj/item/weapon/pinpointer/nukeop/attack_self(mob/user)
	if(!active)
		active = 1
		var/mode_text = "Authentication Disk Locator mode"
		if(!mode)
			workdisk()
		else
			mode_text = "Shuttle Locator mode"
			worklocation()
		user << "<span class='notice'>You activate the pinpointer([mode_text]).</span>"
	else
		active = 0
		icon_state = "pinoff"
		user << "<span class='notice'>You deactivate the pinpointer.</span>"


/obj/item/weapon/pinpointer/nukeop/workdisk()
	if(!active) return
	if(mode)		//Check in case the mode changes while operating
		worklocation()
		return
	if(bomb_set)	//If the bomb is set, lead to the shuttle
		mode = 1	//Ensures worklocation() continues to work
		worklocation()
		playsound(loc, 'sound/machines/twobeep.ogg', 50, 1)	//Plays a beep
		visible_message("Shuttle Locator mode actived.")			//Lets the mob holding it know that the mode has changed
		return		//Get outta here
	scandisk()
	if(!the_disk)
		icon_state = "pinonnull"
		return
	dir = get_dir(src, the_disk)
	switch(get_dist(src, the_disk))
		if(0)
			icon_state = "pinondirect"
		if(1 to 8)
			icon_state = "pinonclose"
		if(9 to 16)
			icon_state = "pinonmedium"
		if(16 to INFINITY)
			icon_state = "pinonfar"

	spawn(5) .()


/obj/item/weapon/pinpointer/nukeop/proc/worklocation()
	if(!active)
		return
	if(!mode)
		workdisk()
		return
	if(!bomb_set)
		mode = 0
		workdisk()
		playsound(loc, 'sound/machines/twobeep.ogg', 50, 1)
		visible_message("<span class='notice'>Authentication Disk Locator mode actived.</span>")
		return
	if(!home)
		home = SSshuttle.getShuttle("syndicate")
		if(!home)
			icon_state = "pinonnull"
			return
	if(loc.z != home.z)	//If you are on a different z-level from the shuttle
		icon_state = "pinonnull"
	else
		dir = get_dir(src, home)
		switch(get_dist(src, home))
			if(0)
				icon_state = "pinondirect"
			if(1 to 8)
				icon_state = "pinonclose"
			if(9 to 16)
				icon_state = "pinonmedium"
			if(16 to INFINITY)
				icon_state = "pinonfar"

	spawn(5)
		.()

/obj/item/weapon/pinpointer/operative
	name = "operative pinpointer"
	icon = 'icons/obj/device.dmi'
	desc = "A pinpointer that leads to the first Syndicate operative detected."
	var/mob/living/carbon/nearest_op = null

/obj/item/weapon/pinpointer/operative/attack_self()
	if(!usr.mind || !(usr.mind in ticker.mode.syndicates))
		usr << "<span class='danger'>AUTHENTICATION FAILURE. ACCESS DENIED.</span>"
		return 0
	if(!active)
		active = 1
		workop()
		usr << "<span class='notice'>You activate the pinpointer.</span>"
	else
		active = 0
		icon_state = "pinoff"
		usr << "<span class='notice'>You deactivate the pinpointer.</span>"

/obj/item/weapon/pinpointer/operative/proc/scan_for_ops()
	if(active)
		nearest_op = null //Resets nearest_op every time it scans
		var/closest_distance = 1000
		for(var/mob/living/carbon/M in mob_list)
			if(M.mind && (M.mind in ticker.mode.syndicates))
				if(get_dist(M, get_turf(src)) < closest_distance) //Actually points toward the nearest op, instead of a random one like it used to
					nearest_op = M

/obj/item/weapon/pinpointer/operative/proc/workop()
	if(active)
		scan_for_ops()
		point_at(nearest_op, 0)
		spawn(5)
			.()
	else
		return 0

/obj/item/weapon/pinpointer/operative/examine(mob/user)
	..()
	if(active)
		if(nearest_op)
			user << "Nearest operative detected is <i>[nearest_op.real_name].</i>"
		else
			user << "No operatives detected within scanning range."

//Motion tracker

/obj/item/weapon/motiontracker
	name = "motion tracker"
	desc = "A high-powered ultrasound scanner that uses doppler-shift discrimination to filter out moving objects from its stationary background."
	icon = 'icons/obj/device.dmi'
	icon_state = "trackeroff"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	w_class = 2.0
	item_state = "electronic"
	throw_speed = 3
	throw_range = 7
	materials = list(MAT_METAL=500)
	var/obj/item/weapon/disk/nuclear/the_disk = null
	var/active = 0


/obj/item/weapon/motiontracker/attack_self()
	if(!active)
		active = 1
		src.loop_sound()
		workdisk()
		usr << "<span class='notice'>You activate the motion tracker.</span>"
	else
		active = 0
		icon_state = "trackeroff"
		usr << "<span class='notice'>You deactivate the motion tracker.</span>"

/obj/item/weapon/motiontracker/var/sound = 'sound/f13items/tracker_far.ogg'
/obj/item/weapon/motiontracker/var/delay = 20

/obj/item/weapon/motiontracker/proc/point_at(atom/target)
	if(!active)
		return
	if(!target)
		icon_state = "trackeronnull"
		return

	var/turf/T = get_turf(target)
	var/turf/L = get_turf(src)

	if(T.z != L.z)
		icon_state = "trackeronnull"
	else
		dir = get_dir(L, T)
		switch(get_dist(L, T))
			if(-1)
				icon_state = "trackerondirect"
				sound = 'sound/f13items/tracker_direct.ogg'
				delay = 15
			if(1 to 3)
				icon_state = "trackeronclosedirect"
				sound = 'sound/f13items/tracker_direct.ogg'
				delay = 20
			if(4 to 6)
				icon_state = "trackeronclose"
				sound = 'sound/f13items/tracker_closedirect.ogg'
				delay = 20
			if(7 to 9)
				icon_state = "trackeronmediumclose" //this must be medium close
				sound = 'sound/f13items/tracker_close.ogg'
				delay = 20
			if(10 to 12)
				icon_state = "trackeronmedium"
				sound = 'sound/f13items/tracker_mediumclose.ogg'
				delay = 20
			if(13 to 15)
				icon_state = "trackeronmedium"
				sound = 'sound/f13items/tracker_medium.ogg'
				delay = 20
			if(16 to INFINITY)
				icon_state = "trackeronfar"
				sound = 'sound/f13items/tracker_far.ogg'
				delay = 20
	spawn(5)
		.()

/obj/item/weapon/motiontracker/proc/loop_sound()
	if(active)
		playsound(get_turf(src), sound, 80, 0, 0) //0 in middle has disabled sound modulation.
		spawn(delay)
			.()

/obj/item/weapon/motiontracker/proc/workdisk()
	if(!the_disk)
		the_disk = locate()
	point_at(the_disk)

/obj/item/weapon/motiontracker/examine(mob/user)
	..()
	for(var/obj/machinery/nuclearbomb/bomb in world)
		if(bomb.timing)
			user << "Extreme danger.  Arming signal detected.   Time remaining: [bomb.timeleft]"

/obj/item/weapon/motiontracker/advanced
	name = "advanced motion tracker"
	icon = 'icons/obj/device.dmi'
	desc = "A high-powered ultrasound scanner that uses doppler-shift discrimination to filter out moving objects from its stationary background."
	var/mode = 0  // Mode 0 locates disk, mode 1 locates coordinates.
	var/turf/location = null
	var/obj/target = null

/obj/item/weapon/motiontracker/advanced/attack_self()
	if(!active)
		active = 1
		src.loop_sound()
		if(mode == 0)
			workdisk()
		if(mode == 1)
			point_at(location)
		if(mode == 2)
			point_at(target)
		usr << "<span class='notice'>You activate the motion tracker.</span>"
	else
		active = 0
		icon_state = "trackeroff"
		usr << "<span class='notice'>You deactivate the motion tracker.</span>"


/obj/item/weapon/motiontracker/advanced/verb/toggle_mode()
	set category = "Object"
	set name = "Toggle Tracker Mode"
	set src in view(1)

	if(usr.stat || usr.restrained() || !usr.canmove)
		return

	active = 0
	icon_state = "trackeroff"
	target=null
	location = null

	switch(alert("Please select the mode you want to put the motion tracker in.", "Tracker Mode Select", "Location", "Disk Recovery", "Other Signature"))
		if("Location")
			mode = 1

			var/locationx = input(usr, "Please input the x coordinate to search for.", "Location?" , "") as num
			if(!locationx || !(usr in view(1,src)))
				return
			var/locationy = input(usr, "Please input the y coordinate to search for.", "Location?" , "") as num
			if(!locationy || !(usr in view(1,src)))
				return

			var/turf/Z = get_turf(src)

			location = locate(locationx,locationy,Z.z)

			usr << "You set the motion tracker to locate [locationx],[locationy]"


			return attack_self()

		if("Disk Recovery")
			mode = 0
			return attack_self()

		if("Other Signature")
			mode = 2
			switch(alert("Search for item signature or DNA fragment?" , "Signature Mode Select" , "" , "Item" , "DNA"))
				if("Item")
					var/targetitem = input("Select item to search for.", "Item Mode Select","") as null|anything in possible_items
					if(!targetitem)
						return
					target=locate(possible_items[targetitem])
					if(!target)
						usr << "Failed to locate [targetitem]!"
						return
					usr << "You set the motion tracker to locate [targetitem]"
				if("DNA")
					var/DNAstring = input("Input DNA string to search for." , "Please Enter String." , "")
					if(!DNAstring)
						return
					for(var/mob/living/carbon/M in mob_list)
						if(!M.dna)
							continue
						if(M.dna.unique_enzymes == DNAstring)
							target = M
							break

			return attack_self()