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
	desc = "Have you ever seen a hungry ghoul before?<br>It's just like other feral ghouls, yet it's more aggressive and confident about the fact you are the best food around."
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
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

/mob/living/simple_animal/hostile/ghoul/smeagol
	name = "Smeagol"
	desc = "A small slimy creature.<br>It was probably intelligent very long time ago, but something has transformed it overtime."
	icon_state = "retro_ghoul"
	icon_living = "retro_ghoul"
	icon_dead = "retro_ghoul_d"
	icon_gib = "gib"
	maxHealth = 50
	health = 50
	speak_chance = 30
	speak = list("Gollum! Gollum!", "We wants it, we needs it. Must have the precious. They stole it from us. Sneaky little hobbitses. Wicked, tricksy, false!", "Gollum, gollum...", "The rock and pool, is nice and cool, so juicy sweet. Our only wish, to catch a fish, so juicy sweet.", "Master betrayed us. Wicked. Tricksy, False. We ought to wring his filthy little neck. Kill him! Kill him! Kill them both! And then we take the precious... And we be the master!", "He wants the Precious. Always he is looking for it. And the Precious is wanting to go back to him... But we mustn't let him have it.", "We swears to serve the master of the Precious. We will swear on... On... The Precious!", "We swear to serve the Master of the Precious... We swore on, on only... Only the Precious. Gollum, gollum!", "My Precious...", "Filthy, little hobbitses! They stole it from us!", "They cursed us. Murderer they called us. They cursed us, and drove us away. And we wept, Precious, we wept to be so alone. And we only wish to catch fish so juicy sweet. And we forgot the taste of bread... The sound of trees... The softness of the wind. We even forgot our own name. My Precious.")
	speak_emote = list("whimpers", "says")
	emote_hear = list("coughs", "whimpers", "looks around", "talks to itself", "starts to dig ground beneath it")
	emote_see = list("makes a scary face", "makes a horrible swallowing noise in his throat", "prepares to jump", "is looking for something")
	response_help  = "touches"
	response_disarm = "pushes"
	response_harm   = "kicks"
	faction = list("ghoul")
	butcher_results = list(/obj/effect/gibspawner/xeno = 1)