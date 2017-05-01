//Fallout 13 decorative decals - the rest of pure decorative stuff is in decor.dm

/obj/effect/decal/goo
	name = "puddle of goo"
	desc = "A puddle of sticky, incredibly toxic and likely radioactive green goo."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "goo1"
	anchored = 1
	layer = 2.1
	light_color = LIGHT_COLOR_GREEN
	light_power = 0.5
	light_range = 3
	rad_heavy_range = 1
	rad_light_range = 4
	rad_severity = 10

/obj/effect/decal/goo/initialize()
	..()
	icon_state = "goo[rand(1,13)]"
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/effect/decal/marking
	name = "road marking"
	desc = "Road surface markings were used on paved roadways to provide guidance and information to drivers and pedestrians."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "singlevertical" //See decals.dmi for different icon states of road markings.
	anchored = 1
	layer = 2.1