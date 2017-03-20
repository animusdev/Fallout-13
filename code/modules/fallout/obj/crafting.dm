// Items, which only using at crafting.
// It's in "crafting" type just to hold items clean.
/obj/item/crafting
	name = "Some item"
	desc = "Why it's here? Tell someone about it."
	icon = 'icons/fallout/objects/crafting.dmi'
	item_state = "null"
	w_class = WEIGHT_CLASS_TINY

/obj/item/crafting/diode
	name = "diode"
	desc = "That thing, which using in some electrical shit, i think."
	icon_state = "diode_1"
/obj/item/crafting/diode/New()
	..()
	icon_state = "diode_[rand(1,3)]"

/obj/item/crafting/transistor
	name = "transistor"
	desc = "Popov loved this."
	icon_state = "transistor_1"
/obj/item/crafting/transistor/New()
	..()
	icon_state = "transistor_[rand(1,3)]"

/obj/item/crafting/capacitor
	name = "capacitor"
	desc = "That holding power inside."
	icon_state = "capacitor_1"
/obj/item/crafting/capacitor/New()
	..()
	icon_state = "capacitor_[rand(1,3)]"

/obj/item/crafting/furse
	name = "furse"
	desc = "IDK WHAT IS IT."
	icon_state = "furse_1"
/obj/item/crafting/furse/New()
	..()
	icon_state = "furse_[rand(1,3)]"

/obj/item/crafting/resistor
	name = "resistor"
	desc = "Stop right there, criminal electron."
	icon_state = "resistor_1"
/obj/item/crafting/resistor/New()
	..()
	icon_state = "resistor_[rand(1,3)]"

/obj/item/crafting/switch
	name = "switch"
	desc = "Why i code it?"
	icon_state = "switch_1"
/obj/item/crafting/switch/New()
	..()
	icon_state = "switch_[rand(1,3)]"

/obj/item/crafting/bulb
	name = "bulb"
	desc = "Are you see a light?"
	icon_state = "bulb_1"
/obj/item/crafting/bulb/New()
	..()
	icon_state = "bulb_[rand(1,3)]"

/obj/item/crafting/board
	name = "board"
	desc = "Just a board."
	icon_state = "board_1"
/obj/item/crafting/board/New()
	..()
	icon_state = "board_[rand(1,3)]"

/obj/item/crafting/buzzer
	name = "buzzer"
	desc = "He is buzzing."
	icon_state = "buzzer"

/obj/item/crafting/frame
	name = "frame"
	desc = "Hm..."
	icon_state = "frame"

/obj/item/crafting/small_gear
	name = "small gear"
	desc = "Litle part of big mechanism."
	icon_state = "gear_small"

/obj/item/crafting/large_gear
	name = "large gear"
	desc = "Big part of grand mechanism."
	icon_state = "gear_large"

/obj/item/crafting/duct_tape
	name = "duct tape"
	desc = "Fix everything!"
	icon_state = "duct_tape"

/obj/item/crafting/duck_tape
	name = "duck tape"
	desc = "Fix everything!"
	icon_state = "duck_tape"

/obj/item/crafting/wonderglue
	name = "wonder glue"
	desc = "Fix everything!"
	icon_state = "wonderglue"

/obj/item/crafting/turpentine
	name = "turpentine"
	desc = "Yes!"
	icon_state = "turpentine"

/obj/item/crafting/abraxo
	name = "abraxo"
	desc = "No more imagine!"
	icon_state = "abraxo"

/obj/item/crafting/reloader
	name = "reloader"
	desc = "Reloader is reloading!"
	icon_state = "reloader"

/obj/item/crafting/igniter
	name = "igniter"
	desc = "igniter is igniting!"
	icon_state = "igniter"

/obj/item/crafting/timer
	name = "timer"
	desc = "timer is timing!"
	icon_state = "timer"

/obj/item/crafting/sensor
	name = "sensor"
	desc = "Заебался я"
	icon_state = "sensor"