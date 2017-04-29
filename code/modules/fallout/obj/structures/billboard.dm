/obj/structure/billboard
	name = "billboard"
	desc = "Shitspawn detecte."
	icon_state = "null"
	density = 1
	icon = 'icons/fallout/objects/structures/billboard.dmi'
	resistance_flags = INDESTRUCTIBLE

/obj/structure/billboard/New()
	..()

	var/atom/movable/S = new (locate(x+1,y,z))
	S.density = 1
	S.anchored = 1
	S.icon = null
	S.verbs.Cut()

/obj/structure/billboard/ritas
	name = "rita's billboard"
	desc = "Ritas!"
	icon_state = "ritas1"

/obj/structure/billboard/ritas/New()
	..()
	icon_state = "ritas[rand(1,4)]"

/obj/structure/billboard/cola
	name = "cola's billboard"
	desc = "Cola!"
	icon_state = "cola1"

/obj/structure/billboard/cola/New()
	..()
	icon_state = "cola[rand(1,4)]"