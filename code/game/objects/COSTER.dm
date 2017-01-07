/obj/coster
	name = "Campfire"
	desc = "Burns your ass"
	icon = 'icons/camp.dmi'
	icon_state = "campfire20"
	luminosity = 0
	anchored = 1
	var/fuel = 0
	var/icon_on = "campfire21"
	var/icon_off = "campfire20"

/obj/coster/New()
	..()
	machines += src
	SSmachine.processing += src

/obj/machinery/Destroy()
	machines.Remove(src)
	SSmachine.processing -= src
	return ..()

/obj/coster/process()
	if ((fuel)>0)
		fuel--
	if ((fuel)==0)
		icon_state = icon_off
		luminosity = 0

/obj/coster/attackby(var/obj/item/weapon/P, var/mob/living/carbon/human/user)
	if(istype(P, /obj/item/stack/sheet/mineral/wood))
		del(P)
		update_icon(usr)
		fuel+= 420
		SetLuminosity(6)
		icon_state = icon_on

/*&/obj/coster/campfire1
	icon_state = "campfire_o"
	luminosity = 6
	anchored = 1
	icon_on = "campfire_o"
	icon_off = "campfire0"*/

/obj/coster/bonefire
	name = "BoneFire"
	desc = "Lost souls again?"
	icon_state = "souls"
	luminosity = 6
	anchored = 1
	icon_on = "souls"
	process()
		return
