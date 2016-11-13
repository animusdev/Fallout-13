/mob/living/carbon/human/proc/hulk_jump()
	set name = "Leap Forward(Hulk)"
	set category = "Superpower"

	//src.verbs -= /mob/living/carbon/human/proc/hulk_jump

	var/failure = 0
	if (istype(src.loc,/mob/) || src.lying || src.stunned || src.buckled || src.stat)
		src << "\red You can't jump right now!"
		return

	if(src.hulk_cd)
		src << "\red You need a bit of time, before you can use any ability!"
		return

	src.hulk_cd = 1
	spawn(150)
		src.hulk_cd = 0

	if (istype(src.loc,/turf/) && !(istype(src.loc,/turf/space)))

		if(src.restrained())
			for(var/mob/M in range(src, 1))
				if(M.pulling == src)
					M.stop_pulling()

		src.visible_message("\red <b>[src.name]</b> takes a huge leap!")
		playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 50, 1)
		if(failure)
			src.Weaken(5)
			src.Stun(5)
			src.visible_message("<span class='warning'> \the [src] attempts to leap away but is slammed back down to the ground!</span>",
								"<span class='warning'>You attempt to leap away but are suddenly slammed back down to the ground!</span>",
								"<span class='notice'>You hear the flexing of powerful muscles and suddenly a crash as a body hits the floor.</span>")
			return 0

		src.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		var/prevLayer = src.layer
		src.layer = 9
		var/cur_dir = src.dir
		var/turf/simulated/floor/tile = src.loc
		if(tile)
			tile.break_tile()
		var/o=3
		for(var/i=0, i<14, i++)
			src.density = 0
			src.canmove = 0
			o++
			if(o == 4)
				o = 0
				step(src, cur_dir)
			if(i < 7) src.pixel_y += 8
			else src.pixel_y -= 8
			sleep(1)
		playsound(src.loc, 'sound/effects/explosionfar.ogg', 50, 1)
		for(tile in range(1, src))
			if(prob(50))
				tile.break_tile()
		for(var/mob/living/M in src.loc.contents)
			if(M != src)
				src.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [M.name] ([M.ckey]) with hulk_jump</font>"
				M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [src.name] ([src.ckey]) with hulk_jump</font>"
				M.Stun(5)
				M.Weaken(5)
				M.take_overall_damage(35, used_weapon = "Hulk Foot")
		var/snd = 1
		for(var/direction in alldirs)
			var/turf/T = get_step(src,direction)
			for(var/mob/living/M in T.contents)
				if( (M != src) && !(M.stat))
					if(snd)
						snd = 0
						playsound(M.loc, 'sound/misc/slip.ogg', 50, 1)
					M.Weaken(2)
					for(var/i=0, i<6, i++)
						spawn(i)
							if(i < 3) M.pixel_y += 8
							else M.pixel_y -= 8
		src.density = 1
		src.canmove = 1
		src.layer = prevLayer
	else
		src << "\red You need a ground to do this!"
		return

	if (istype(src.loc,/obj/))
		var/obj/container = src.loc
		src << "\red You leap and slam your head against the inside of [container]! Ouch!"
		src.paralysis += 3
		src.weakened += 5
		container.visible_message("\red <b>[src.loc]</b> emits a loud thump and rattles a bit.")
		playsound(src.loc, 'sound/effects/bang.ogg', 50, 1)
		var/wiggle = 6
		while(wiggle > 0)
			wiggle--
			container.pixel_x = rand(-3,3)
			container.pixel_y = rand(-3,3)
			sleep(1)
		container.pixel_x = 0
		container.pixel_y = 0

	return

/mob/living/carbon/human/proc/hulk_dash()
	set name = "Dash Forward(Hulk)"
	set category = "Superpower"

	var/turf/T = get_turf(get_step(src,src.dir))
	for(var/mob/living/M in T.contents)
		src << "\red Something right in front of you!"
		return
	T = get_turf(get_step(T,src.dir))
	for(var/mob/living/M in T.contents)
		src << "\red Something right in front of you!"
		return

	var/failure = 0
	if (istype(src.loc,/mob/) || src.lying || src.stunned || src.buckled || src.stat)
		src << "\red You can't dash right now!"
		return

	if(src.hulk_cd)
		src << "\red You need a bit of time, before you can use any ability!"
		return

	src.hulk_cd = 1
	spawn(150)
		src.hulk_cd = 0

	if (istype(src.loc,/turf/) && !(istype(src.loc,/turf/space)))
		if(src.restrained())
			for(var/mob/M in range(src, 1))
				if(M.pulling == src)
					M.stop_pulling()

		src.visible_message("\red <b>[src.name]</b> dashes forward!")
		playsound(src.loc, 'sound/weapons/thudswoosh.ogg', 50, 1)
		if(failure)
			src.Weaken(5)
			src.Stun(5)
			src.visible_message("<span class='warning'> \the [src] attempts to dash away but was interrupted!</span>",
								"<span class='warning'>You attempt to dash but suddenly interrupted!</span>",
								"<span class='notice'>You hear the flexing of powerful muscles and suddenly a crash as a body hits the floor.</span>")
			return 0

		src.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		var/prevLayer = src.layer
		src.layer = 9
		var/cur_dir = src.dir
		var/turf/simulated/floor/tile = src.loc
		if(tile)
			tile.break_tile()
		var/speed = 3
		for(var/i=0, i<30, i++)
			var/hit = 0
			T = get_turf(get_step(src,src.dir))
			if(i < 7)
				if(istype(T,/turf/simulated/wall/))
					hit = 1
				else if(istype(T,/turf/simulated/floor/))
					for(var/obj/structure/S in T.contents)
						if(istype(S,/obj/structure/window/))
							hit = 1
						if(istype(S,/obj/structure/grille/))
							hit = 1
			else if(i > 6)
				if(istype(T,/turf/simulated/floor/))
					for(var/obj/structure/S in T.contents)
						if(istype(S,/obj/structure/window/))
							S.ex_act(2)
						if(istype(S,/obj/structure/grille/))
							del(S)
				if(istype(T,/turf/simulated/wall/))
					var/turf/simulated/wall/W = T
					var/mob/living/carbon/human/H = usr
					if(istype(T,/turf/simulated/wall/r_wall))
						hit = 1
						H.Weaken(5)
						H.take_overall_damage(5, used_weapon = "reinforced wall")
					else
						if(i > 20)
							if(prob(65))
								hit = 1
								W.dismantle_wall(1)
							else
								hit = 1
								H.Weaken(5)
						else
							hit = 1
							H.Weaken(5)
			if(i > 20)
				src.canmove = 0
				src.density = 0
				for(var/mob/living/M in T.contents)
					if(!M.lying)
						src.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [M.name] ([M.ckey]) with hulk_dash</font>"
						M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [src.name] ([src.ckey]) with hulk_dash</font>"
						var/turf/target = get_turf(get_step(src,cur_dir))
						hit = 1
						for(var/o=0, o<10, o++)
							target = get_turf(get_step(target,cur_dir))
						M.Weaken(5)
						M.Stun(5)
						M.take_overall_damage(40, used_weapon = "Hulk Foot")
						M.throw_at(target, 200, 100)
						break
			else if(i > 6)
				for(var/mob/living/M in T.contents)
					playsound(M.loc, 'sound/misc/slip.ogg', 50, 1)
					M.Weaken(5)
			if(src.lying)
				break
			if(hit)
				break
			if(i < 7)
				speed++
				if(speed > 3)
					speed = 0
					step(src, cur_dir)
			else if(i < 14)
				speed++
				if(speed > 2)
					speed = 0
					step(src, cur_dir)
			else if(i < 21)
				speed++
				if(speed > 1)
					speed = 0
					step(src, cur_dir)
			else if(i < 30)
				step(src, cur_dir)
			sleep(1)

		src.density = 1
		src.canmove = 1
		src.layer = prevLayer
	else
		src << "\red You need a ground to do this!"
		return

	if (istype(src.loc,/obj/))
		var/obj/container = src.loc
		src << "\red You dash and slam your head against the inside of [container]! Ouch!"
		src.paralysis += 3
		src.weakened += 5
		container.visible_message("\red <b>[src.loc]</b> emits a loud thump and rattles a bit.")
		playsound(src.loc, 'sound/effects/bang.ogg', 50, 1)
		var/wiggle = 6
		while(wiggle > 0)
			wiggle--
			container.pixel_x = rand(-3,3)
			container.pixel_y = rand(-3,3)
			sleep(1)
		container.pixel_x = 0
		container.pixel_y = 0

	return

/mob/living/carbon/human/proc/hulk_smash()
	set name = "Smash Ground(Hulk)"
	set category = "Superpower"

	if (src.lying || src.stunned || src.stat)
		src << "\red You can't smash right now!"
		return

	if(src.hulk_cd)
		src << "\red You need a bit of time, before you can use any ability!"
		return

	src.hulk_cd = 1
	spawn(150)
		src.hulk_cd = 0

	if (istype(src.loc,/turf/))
		src.visible_message("<font size='4' color='red'><b>[src.name] prepares a heavy attack!</b>")
		for(var/i=0, i<30, i++)
			src.canmove = 0
			src.anchored = 1
			sleep(1)
		src.anchored = 0
		src.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ))
		src.visible_message("\red <b>[src.name] slams the ground with \his arms!</b>")
		playsound(src.loc, 'sound/effects/explosionfar.ogg', 50, 1)
		var/cur_dir = src.dir
		var/turf/T = get_turf(get_step(src,cur_dir))
		var/turf/simulated/floor/tile = T
		var/turf/simulated/wall/W = T
		if(istype(W,/turf/simulated/wall/r_wall))
			usr << "\red <B>Ouch!</B> This wall is too strong."
			var/mob/living/carbon/human/H = usr
			H.take_overall_damage(5, used_weapon = "reinforced wall")
		else if(istype(W,/turf/simulated/wall))
			if (prob(25))
				W.dismantle_wall(1)
		if(istype(tile))
			tile.break_tile()
		for(var/mob/living/M in T.contents)
			if(M != src)
				src.attack_log += "\[[time_stamp()]\]<font color='red'> Attacked [M.name] ([M.ckey]) with hulk_smash</font>"
				M.attack_log += "\[[time_stamp()]\]<font color='orange'> Attacked by [src.name] ([src.ckey]) with hulk_smash</font>"
				M.Stun(5)
				M.Weaken(5)
				M.take_overall_damage(65, used_weapon = "Hulk Arm")
		sleep(2)
		for(tile in range(1, T))
			if(prob(75))
				tile.break_tile()
		for(var/mob/living/M in range(1, T))
			if( (M != src) && !M.lying)
				playsound(M.loc, 'sound/misc/slip.ogg', 50, 1)
				M.Weaken(5)
		for(var/obj/structure/S in range(1, T))
			if(istype(S,/obj/structure/window/))
				S.ex_act(2)
			if(istype(S,/obj/structure/grille/))
				del(S)
		sleep(3)
		for(tile in range(2, T))
			if(prob(40))
				tile.break_tile()
		for(var/mob/living/M in range(2, T))
			if( (M != src) && !M.lying)
				playsound(M.loc, 'sound/misc/slip.ogg', 50, 1)
				M.Weaken(2)
		for(var/obj/structure/S in range(2, T))
			if(prob(40))
				if(istype(S,/obj/structure/window/))
					S.ex_act(2)
				if(istype(S,/obj/structure/grille/))
					del(S)
		src.canmove = 1

	if (istype(src.loc,/obj/))
		var/obj/container = src.loc
		src << "\red You smash [container]!"
		container.visible_message("\red <b>[src.loc]</b> emits a loud thump and rattles a bit.")
		playsound(src.loc, 'sound/effects/bang.ogg', 50, 1)
		var/wiggle = 6
		while(wiggle > 0)
			wiggle--
			container.pixel_x = rand(-3,3)
			container.pixel_y = rand(-3,3)
			sleep(1)
		container.pixel_x = 0
		container.pixel_y = 0
		visible_message("\red [src] destroys the [container]. ")
		for(var/atom/movable/A as mob|obj in container)
			A.loc = container.loc
			var/mob/M = A
			if( (istype(M, /mob/)) && M.client)
				M.client.eye = M.client.mob
				M.client.perspective = MOB_PERSPECTIVE
		del(container)

	return