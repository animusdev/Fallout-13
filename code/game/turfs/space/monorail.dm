turf/monorail
	icon = 'icons/misc/monorail.dmi'
	icon_state = "2"

/turf/dark
	icon = 'icons/misc/blackyblack.dmi'

/turf/simulated/floor/electric/proc/electrocute(mob/living/carbon/human/target)
	if (!target.weakened)
		var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
		s.set_up(3, 1, src)
		s.start()
		target.electrocution_animation(40)
		target.Stun(15)
		target.Weaken(10)
		target.adjustFireLoss(105)
		var/dir = rand(1, 8)
		var/throwTarget = get_edge_target_turf(target, dir)
		target.throw_at(throwTarget, 4, 150)

/turf/simulated/floor/electric/Entered(atom/A, atom/OL)
	..()
	if(ishuman(A))
		electrocute(A)

/turf/simulated/floor/electric/monorail
	icon = 'icons/misc/invisible.dmi'

/turf/simulated/floor/electric/RailLeft
	name = "Monorail"
	icon_state = "MonoL"
	desc = "Careful! Under High Voltage!"

/turf/simulated/floor/electric/RailRight
	name = "Monorail"
	icon_state = "MonoR"
	desc = "Careful! Under High Voltage!"

/turf/simulated/floor/electric/eplating
	name = "plating"
	icon_state = "plating"