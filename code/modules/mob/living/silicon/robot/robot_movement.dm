/mob/living/silicon/robot/Process_Spacemove(movement_dir = 0)
	if(ionpulse())
		return 1
	return ..()

/mob/living/silicon/robot/movement_delay()
	. = ..()
	. += speed
	. += config.robot_delay
	. += get_pulling_delay()
	if(contents_weight)
		. += contents_weight/RATIO_WEIGHT

/mob/living/silicon/robot/mob_negates_gravity()
	return magpulse

/mob/living/silicon/robot/mob_has_gravity()
	return ..() || mob_negates_gravity()

/mob/living/silicon/robot/experience_pressure_difference(pressure_difference, direction)
	if(!magpulse)
		return ..()
