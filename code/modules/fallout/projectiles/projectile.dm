//Fallout 13 plasma directory

/obj/item/projectile/beam/plasma
	name = "plasma"
	damage = 40
	irradiate = 15
	icon_state = "plasma_beam"
	icon = 'icons/fallout/objects/guns/projectiles.dmi'
	impact_effect_type = /obj/effect/overlay/temp/impact_effect/plasma
	light_range = 1
	light_color = LIGHT_COLOR_GREEN
	pass_flags = PASSTABLE | PASSGRILLE

/obj/item/projectile/beam/plasma/turbo
	name = "turbo plasma"
	damage = 75
