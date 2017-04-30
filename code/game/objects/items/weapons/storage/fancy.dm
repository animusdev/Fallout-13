/*
 * The 'fancy' path is for objects like donut boxes that show how many items are in the storage item on the sprite itself
 * .. Sorry for the shitty path name, I couldnt think of a better one.
 *
 * WARNING: var/icon_type is used for both examine text and sprite name. Please look at the procs below and adjust your sprite names accordingly
 *		TODO: Cigarette boxes should be ported to this standard
 *
 * Contains:
 *		Donut Box
 *		Egg Box
 *		Candle Box
 *		Cigarette Box
 *		Cigar Case
 */

/obj/item/weapon/storage/fancy
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "donutbox6"
	name = "donut box"
	resistance_flags = FLAMMABLE
	var/icon_type = "donut"
	var/spawn_type = null
	var/fancy_open = FALSE

/obj/item/weapon/storage/fancy/New()
	..()
	for(var/i = 1 to storage_slots)
		new spawn_type(src)

/obj/item/weapon/storage/fancy/update_icon(itemremoved = 0)
	if(fancy_open)
		var/total_contents = src.contents.len - itemremoved
		icon_state = "[icon_type]box[total_contents]"
	else
		icon_state = "[icon_type]box"

/obj/item/weapon/storage/fancy/examine(mob/user)
	..()
	if(fancy_open)
		if(contents.len == 1)
			to_chat(user, "There is one [src.icon_type] left.")
		else
			to_chat(user, "There are [contents.len <= 0 ? "no" : "[src.contents.len]"] [src.icon_type]s left.")

/obj/item/weapon/storage/fancy/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()

/obj/item/weapon/storage/fancy/content_can_dump(atom/dest_object, mob/user)
	. = ..()
	if(.)
		fancy_open = TRUE
		update_icon()

/obj/item/weapon/storage/fancy/handle_item_insertion(obj/item/W, prevent_warning = 0, mob/user)
	fancy_open = TRUE
	return ..()

/obj/item/weapon/storage/fancy/remove_from_storage(obj/item/W, atom/new_location, burn = 0)
	fancy_open = TRUE
	return ..()

/*
 * Donut Box
 */

/obj/item/weapon/storage/fancy/donut_box
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "donutbox6"
	icon_type = "donut"
	name = "donut box"
	storage_slots = 6
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/donut)
	spawn_type = /obj/item/weapon/reagent_containers/food/snacks/donut
	fancy_open = TRUE

/*
 * Egg Box
 */

/obj/item/weapon/storage/fancy/egg_box
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "eggbox"
	icon_type = "egg"
	name = "egg box"
	storage_slots = 12
	can_hold = list(/obj/item/weapon/reagent_containers/food/snacks/egg)
	spawn_type = /obj/item/weapon/reagent_containers/food/snacks/egg

/*
 * Candle Box
 */

/obj/item/weapon/storage/fancy/candle_box
	name = "candle pack"
	desc = "A pack of red candles."
	icon = 'icons/obj/candle.dmi'
	icon_state = "candlebox5"
	icon_type = "candle"
	item_state = "candlebox5"
	storage_slots = 5
	throwforce = 2
	slot_flags = SLOT_BELT
	spawn_type = /obj/item/candle
	fancy_open = TRUE

/obj/item/weapon/storage/fancy/candle_box/attack_self(mob_user)
	return

////////////
//CIG PACK//
////////////
/obj/item/weapon/storage/fancy/cigarettes
	name = "Big Boss Cigarettes"
	desc = "A small box containing pre-War cigarettes.<br>Its valued by merchants for moderate rarity, solid quality and high demand.<br>This box is labeled with the name of a brand or company, \"Big Boss\" .<br>An image of a snake is seen on both sides of the box."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cig"
	item_state = "cigpacket"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	slot_flags = SLOT_BELT
	storage_slots = 6
	can_hold = list(/obj/item/clothing/mask/cigarette, /obj/item/weapon/lighter)
	icon_type = "cigarette"
	spawn_type = /obj/item/clothing/mask/cigarette

/obj/item/weapon/storage/fancy/cigarettes/New()
	..()
	create_reagents(15 * storage_slots)//so people can inject cigarettes without opening a packet, now with being able to inject the whole one
	reagents.set_reacting(FALSE)
	for(var/obj/item/clothing/mask/cigarette/cig in src)
		cig.desc = "\An [name] brand [cig.name]."
	name = "\improper [name] packet"

/obj/item/weapon/storage/fancy/cigarettes/AltClick(mob/user)
	if(user.get_active_held_item())
		return
	for(var/obj/item/weapon/lighter/lighter in src)
		remove_from_storage(lighter, user.loc)
		user.put_in_active_hand(lighter)
		break

/obj/item/weapon/storage/fancy/cigarettes/update_icon()
	if(fancy_open || !contents.len)
		cut_overlays()
		if(!contents.len)
			icon_state = "[initial(icon_state)]_empty"
		else
			icon_state = initial(icon_state)
			add_overlay("[icon_state]_open")
			var/i = contents.len
			for(var/C in contents)
				if(istype(C, /obj/item/weapon/lighter/greyscale))
					add_overlay(image(icon = src.icon, icon_state = "lighter_in", pixel_x = 1 * (i -1)))
				else if(istype(C, /obj/item/weapon/lighter))
					add_overlay(image(icon = src.icon, icon_state = "zippo_in", pixel_x = 1 * (i -1)))
				else
					add_overlay(image(icon = src.icon, icon_state = "cigarette", pixel_x = 1 * (i -1)))
				i--
	else
		cut_overlays()

/obj/item/weapon/storage/fancy/cigarettes/remove_from_storage(obj/item/W, atom/new_location)
	if(istype(W,/obj/item/clothing/mask/cigarette))
		if(reagents)
			reagents.trans_to(W,(reagents.total_volume/contents.len))
	fancy_open = TRUE
	..()

/obj/item/weapon/storage/fancy/cigarettes/attack(mob/living/carbon/M as mob, mob/living/carbon/user as mob)
	if(!istype(M, /mob))
		return
	var/obj/item/clothing/mask/cigarette/cig = locate(/obj/item/clothing/mask/cigarette) in contents
	if(cig)
		if(M == user && contents.len > 0 && !user.wear_mask)
			var/obj/item/clothing/mask/cigarette/W = cig
			remove_from_storage(W, M)
			M.equip_to_slot_if_possible(W, slot_wear_mask)
			contents -= W
			to_chat(user, "<span class='notice'>You take a [icon_type] out of the pack.</span>")
		else
			..()
	else
		to_chat(user, "<span class='notice'>There are no [icon_type]s left in the pack.</span>")

/obj/item/weapon/storage/fancy/cigarettes/tortoise
	name = "Grey Tortoise Cigarettes"
	desc = "A packet of six imported Grey Tortoise Cigarettes. A label on the packaging reads,<br>\"There is only one home to the life of a river-mussel;<br>There is only one home to the life of a tortoise;<br>There is only one shell to the soul of man: there is only one world to the spirit of our race.<br>If that world leaves its course and smashes on boulders of the great void, whose world will give us shelter?\"" //Wole Soyinka
	icon_state = "tortoise"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_uplift
	name = "Uplift Smooth Cigarettes"
	desc = "Your favorite brand, now menthol flavored."
	icon_state = "uplift"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_robust
	name = "Robust Cigarettes"
	desc = "Smoked by the robust."
	icon_state = "robust"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_robustgold
	name = "Robust Gold Cigarettes"
	desc = "Smoked by the truly robust."
	icon_state = "robustg"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_robustgold/New()
	..()
	for(var/i = 1 to storage_slots)
		reagents.add_reagent("gold",1)

/obj/item/weapon/storage/fancy/cigarettes/cigpack_carp
	name = "Carp Classic Cigarettes"
	desc = "Since 2313."
	icon_state = "carp"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_syndicate
	name = "Unknown Cigarettes"
	desc = "An obscure brand of cigarettes."
	icon_state = "syndie"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_syndicate/New()
	..()
	for(var/i = 1 to storage_slots)
		reagents.add_reagent("omnizine",15)
	name = "cigarette packet"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_joy
	name = "Joy Cigarettes"
	desc = "A box full of joy, also the packet smells funny."
	icon_state = "joy"
	spawn_type = /obj/item/clothing/mask/cigarette/rollie

/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron
	name ="Myron's Patented Cigarettes"
	desc = "Is your weight slowing you down? Having trouble running away from hungry geckos? Can't stop stuffing your mouth with pre-War junk food? Smoke Myron's Patented Cigarettes and watch all the troubles burn away. Guaranteed results!"
	icon_state = "myron"

/obj/item/weapon/storage/fancy/cigarettes/cigpack_myron/New()
	..()
	for(var/i = 1 to storage_slots)
		reagents.add_reagent("lipolicide",4)
		reagents.add_reagent("ammonia",2)
		reagents.add_reagent("plantbgone",1)
		reagents.add_reagent("toxin",1.5)

/obj/item/weapon/storage/fancy/rollingpapers
	name = "rolling paper pack"
	desc = "Instruction: Dry any plant or fruit on a drying rack, make a rollie."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cig_paper_pack"
	storage_slots = 10
	icon_type = "rolling paper"
	can_hold = list(/obj/item/weapon/rollingpaper)
	spawn_type = /obj/item/weapon/rollingpaper

/obj/item/weapon/storage/fancy/rollingpapers/update_icon()
	cut_overlays()
	if(!contents.len)
		add_overlay("[icon_state]_empty")

/////////////
//CIGAR BOX//
/////////////

/obj/item/weapon/storage/fancy/cigarettes/cigars
	name = "\improper premium cigar case"
	desc = "A case of premium cigars. Very expensive."
	icon = 'icons/obj/cigarettes.dmi'
	icon_state = "cigarcase"
	w_class = WEIGHT_CLASS_NORMAL
	storage_slots = 5
	can_hold = list(/obj/item/clothing/mask/cigarette/cigar)
	icon_type = "premium cigar"
	spawn_type = /obj/item/clothing/mask/cigarette/cigar

/obj/item/weapon/storage/fancy/cigarettes/cigars/update_icon()
	if(fancy_open)
		cut_overlays()
		add_overlay("[icon_state]_open")
		for(var/c = contents.len, c >= 1, c--)
			add_overlay(image(icon = src.icon, icon_state = icon_type, pixel_x = 4 * (c -1)))
	else
		cut_overlays()
		icon_state = "cigarcase"

/obj/item/weapon/storage/fancy/cigarettes/cigars/cohiba
	name = "\improper cohiba robusto cigar case"
	desc = "A case of imported Cohiba cigars, renowned for their strong flavor."
	spawn_type = /obj/item/clothing/mask/cigarette/cigar/cohiba

/obj/item/weapon/storage/fancy/cigarettes/cigars/havana
	name = "\improper premium havanian cigar case"
	desc = "A case of classy Havanian cigars."
	spawn_type = /obj/item/clothing/mask/cigarette/cigar/havana
