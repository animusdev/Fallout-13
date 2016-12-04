/obj/item/weapon/gun/projectile/rifle
    name = "rifle"
    desc = "accurate weapon"
    burst_size = 1
    fire_delay = 15
    mag_type = /obj/item/ammo_box/magazine/m556
    slot_flags = SLOT_BACK

/obj/item/weapon/gun/projectile/rifle/update_icon()
	..()
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"]"


/obj/item/weapon/gun/projectile/rifle/m72
    name = "Gauss rifle m72"
    desc = "The M72 rifle is of German design. It uses an electromagnetic field to propel rounds at tremendous speed... and pierce almost any obstacle. Its range, accuracy and stopping power is almost unparalleled."
    origin_tech = "combat=6"
    mag_type = /obj/item/ammo_box/magazine/m2mm
    icon_state = "gaussf2"
    item_state = "gaussf2"
    w_class = 3

