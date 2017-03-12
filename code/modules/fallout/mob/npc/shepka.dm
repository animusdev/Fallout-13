/mob/living/simple_animal/hostile/shepka
	name = "Anus overlord"
	desc = "Horrible creature that arrived from the system of Tau Ceti."
	icon_state = "shepherd"
	icon_living = "shepherd"
	icon_dead = "shepherd_dead"
	icon_gib = "gib"
	turns_per_move = 1
	response_help = "pets"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	butcher_results = list(/mob/living/simple_animal/hostile/megafauna/colossus = 1)
	maxHealth = 5000
	health = 5000

	environment_smash = 0
	faction = list("hostile", "evil")
	icon = 'icons/fallout/mobs/animal.dmi'
	melee_damage_lower = 5
	melee_damage_upper = 50
	aggro_vision_range = 20 //I SEE EVERYTHING
	idle_vision_range = 10
	attacktext = "suck soul"
	move_to_delay = 1

/mob/living/simple_animal/hostile/shepka/Hear(message, atom/movable/speaker, message_langs, raw_message, radio_freq, list/spans)
	if(findtext(lowertext_uni(raw_message), "пили билд"))
		gib()