/obj/item/weapon/
	name = "weapon"
	icon = 'icons/obj/weapons.dmi'

/obj/item/attack_hulk(mob/user)
	src.attack_hand(user)

/obj/item/weapon/New()
	..()
	if(!hitsound)
		if(damtype == "fire")
			hitsound = 'sound/items/welder.ogg'
		if(damtype == "brute")
			hitsound = "swing_hit"
