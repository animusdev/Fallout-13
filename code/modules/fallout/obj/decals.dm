//Fallout 13 decorations

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

/obj/effect/decal/goo/New()
	..()
	icon_state = "goo[rand(1,13)]"
	START_PROCESSING(SSobj, src)
	SSradiation.processing += src

/obj/effect/decal/reflector
	name = "road reflector"
	desc = "It's one of ancient road safety devices.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "reflectorvertical" //reflectorhorizontal
	anchored = 1
	layer = 2.1

/obj/effect/decal/marking
	name = "road marking"
	desc = "Road surface markings were used on paved roadways to provide guidance and information to drivers and pedestrians."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "singlevertical" //See decals.dmi for different icon states of road markings.
	anchored = 1
	layer = 2.1

/obj/effect/decal/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was hard enough, or the decades of fallout and absence of maintenance did their part.<br>Be careful so that one of these don't fall on you from above."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	anchored = 1
	layer = 4.2