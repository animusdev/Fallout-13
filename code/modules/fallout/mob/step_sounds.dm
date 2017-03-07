/turf
	var/list/step_sounds = list("human" = "footsteps")

/mob/living
	var/step_sounded = FALSE
	var/step_sound_type = null

	proc/get_step_sound()
		return step_sound_type

	Move(n, direct)
		if(!..())
			return 0

		if(!has_gravity(loc))
			return 1

		if(buckled)
			return 1

		if(ishuman(src))
			var/mob/living/carbon/human/H = src
			if(!H.shoes)
				return 1

		if(step_sounded)
			return 1

		var/sound_type = get_step_sound()
		if(!sound_type)
			return 1

		var/turf/T = get_turf(src)
		if(T.step_sounds[sound_type] && !step_sounded)
			playsound(src, T.step_sounds[sound_type], 25, 0)
			step_sounded = TRUE
			spawn(src.movement_delay() * 2.1)
				step_sounded = FALSE
		return 1