/obj/item/weapon/machete
	name = "Machete"
	desc = "The machete appears to be a makeshift weapon, and consists of a lawn mower blade strapped to a wooden handle. It is the primary melee weapon of Caesar's Legion. Aside from having a low Strength requirement, it also does bonus damage to limbs."
	icon_state = "machete"
	item_state = "machete"
	flags = CONDUCT
	slot_flags = SLOT_BELT
	force = 35
	throwforce = 15
	w_class = 3
	hitsound = 'sound/weapons/bladeslice.ogg'
	icon = 'icons/fallout/objects/melee.dm'
	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	block_chance = 20
	sharpness = IS_SHARP

/obj/item/weapon/golf
	name = "9 iron"
	desc = "This old 9 iron is bent and battered after many years of exposure to the elements."
	icon_state = "golf"
	item_state = "golf"
	slot_flags = SLOT_BELT
	force = 30
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 1
	icon = 'icons/fallout/objects/melee.dm'

/obj/item/weapon/golf/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/pipe
	name = "Pipe"
	desc = "One of the ends has tape wrapped around it to improve grip, while the other is heavily corroded and/or bloodstained, and topped with a pipe fitting. Though it has a short reach, it has decent damage and a fast swing, making it a good melee weapon for players who are just starting out. "
	icon_state = "pipe"
	item_state = "pipe"
	slot_flags = SLOT_BELT
	force = 20
	throw_speed = 3
	throw_range = 4
	throwforce = 20
	w_class = 1
	icon = 'icons/fallout/objects/melee.dm'

/obj/item/weapon/pipe/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)

/obj/item/weapon/powergauntlet
	name = "Powergauntlet"
	desc = "Power Knuckles 'Big ram' produced by Beau. Most consider him the best weapon for close combat. The rest of it's just fear. Power is provided by small batteries"
	icon_state = "powergauntlet"
	item_state = "powergauntlet"
	slot_flags = SLOT_BELT
	force = 35
	throw_speed = 3
	throw_range = 4
	throwforce = 10
	w_class = 1
	icon = 'icons/fallout/objects/melee.dm'

/obj/item/weapon/powergauntlet/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is impaling \himself with the [src.name]! It looks like \he's trying to commit suicide.</span>")
	return (BRUTELOSS|FIRELOSS)