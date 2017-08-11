//Plasma bolts
/obj/item/projectile/beam/plasma
	name = "plasma"
	damage = 32
	irradiate = 4
	icon_state = "plasma"
	icon = 'icons/fallout/objects/guns/projectiles.dmi'
	impact_effect_type = /obj/effect/overlay/temp/impact_effect/plasma
	light_color = LIGHT_COLOR_GREEN
	pass_flags = PASSTABLE | PASSGRILLE

/obj/item/projectile/beam/plasma/turbo
	name = "turbo plasma"
	damage = 52
	irradiate = 20

//Bullets library
/obj/item/projectile/bullet/F13

//Bullets library: 9mm
/obj/item/projectile/bullet/F13/c9mmBullet
	damage = 14

/obj/item/projectile/bullet/F13/c9mmBullet/heap
	damage = 26
	armour_penetration = -22

/obj/item/projectile/bullet/F13/c9mmBullet/armourpiercing
	damage = 12
	armour_penetration = 22

/obj/item/projectile/bullet/F13/c9mmBullet/toxic
	damage = 12
	damage_type = TOX

/obj/item/projectile/bullet/F13/c9mmBullet/fire
	damage = 10

/obj/item/projectile/bullet/F13/c9mmBullet/fire/on_hit(atom/target, blocked = 0)
	if(..(target, blocked))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()

//Bullets library: 10mm
/obj/item/projectile/bullet/F13/c10mmBullet
	damage = 16

/obj/item/projectile/bullet/F13/c10mmBullet/heap
	damage = 32
	armour_penetration = -28

/obj/item/projectile/bullet/F13/c10mmBullet/armourpiercing
	damage = 14
	armour_penetration = 28

/obj/item/projectile/bullet/F13/c10mmBullet/toxic
	damage = 14
	damage_type = TOX

/obj/item/projectile/bullet/F13/c10mmBullet/fire
	damage = 12

/obj/item/projectile/bullet/F13/c10mmBullet/fire/on_hit(atom/target, blocked = 0)
	if(..(target, blocked))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()

//Bullets library: 44mm
/obj/item/projectile/bullet/F13/c44mmBullet
	damage = 34

/obj/item/projectile/bullet/F13/c44mmBullet/heap
	damage = 52
	armour_penetration = -45

/obj/item/projectile/bullet/F13/c44mmBullet/armourpiercing
	damage = 24
	armour_penetration = 32

/obj/item/projectile/bullet/F13/c44mmBullet/toxic
	damage = 32
	damage_type = TOX

/obj/item/projectile/bullet/F13/c44mmBullet/fire
	damage = 20

/obj/item/projectile/bullet/F13/c44mmBullet/fire/on_hit(atom/target, blocked = 0)
	if(..(target, blocked))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()

//Bullets library: 308mm
/obj/item/projectile/bullet/F13/c308mmBullet
	damage = 36

/obj/item/projectile/bullet/F13/c308mmBullet/toxic
	damage = 34
	damage_type = TOX

/obj/item/projectile/bullet/F13/c308mmBullet/heap
	damage = 48
	armour_penetration = -44

/obj/item/projectile/bullet/F13/c308mmBullet/armourpiercing
	damage = 32
	armour_penetration = 44

/obj/item/projectile/bullet/F13/c308mmBullet/fire
	damage = 28

/obj/item/projectile/bullet/F13/c308mmBullet/fire/on_hit(atom/target, blocked = 0)
	if(..(target, blocked))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()

//Bullets library: 223mm
/obj/item/projectile/bullet/F13/c223mmBullet
	damage = 22

/obj/item/projectile/bullet/F13/c223mmBullet/toxic
	damage = 20
	damage_type = TOX

/obj/item/projectile/bullet/F13/c223mmBullet/heap
	damage = 36
	armour_penetration = -32

/obj/item/projectile/bullet/F13/c223mmBullet/armourpiercing
	damage = 18
	armour_penetration = 32

/obj/item/projectile/bullet/F13/c223mmBullet/fire
	damage = 16

/obj/item/projectile/bullet/F13/c223mmBullet/fire/on_hit(atom/target, blocked = 0)
	if(..(target, blocked))
		var/mob/living/M = target
		M.adjust_fire_stacks(1)
		M.IgniteMob()