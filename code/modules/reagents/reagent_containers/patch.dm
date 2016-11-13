/obj/item/weapon/reagent_containers/pill/patch
	name = "chemical patch"
	desc = "A chemical patch for touch based applications."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "bandaid"
	item_state = "bandaid"
	possible_transfer_amounts = list()
	volume = 120
	apply_type = PATCH
	apply_method = "apply"

/obj/item/weapon/reagent_containers/pill/patch/New()
	..()
	//icon_state = "bandaid" // thanks inheritance

/obj/item/weapon/reagent_containers/pill/patch/afterattack(obj/target, mob/user , proximity)
	return // thanks inheritance again

/obj/item/weapon/reagent_containers/pill/patch/canconsume(mob/eater, mob/user)
	if(!iscarbon(eater))
		return 0
	return 1 // Masks were stopping people from "eating" patches. Thanks, inheritance.

/obj/item/weapon/reagent_containers/pill/patch/styptic
	name = "brute patch"
	desc = "Helps with brute injuries."
	list_reagents = list("styptic_powder" = 60)

/obj/item/weapon/reagent_containers/pill/patch/silver_sulf
	name = "burn patch"
	desc = "Helps with burn injuries."
	list_reagents = list("silver_sulfadiazine" = 60)

/obj/item/weapon/reagent_containers/pill/patch/stimpak
	name = "Stimpak"
	desc = "Stimpak, or stimulation delivery package, is a type of hand-held medication used for healing the body. This item consists of a syringe for containing and delivering the medication and a gauge for measuring the status of the stimpak's contents. When the medicine is injected, it provides immediate healing of the body's minor wounds."
	list_reagents = list("styptic_powder" = 30, "silver_sulfadiazine" = 30)
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "15"

/obj/item/weapon/reagent_containers/pill/patch/healpowder
	name = "Healing powder"
	desc = "Soldiers of the Legion use healing powder as their primary source of medicine and healing, since the Legion bans the use of other chems, such as stimpaks."
	list_reagents = list("styptic_powder" = 15, "silver_sulfadiazine" = 15, "space_drugs" = 5)
	icon = 'icons/obj/syringe.dmi'
	item_state = "bandaid"
	icon_state = "heal_powder"

/obj/item/weapon/reagent_containers/pill/patch/supstimpak
	name = "SuperStimpak"
	desc = "The super version comes in a hypodermic, but with an additional vial containing more powerful drugs than the basic model and a leather belt to strap the needle to the injured limb."
	list_reagents = list("styptic_powder" = 60, "silver_sulfadiazine" = 60)
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "superstim_15"


/obj/item/weapon/reagent_containers/pill/patch/radaway
	name = "RadAway"
	desc = "RadAway is an intravenous chemical solution that bonds with radiation particles and passes them through the body's system. It takes some time to work, and is also a potent diuretic."
	list_reagents = list("charcoal" = 50)
	icon = 'icons/obj/bloodpack.dmi'
	item_state = "syringe_15"
	icon_state = "radaway"

/obj/item/weapon/reagent_containers/pill/patch/jet
	name = "Jet"
	desc = "Jet is a highly addictive drug first synthesized by Myron. It is extracted from brahmin dung fumes and administered via an inhaler."
	list_reagents = list("stimulants" = 30, "crank" = 10)
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "jet"

/obj/item/weapon/reagent_containers/pill/patch/psycho
	name = "Psycho"
	desc = "Psycho will increase damage resistance, allowing subjects to survive hits more easily."
	list_reagents = list("methamphetamine" = 10, "epinephrine" = 20, "inacusiate" = 5, "oculine" = 5)
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "psycho"

/obj/item/weapon/reagent_containers/pill/patch/medx
	name = "Mex-X"
	desc = "Med-X is a potent opiate analgesic that binds to opioid receptors in the brain and central nervous system, reducing the perception of pain as well as the emotional response to pain. Essentially, it is a painkiller delivered by a hypodermic needle."
	list_reagents = list("methamphetamine" = 10, "krokodil" = 10, "styptic_powder" = 10, "silver_sulfadiazine" = 10)
	icon = 'icons/obj/syringe.dmi'
	item_state = "syringe_15"
	icon_state = "medx"

/obj/item/weapon/reagent_containers/pill/patch/radx
	name = "Rad-X"
	desc = "Rad-X is an anti-radiation chemical that can significantly reduce the danger of irradiated areas."
	list_reagents = list("potass_iodide" = 30, "pen_acid" = 10)
	icon = 'icons/obj/chemical.dmi'
	icon_state = "radx"
	item_state = "radx"

/obj/item/weapon/reagent_containers/pill/patch/turbo
	name = "Turbo"
	desc = "Turbo appears as an inhaler of Jet hastily duct-taped to a can of 'HairStylez-brand hair spray. The effect of turbo is a brief slowdown of the surroundings (time goes at about 35% of its original speed), including everything from your enemies' movements, to projectile speeds (your own projectile speed included), and even the duration of the drug itself. However, you are not slowed down yourself - your own movement speed and fire rate will remain the same."
	list_reagents = list("stimulants" = 10, "methamphetamine" = 10, "crank" = 10)
	icon = 'icons/obj/chemical.dmi'
	icon_state = "turbo"
	item_state = "turbo"