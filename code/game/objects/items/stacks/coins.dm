/obj/item/stack/caps
	name = "bottle caps"
	singular_name = "bottle cap"
	desc = "A single bottle cap, taken from the top of a bottle, widely used as currency within the wastelands."
	icon = 'icons/obj/caps.dmi'
	icon_state = "cap"
	amount = 1
	max_amount = 20
	throwforce = 0
	throw_speed = 2
	throw_range = 2
	w_class = 1

/obj/item/stack/caps/New()
	..()
	update_icon()

/obj/item/stack/caps/update_icon()
	..()
	icon_state = "[amount]"
	if(amount == 1 && (istype(src.loc, /mob/living) || istype(src.loc, /obj/item/weapon/storage)))
		icon_state = "cap"

/obj/item/stack/caps/dropped()
	..()
	update_icon()

/obj/item/stack/caps/ten
	amount = 10
	icon_state = "10"

/obj/item/stack/caps/twenty
	amount = 20
	icon_state = "20"

/obj/item/stack/caps/random/New()
	amount = rand(1,max_amount)
	..()