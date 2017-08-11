//Fallout 13 syringes by (moron) Gargule
/obj/item/weapon/reagent_containers/f13stimpack //(Gargule)
	name = "Stimpack"
	desc = "A stimpak, or stimulation delivery package, is a type of hand-held medication used for healing the body. This item consists of a syringe for containing and delivering the medication and a gauge for measuring the status of the stimpak's contents. When the medicine is injected, it provides immediate healing of the body's minor wounds."
	icon = 'icons/fallout/objects/medicine/syringe.dmi'
	icon_state = "stim"
	item_state = "medipen"
	volume = 8
	amount_per_transfer_from_this = 8
	container_type = 0
	list_reagents = list("stimpackium" = 8)
	flags = null
	var/def_volume = 8
	var/reloadable = 0
	var/ignore_flags = 1

/obj/item/weapon/reagent_containers/f13stimpack/New()
	..()

	// u r braindead, Gargule -- Konata
	for(var/r in src.list_reagents)
		src.reagents.add_reagent(r, list_reagents[r])

/obj/item/weapon/reagent_containers/f13stimpack/update_icon()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/weapon/reagent_containers/f13stimpack/attack_paw(mob/user)
	return attack_hand(user)

/obj/item/weapon/reagent_containers/f13stimpack/attack(mob/living/M, mob/user)
	if(!reagents.total_volume)
		to_chat(user, "<span class='warning'>[src] is empty!</span>")
		return
	if(!iscarbon(M))
		return
	if(reloadable)
		to_chat(user, "<span class='warning'>[src] is unscrewed!</span>")
		return

	if(reagents.total_volume && (ignore_flags || M.can_inject(user, 1))) // Ignore flag should be checked first or there will be an error message.
		to_chat(M, "<span class='warning'>You feel a tiny prick!</span>")
		to_chat(user, "<span class='notice'>You inject [M] with [src].</span>")

		var/fraction = min(amount_per_transfer_from_this/reagents.total_volume, 1)
		reagents.reaction(M, INJECT, fraction)
		if(M.reagents)
			var/list/injected = list()
			for(var/datum/reagent/R in reagents.reagent_list)
				injected += R.name
			var/trans = 0
			trans = reagents.trans_to(M, amount_per_transfer_from_this)
			update_icon()
			volume = 0
			to_chat(user, "<span class='notice'>[trans] unit\s injected.  [reagents.total_volume] unit\s remaining in [src].</span>")

			var/contained = english_list(injected)

			add_logs(user, M, "injected", src, "([contained])")

/obj/item/weapon/reagent_containers/f13stimpack/attackby(obj/item/weapon/W,mob/user,params)
	if(istype(W,/obj/item/weapon/screwdriver))
		if(!container_type && !volume)
			playsound(get_turf(user), W.usesound, 50, 1)
			container_type = OPENCONTAINER
			icon_state = "[initial(icon_state)]_unscrew"
			volume = src.def_volume
		//	return
		else
			if(container_type == OPENCONTAINER)
				playsound(get_turf(user), W.usesound, 50, 1)
				reloadable = 0
				container_type = 0
				volume = src.reagents.total_volume
				update_icon()
		//	return
	//if(istype(W,/obj/item/weapon/reagent_containers) && W.reagents.total_volume >= volume)

/obj/item/weapon/reagent_containers/f13stimpack/examine()
	..()
	if(reagents && reagents.reagent_list.len)
		to_chat(usr, "<span class='notice'>It is currently loaded.</span>")
	else
		to_chat(usr, "<span class='notice'>It is spent.</span>")


/obj/item/weapon/reagent_containers/f13stimpack/super
	name = "SuperStimpack"
	desc = "The super version of the Stimpak has an additional vial containing more powerful drugs than the basic model, as well as a leather belt to strap the needle to the injured limb."
	icon_state = "superstim"
	volume = 12
	amount_per_transfer_from_this = 12
	list_reagents = list("supstimpackium" = 12)
//end

