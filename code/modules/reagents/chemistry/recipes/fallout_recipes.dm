/datum/chemical_reaction/stimpackium_oxy
	name = "Stimpackium"
	id = "stimpackium_oxy"
	results = list("stimpackium_oxy" = 2)
	required_reagents = list("broc_extract" = 1, "xander_extract" = 1)
	mix_message = "The mixture turns red and begins glowing."
	required_temp = 380

/datum/chemical_reaction/supstimpackium_oxy
	name = "SuperStimpackium"
	id = "supstimpackium_oxy"
	results = list("supstimpackium_oxy" = 2)
	required_reagents = list("stimpackium_oxy" = 3,"improve_reagent" = 1)
	mix_message = "The mixture gets darker."
	required_temp = 400