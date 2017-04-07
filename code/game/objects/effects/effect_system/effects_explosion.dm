/obj/effect/particle_effect/expl_particles
	name = "fire"
	icon_state = "explosion_particle"
	opacity = 0
	anchored = 1

/obj/effect/particle_effect/expl_particles/New()
	..()
	QDEL_IN(src, 15)

/datum/effect_system/expl_particles
	number = 10

/datum/effect_system/expl_particles/start()
	for(var/i in 1 to number)
		spawn(0)
			var/obj/effect/particle_effect/expl_particles/expl = new /obj/effect/particle_effect/expl_particles(location)
			var/direct = pick(alldirs)
			var/steps_amt = pick(1;25,2;50,3,4;200)
			for(var/j in 1 to steps_amt)
				sleep(1)
				step(expl,direct)

/obj/effect/explosion
	name = "fire"
	icon = 'icons/effects/96x96.dmi'
	icon_state = "explosion"
	opacity = 1
	anchored = 1
	mouse_opacity = 0
	pixel_x = -32
	pixel_y = -32

/obj/effect/explosion/epic
	icon = 'icons/effects/160x160.dmi'
	icon_state = "epicexplosion"
	pixel_x = -64
	pixel_y = -64

/obj/effect/explosion/epic/New()
	..()
	set_light(10, l_color = LIGHT_COLOR_FIRE)
	QDEL_IN(src, 16.8)

/obj/effect/explosion/New()
	..()
	set_light(8, l_color = LIGHT_COLOR_FIRE)
	QDEL_IN(src, 20.8)

/obj/effect/explosion/ex_act(severity, target)
	return 0

/datum/effect_system/explosion
	var/epic = 0

/datum/effect_system/explosion/set_up(loca)
	if(isturf(loca))
		location = loca
	else
		location = get_turf(loca)

/datum/effect_system/explosion/start()
	if(epic)
		new/obj/effect/explosion/epic(location)
	else
		new/obj/effect/explosion( location )
	var/datum/effect_system/expl_particles/P = new/datum/effect_system/expl_particles()
	P.set_up(10, 0, location)
	P.start()

/datum/effect_system/explosion/smoke

/datum/effect_system/explosion/smoke/start()
	..()
	spawn(15)
		var/datum/effect_system/smoke_spread/S = new
		S.set_up(2, location)
		S.start()
