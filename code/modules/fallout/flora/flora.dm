/obj/structure/flora/grass/wasteland
	icon = 'icons/fallout/flora/flora.dmi'
	icon_state = "tall_grass_1"

/obj/structure/flora/grass/wasteland/New()
	..()

	icon_state = "tall_grass_[rand(1, 8)]"//16)]"