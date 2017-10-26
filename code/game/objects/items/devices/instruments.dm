//copy pasta of the space piano, don't hurt me -Pete
/obj/item/device/instrument
	name = "generic instrument"
	resistance_flags = FLAMMABLE
	obj_integrity = 100
	max_integrity = 100
	var/datum/song/handheld/song
	var/instrumentId = "generic"
	var/instrumentExt = "ogg"

/obj/item/device/instrument/New()
	song = new(instrumentId, src)
	song.instrumentExt = instrumentExt
	..()

/obj/item/device/instrument/Destroy()
	qdel(song)
	song = null
	return ..()

/obj/item/device/instrument/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] begins to play 'Gloomy Sunday'! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return (BRUTELOSS)

/obj/item/device/instrument/initialize()
	song.tempo = song.sanitize_tempo(song.tempo) // tick_lag isn't set when the map is loaded
	..()

/obj/item/device/instrument/attack_self(mob/user)
	if(!user.IsAdvancedToolUser())
		to_chat(user, "<span class='warning'>You don't have the dexterity to do this!</span>")
		return 1
	interact(user)

/obj/item/device/instrument/interact(mob/user)
	if(!user)
		return

	if(!isliving(user) || user.stat || user.restrained() || user.lying)
		return

	user.set_machine(src)
	song.interact(user)

/obj/item/device/instrument/violin
	name = "space violin"
	desc = "A wooden musical instrument with four strings and a bow. \"The devil went down to space, he was looking for an assistant to grief.\""
	icon = 'icons/obj/musician.dmi'
	icon_state = "violin"
	item_state = "violin"
	force = 10
	hitsound = "swing_hit"
	instrumentId = "violin"

/obj/item/device/instrument/violin/golden
	name = "golden violin"
	desc = "A golden musical instrument with four strings and a bow. \"The devil went down to space, he was looking for an assistant to grief.\""
	icon_state = "golden_violin"
	item_state = "golden_violin"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/device/instrument/guitar
	name = "guitar"
	desc = "It's made of wood and has bronze strings."
	icon = 'icons/obj/musician.dmi'
	icon_state = "guitar"
	item_state = "guitar"
	force = 10
	attack_verb = list("played metal on", "serenaded", "crashed", "smashed")
	hitsound = 'sound/weapons/stringsmash.ogg'
	instrumentId = "guitar"

/obj/item/device/instrument/guitar/jc
	name = "guitar"
	desc = "It's made of wood and has steel strings.<br>The leather belt is folded behind it and the letters J.C. are engraved on the headstock."
	icon_state = "guitarjc"
	item_state = "guitarjc"

/obj/item/device/instrument/eguitar
	name = "electric guitar"
	desc = "Makes all your shredding needs possible."
	icon = 'icons/obj/musician.dmi'
	icon_state = "eguitar"
	item_state = "eguitar"
	force = 15
	attack_verb = list("played metal on", "shredded", "crashed", "smashed")
	hitsound = 'sound/weapons/stringsmash.ogg'
	instrumentId = "eguitar"

//Harmonica

/obj/item/device/harmonica
	name = "harmonica"
	desc = "<font face='Comic sans MS' color='#fd680e'>much blues.</font> <font face='Comic sans MS' color='green'>such music.</font> <font face='Comic sans MS' color='blue'>so amaze.</font> <font face='Comic sans MS' color='red'>wow.</font>"
	icon = 'icons/obj/musician.dmi'
	icon_state = "harmonica"
	item_state = "harmonica"
	force = 2
	w_class = WEIGHT_CLASS_TINY
	materials = list(MAT_METAL=500)
	var/spam_flag = 0
	var/cooldown = 70


/obj/item/device/harmonica/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M) || M != user)
		return ..()

	if(spam_flag == 0)
		if(user.zone_selected == "mouth")
			spam_flag = 1
			to_chat(M, pick("[user] plays a bluesy tune with the harmonica!", "[user] plays a warm tune with the harmonica!", \
			"[user] plays a delightful tune with the harmonica!", "[user] plays a chilling tune with the harmonica!", "[user] plays an upbeat tune with the harmonica!"))//G00Ns were here.
			playsound(src.loc, "harmonica", 80)
			src.add_fingerprint(user)
			spawn(cooldown)
			spam_flag = 0
	return

	spawn(cooldown)
		spam_flag = 0

	return