/datum/species/ghoul
	name = "Ghoul"
	id = "ghoul"
	limbs_id = "ghoul"
	default_color = "AB6F54"
	roundstart = 1
	armor = -30
	speedmod = 0.5
	brutemod = 1.2
	punchdamagehigh = 6
	punchstunthreshold = 6
	use_skintones = 0
	species_traits = list(RADIMMUNE, NOBLOOD, VIRUSIMMUNE)
	sexes = 0

//Ghouls have weak limbs.
/datum/species/ghoul/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	..()
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage -= 10
	C.faction |= "ghoul"
/datum/species/ghoul/on_species_loss(mob/living/carbon/C)
	..()
	C.faction -= "ghoul"
	for(var/obj/item/bodypart/b in C.bodyparts)
		b.max_damage = initial(b.max_damage)