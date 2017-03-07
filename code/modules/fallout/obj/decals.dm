//Fallout 13 decorations

/obj/effect/decal/goo
	name = "puddle of goo"
	desc = "A puddle of sticky, incredibly toxic and likely radioactive green goo."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "goo1"
	anchored = 1
	level = 2.1

/obj/effect/decal/goo/New()
	..()
	icon_state = "goo[rand(1,13)]"
	light_color = LIGHT_COLOR_SLIME_LAMP
	light_power = 1
	light_range = 2

/obj/effect/decal/decoration //Generic decoration. See decals.dmi - there are more things to choose the proper icon_state in map editor.
	name = "rag"
	desc = "It's a torn and dirty rag.<br>It could have been a curtain, or a bedsheet ages ago..."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "rag" //skulls, skin
	anchored = 1
	level = 4.2

/obj/effect/decal/sign //Signs.
	name = "sign"
	desc = "It's a standard sign, created to provide some important (or not so) information about the current location."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "vault_blank" //See decals.dmi for different icon states for different signs.
	anchored = 1
	level = 2.1

/obj/effect/decal/clock //Wall clocks.
	name = "clock"
	desc = "It's an ancient instrument to indicate, keep, and co-ordinate time.<br>This particular clock has stopped at 06:45 / 18:45<br>Why did it stop? The clock itself appears to be intact."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "clock"
	anchored = 1
	level = 2.1

/obj/effect/decal/clock/active
	name = "clock"
	desc = "It's an ancient instrument to indicate, keep, and co-ordinate time.<br>You can hear a quiet ticking coming from the clock."
	icon_state = "clock_act"
	anchored = 1

/obj/effect/decal/clock/old
	name = "\improper old clock"
	desc = "It's an ancient instrument to indicate, keep, and co-ordinate time.<br>The clock was stopped by a distant nuclear blast on October 23, 2077 at 09:49 a.m."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock"
	anchored = 1
	level = 2.1

/obj/effect/decal/clock/oldactive
	name = "\improper old clock"
	desc = "It's an ancient instrument to indicate, keep, and co-ordinate time.<br>Despite the age, this particular clock is still functional and you can hear a quiet ticking coming from it."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock_act"
	anchored = 1
	level = 2.1

/obj/effect/decal/vent //Decorative vents for vaults and bunkers.
	name = "vent"
	desc = "It's an exhaust ventilation system designed to keep the air safe via several stages of filtering."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "ventblue" //ventred, ventorange
	anchored = 1
	level = 2.1

/obj/effect/decal/vent/rusty
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some wierd sounds coming from the insides of the vent."
	icon_state = "ventrusty" //ventrustyalt
	anchored = 1

/obj/effect/decal/hatch //Road decorations
	name = "street water drain"
	desc = "It's the ancient drainage system to protect the roads from flooding."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "hatch" // hatchbroken
	anchored = 1
	level = 2.1

/obj/effect/decal/reflector
	name = "road reflector"
	desc = "It's one of ancient road safety devices.<br>Here's how it works:<br>A reflective plate is reflecting the street and car lights ensuring the visibility of the road median separating the lanes.<br>The steel part makes a small regular bump along the median to wake the driver if he/she drifts across."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "reflectorvertical" //reflectorhorizontal
	anchored = 1
	level = 2.1

/obj/effect/decal/marking
	name = "road marking"
	desc = "Road surface markings were used on paved roadways to provide guidance and information to drivers and pedestrians."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "singlevertical" //See decals.dmi for different icon states of road markings.
	anchored = 1
	level = 2.1

/obj/effect/decal/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was hard enough, or the decades of fallout and absence of maintenance did their part.<br>Be careful so that one of these don't fall on you from above."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	anchored = 1
	level = 4.2