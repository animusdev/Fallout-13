//Fallout 13 structural decorations directory

/obj/structure/decoration
	anchored = 1
	level = ABOVE_NORMAL_TURF_LAYER

/obj/structure/decoration/rag //Generic decoration. See decals.dmi - there are more things to choose the proper icon_state in map editor.
	name = "rag"
	desc = "A torn, dirty rag.<br>It could have been a curtain or a bedsheet ages ago..."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "rag" //skulls, skin
	layer = 3.2

/obj/structure/decoration/sign //Signs.
	name = "sign"
	desc = "A standard sign, created to provide some important information about the current location."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "vault_blank" //See decals.dmi for different icon states for different signs.

/obj/structure/decoration/clock //Wall clocks.
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and coordinate time.<br>This particular clock stopped at 6:45 PM. <br><i>Why did it stop?</i><br>The clock appears to be intact."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "clock"

/obj/structure/decoration/clock/active
	name = "clock"
	desc = "An ancient instrument to indicate, keep, and coordinate time.<br>Somehow, it's still intact and functioning.<br>You can hear a quiet ticking coming from the clock."
	icon_state = "clock_act"

/obj/structure/decoration/clock/old
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and coordinate time.<br>This clock is stopped at 9:49 AM, a few minutes after the bombs fell on October 23rd, 2077."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock"

/obj/structure/decoration/clock/old/active
	name = "\improper old clock"
	desc = "An ancient instrument to indicate, keep, and coordinate time.<br>Despite its age, this particular clock is still functional.<br>You can hear a quiet ticking coming from the clock."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "old_clock_act"

/obj/structure/decoration/vent //Decorative vents for vaults and bunkers.
	name = "vent"
	desc = "An exhaust ventilation system designed to keep the vault's internal air safe by passing it through several filter stages."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "ventblue" //ventred, ventorange

/obj/structure/decoration/vent/rusty
	name = "rusty vent"
	desc = "It's very old and rusty.<br>You can hear some faint, strange sounds coming from under the vent."
	icon_state = "ventrusty" //ventrustyalt

/obj/structure/decoration/ruins //Ruin decorations - they overlap the player most of time, thus they provide a nearly perfect hiding spot.
	name = "\improper ruins"
	desc = "Either the blast nearby was powerful enough, or the decades of fallout and absence of maintenance did their part.<br>These have been known to fall on passers-by from above."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "overlap" //See decals.dmi for different icon states of ruins overlays.
	layer = 4.2

/obj/structure/decoration/hatch //Road decorations
	name = "street water drain"
	desc = "An ancient drainage system to protect the roads from flooding.<br>Nowadays they are filled with irradiated rain water."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "hatch" // hatchbroken

/obj/structure/decoration/reflector
	name = "road reflector"
	desc = "An ancient road safety device. In pre-War times, it would reflect the light of vehicles' headlights to ensure visibility of the median between lanes."
	icon = 'icons/fallout/objects/decals.dmi'
	icon_state = "reflectorvertical" //reflectorhorizontal