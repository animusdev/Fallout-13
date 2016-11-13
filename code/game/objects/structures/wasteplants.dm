/obj/structure/broc
	name = "Broc"
	desc = "It's waste plant."
	icon = 'icons/obj/Plants.dmi'
	icon_state = "broc"
	anchored = 1
	density = 0
	var has_plod = 1

/obj/structure/broc/attack_hand(mob/user)
	if(isrobot(user) || isalien(user))
		return
	if(has_plod)
		user.put_in_hands(new/obj/item/weapon/reagent_containers/food/snacks/grown/broc)
		user << "<span class='notice'>You take plod from [src].</span>"
		has_plod = null
	update_icon()

/obj/structure/broc/update_icon()
	if(has_plod)
		icon_state = "broc"
	else
		icon_state = "broc_no"

/obj/structure/xander
	name = "Xander"
	desc = "It's waste plant."
	icon = 'icons/obj/Plants.dmi'
	icon_state = "xander"
	anchored = 1
	density = 0
	var has_plod = 1

/obj/structure/xander/attack_hand(mob/user)
	if(isrobot(user) || isalien(user))
		return
	if(has_plod)
		user.put_in_hands(new/obj/item/weapon/reagent_containers/food/snacks/grown/xander)
		user << "<span class='notice'>You take plod from [src].</span>"
		has_plod = null
	update_icon()

/obj/structure/xander/update_icon()
	if(has_plod)
		icon_state = "xander"
	else
		icon_state = "xander_no"

/obj/structure/feracactus
	name = "Feracactus"
	desc = "It's waste plant."
	icon = 'icons/obj/Plants.dmi'
	icon_state = "cactus"
	anchored = 1
	density = 0
	var has_plod = 1

/obj/structure/feracactus/attack_hand(mob/user)
	if(isrobot(user) || isalien(user))
		return
	if(has_plod)
		user.put_in_hands(new/obj/item/weapon/reagent_containers/food/snacks/grown/feracactus)
		user << "<span class='notice'>You take plod from [src].</span>"
		has_plod = null
	update_icon()

/obj/structure/feracactus/update_icon()
	if(has_plod)
		icon_state = "cactus"
	else
		icon_state = "cactus_no"

/obj/structure/mutfruit
	name = "Mutfruit"
	desc = "It's waste plant."
	icon = 'icons/obj/Plants.dmi'
	icon_state = "mutfruit"
	anchored = 1
	density = 0
	var has_plod = 1

/obj/structure/mutfruit/attack_hand(mob/user)
	if(isrobot(user) || isalien(user))
		return
	if(has_plod)
		user.put_in_hands(new/obj/item/weapon/reagent_containers/food/snacks/grown/mutfruit)
		user << "<span class='notice'>You take plod from [src].</span>"
		has_plod = null
	update_icon()

/obj/structure/mutfruit/update_icon()
	if(has_plod)
		icon_state = "mutfruit"
	else
		icon_state = "mutfruit_no"

/obj/structure/fungus
	name = "Cave fungus"
	desc = "It's waste plant."
	icon = 'icons/obj/Plants.dmi'
	icon_state = "fungus"
	anchored = 1
	density = 0
	var has_plod = 1

/obj/structure/fungus/attack_hand(mob/user)
	if(isrobot(user) || isalien(user))
		return
	if(has_plod)
		user.put_in_hands(new/obj/item/weapon/reagent_containers/food/snacks/grown/fungus)
		user << "<span class='notice'>You take plod from [src].</span>"
		has_plod = null
	update_icon()

/obj/structure/fungus/update_icon()
	if(has_plod)
		icon_state = "fungus"
	else
		icon_state = "fungus_no"