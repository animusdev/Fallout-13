/datum/reagent/stimpackium
	name = "Stimpackium"
	id = "stimpackium"
	color = "#FF0033"
	description = "Strange mixture for healing wounds."

datum/reagent/stimpackium/on_mob_life(mob/living/M)
	M.adjustFireLoss(-1.05*REM, 0)
	M.adjustBruteLoss(-1.05*REM, 0)
	..()
	. = 1

/datum/reagent/supstimpackium
	name = "SuperStimpackium"
	id = "supstimpackium"
	color = "#FF3300"
	description = "Strange mixture for healing wounds."

datum/reagent/supstimpackium/on_mob_life(mob/living/M)
	M.adjustFireLoss(-1.60*REM, 0)
	M.adjustBruteLoss(-1.60*REM, 0)
	..()
	. = 1

/datum/reagent/mentats
	name = "Mentats"
	id = "mentats"
	description = "Efficiently restores brain damage."
	color = "#2222FF"

/datum/reagent/mentats/on_mob_life(mob/living/M)
	M.adjustBrainLoss(-3*REM)
	..()