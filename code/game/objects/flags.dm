/obj/item/flag
	name = "empty flag"
	desc = "you can put there some leather."
	density = 1
	anchored = 1
	w_class = 4

	layer = 4.1
	pixel_x = -3
	icon = 'icons/obj/flags.dmi'
	icon_state = "emptyflag"
	item_state = "emptyflag"
	var/faction = null

/obj/item/flag/ncr
	name = "NCR flag"
	icon_state = "ncrflag"
	item_state = "ncrflag"
	faction = "NCR"

/obj/item/flag/legion
	name = "Legion flag"
	icon_state = "legionflag"
	item_state = "legionflag"
	faction = "Legion"

/obj/item/flag/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/stack/sheet/gekkonhide) && item_state == "emptyflag")
		var/flag = user.get_flag()
		if(flag)
			visible_message("<span class='notice'>[user] begin to make a flag.</span>")
			if(do_after(user,20, target = src))
				var/obj/item/stack/sheet/gekkonhide/H = I
				if(H.use(1))
					switch(flag)
						if("ncr")
							name = "NCR flag"
							icon_state = "ncrflag"
							item_state = "ncrflag"
							faction = "NCR"
						if("legion")
							name = "Legion flag"
							icon_state = "legionflag"
							item_state = "legionflag"
							faction = "Legion"
					update_icon()
	else
		attack_hand(user)

/obj/item/flag/attack_hand(mob/user)
	if(item_state != "emptyflag" && faction != user.faction)
		visible_message("<span class='notice'>[user] begin to remove a flag.</span>")
		if(do_after(user,20, target = src) && faction)
			new /obj/item/stack/sheet/gekkonhide(loc)
			name = "empty flag"
			icon_state = "emptyflag"
			item_state = "emptyflag"
			faction = null
			update_icon()
	else
		anchored = 0
		..()
/obj/item/flag/dropped(mob/user)
	..()
	anchored = 1
/obj/item/flag/throw_at(atom/target, range, speed, mob/thrower, spin=1)
	dropped(thrower)