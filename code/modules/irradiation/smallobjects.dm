
//Add radiation effects for small irradiated objects
//Some radiation damage is applied when the objects are picked up


/obj/item/weapon/ore/uranium/pickup(mob/living/user)
	user.apply_damage(5, TOX)