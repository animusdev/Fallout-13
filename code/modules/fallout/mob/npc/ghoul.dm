/mob/living/simple_animal/hostile/ghoul
	name = "Feral Ghoul"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are a necrotic post-humans, decrepit, rotting, zombie-like mutants."
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	icon = 'icons/fallout/mobs/animal.dmi'
	speak_chance = 0
	turns_per_move = 5
	environment_smash = 0
	response_help = "hugs"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	move_to_delay = 2
	maxHealth = 50
	health = 50
	self_weight = 45

	sound_speak_chance = 5
	sound_speak = list('sound/f13npc/ghoul_charge1.ogg','sound/f13npc/ghoul_charge2.ogg','sound/f13npc/ghoul_charge3.ogg')

	aggro_sound_chance = 50
	aggro_sound = 'sound/f13npc/ghoul_alert.ogg'

	melee_damage_lower = 5
	melee_damage_upper = 10
	aggro_vision_range = 10
	idle_vision_range = 7
	attacktext = "scratches"
	attack_sound = "punch"

	minbodytemp = 0
	maxbodytemp = 1500

	faction = list("hostile", "ghoul")

/mob/living/simple_animal/hostile/ghoul/aggressive
	name = "Feral Ghoul"
	desc = "Have you ever seen a hungry ghoul before?<br>It's just like other feral ghouls, yet it's more aggressive and confident about the fact you are the best food around.<br>It is missing a left arm."
	icon_state = "angry_ghoul"
	icon_living = "angry_ghoul"
	icon_dead = "angry_ghoul_d"
	icon_gib = "gib"
	maxHealth = 75
	health = 75
	melee_damage_lower = 10
	melee_damage_upper = 20
	aggro_vision_range = 15
	idle_vision_range = 10
	attacktext = "chomps"

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "Glowing Feral Ghoul"
	desc = "Have you ever seen a glowing ghoul before?<br>Glowing ghouls are a necrotic post-humans, rotting, zombie-like mutants, that are so irradiated they actually glow in the dark."
	icon_state = "retro_glowingghoul"
	icon_living = "retro_glowingghoul"
	icon_dead = "retro_glowingghoul_d"
	icon_gib = "gib"
	maxHealth = 100
	health = 100
	melee_damage_lower = 15
	melee_damage_upper = 25
	light_color = LIGHT_COLOR_GREEN
	light_power = 1
	light_range = 2