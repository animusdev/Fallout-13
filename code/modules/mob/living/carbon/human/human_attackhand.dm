/mob/living/carbon/human/attack_hulk(mob/living/carbon/human/user)
	if(user.a_intent == "harm")
		..(user, 1)
		adjustBruteLoss(15)
		if (rand(100)<=15)
			Weaken(5)
			src << "Powerful strike makes you fall down!"

/mob/living/carbon/human/attack_hand(mob/living/carbon/human/M)
	if(..())	//to allow surgery to return properly.
		return
	dna.species.spec_attack_hand(M, src)

/mob/living/carbon/human/proc/afterattack(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, inrange, params)
	return
