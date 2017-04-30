/obj/item/weapon/wrench/rust
	name = "rusty wrench"
	desc = "A wrench, worn and rusted with age."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "wrench_rust"
	force = 4
	throwforce = 5
	materials = list(MAT_METAL=100)

/obj/item/weapon/wirecutters/rust
	name = "rusty wirecutters"
	desc = "A pair of wirecutters that've cut many, many wires."
	icon = 'icons/fallout/objects/items.dmi'
	icon_state = "cutters"
	force = 3

/obj/item/weapon/wirecutters/rust/New()
	..()
	icon_state = "[icon_state]_rust" //Either as normal or goes with the above New() and becomes "cutters-y_rust"