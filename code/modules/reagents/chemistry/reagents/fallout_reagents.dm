/datum/reagent/stimpackium
	name = "Stimpackium"
	id = "stimpackium"
	color = "#FF0033"
	description = "Strange mixture for healing wounds."

datum/reagent/stimpackium/on_mob_life(mob/living/M)
	M.adjustFireLoss(-1.10*REM, 0)
	M.adjustBruteLoss(-1.10*REM, 0)
	..()
	. = 1

/datum/reagent/supstimpackium
	name = "SuperStimpackium"
	id = "supstimpackium"
	color = "#FF3300"
	description = "Strange mixture for healing wounds."

datum/reagent/supstimpackium/on_mob_life(mob/living/M)
	M.adjustFireLoss(-1.70*REM, 0)
	M.adjustBruteLoss(-1.70*REM, 0)
	..()
	. = 1

//Unrefined --for ELITE mechanics
/datum/reagent/stimpackium_oxy
	name = "Stimpackium"
	id = "stimpackium_oxy"
	color = "#FF0033"
	description = "Strange mixture for healing wounds."

datum/reagent/stimpackium_oxy/on_mob_life(mob/living/M)
	M.adjustFireLoss(-0.5*REM, 0)
	M.adjustBruteLoss(-0.5*REM, 0)
	M.adjustToxLoss(1.10*REM, 0)
	..()
	. = 1

/datum/reagent/supstimpackium_oxy
	name = "SuperStimpackium"
	id = "supstimpackium_oxy"
	color = "#FF3300"
	description = "Strange mixture for healing wounds."

datum/reagent/supstimpackium_oxy/on_mob_life(mob/living/M)
	M.adjustFireLoss(-0.80*REM, 0)
	M.adjustBruteLoss(-0.80*REM, 0)
	M.adjustToxLoss(1.6*REM, 0)
	..()
	. = 1
///unrefined


/datum/reagent/mentats
	name = "Mentats"
	id = "mentats"
	description = "Helps you, if you stupid. Possible..."
	color = "#2222FF"
	overdose_threshold = 60

/datum/reagent/mentats/on_mob_life(mob/living/M)
	M.adjustBrainLoss(-3*REM)
	..()
	. = 1

/datum/reagent/mentats/overdose_process(mob/living/M)
	M.adjustBrainLoss(7*REM)
	..()
	. = 1