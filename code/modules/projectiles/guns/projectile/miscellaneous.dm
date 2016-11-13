/obj/item/clothing/under/pj/red
	name = "red pj's"
	desc = "Sleepwear."
	icon_state = "red_pyjamas"
	item_color = "red_pyjamas"
	item_state = "w_suit"
	can_adjust = 0

/obj/item/clothing/under/pj/blue
	name = "blue pj's"
	desc = "Sleepwear."
	icon_state = "blue_pyjamas"
	item_color = "blue_pyjamas"
	item_state = "w_suit"
	can_adjust = 0

/obj/item/clothing/under/patriotsuit
	name = "Patriotic Suit"
	desc = "Motorcycle not included."
	icon_state = "ek"
	item_state = "ek"
	item_color = "ek"
	can_adjust = 0

/obj/item/clothing/under/sl_suit
	desc = "It's a very amish looking suit."
	name = "amish suit"
	icon_state = "sl_suit"
	item_color = "sl_suit"
	can_adjust = 0

/obj/item/clothing/under/roman
	name = "roman armor"
	desc = "Ancient Roman armor. Made of metallic and leather straps."
	icon_state = "roman"
	item_color = "roman"
	item_state = "armor"
	can_adjust = 0
	strip_delay = 100
	burn_state = FIRE_PROOF

/obj/item/clothing/under/waiter
	name = "waiter's outfit"
	desc = "It's a very smart uniform with a special pocket for tip."
	icon_state = "waiter"
	item_state = "waiter"
	item_color = "waiter"
	can_adjust = 0

/obj/item/clothing/under/rank/prisoner
	name = "prison jumpsuit"
	desc = "It's standardised Nanotrasen prisoner-wear. Its suit sensors are stuck in the \"Fully On\" position."
	icon_state = "prisoner"
	item_state = "o_suit"
	item_color = "prisoner"
	has_sensor = 2
	sensor_mode = 3
	random_sensor = 0

/obj/item/clothing/under/rank/mailman
	name = "mailman's jumpsuit"
	desc = "<i>'Special delivery!'</i>"
	icon_state = "mailman"
	item_state = "b_suit"
	item_color = "mailman"

/obj/item/clothing/under/rank/psyche
	name = "psychedelic jumpsuit"
	desc = "Groovy!"
	icon_state = "psyche"
	item_state = "p_suit"
	item_color = "psyche"

/obj/item/clothing/under/rank/clown/sexy
	name = "sexy-clown suit"
	desc = "It makes you look HONKable!"
	icon_state = "sexyclown"
	item_state = "sexyclown"
	item_color = "sexyclown"
	can_adjust = 0

/obj/item/clothing/under/rank/vice
	name = "vice officer's jumpsuit"
	desc = "It's the standard issue pretty-boy outfit, as seen on Holo-Vision."
	icon_state = "vice"
	item_state = "gy_suit"
	item_color = "vice"
	can_adjust = 0

/obj/item/clothing/under/rank/centcom_officer
	desc = "It's a jumpsuit worn by Centcom Officers."
	name = "\improper Centcom officer's jumpsuit"
	icon_state = "officer"
	item_state = "g_suit"
	item_color = "officer"
	alt_covers_chest = 1

/obj/item/clothing/under/rank/centcom_commander
	desc = "It's a jumpsuit worn by Centcom's highest-tier Commanders."
	name = "\improper Centcom officer's jumpsuit"
	icon_state = "centcom"
	item_state = "dg_suit"
	item_color = "centcom"

/obj/item/clothing/under/space
	name = "\improper NASA jumpsuit"
	desc = "It has a NASA logo on it and is made of space-proofed materials."
	icon_state = "black"
	item_state = "bl_suit"
	item_color = "black"
	w_class = 4//bulky item
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST | GROIN | LEGS | ARMS //Needs gloves and shoes with cold protection to be fully protected.
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	can_adjust = 0
	burn_state = FIRE_PROOF

/obj/item/clothing/under/acj
	name = "administrative cybernetic jumpsuit"
	icon_state = "syndicate"
	item_state = "bl_suit"
	item_color = "syndicate"
	desc = "A cybernetically enhanced jumpsuit used for administrative duties."
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(melee = 100, bullet = 100, laser = 100,energy = 100, bomb = 100, bio = 100, rad = 100)
	cold_protection = CHEST | GROIN | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	max_heat_protection_temperature = SPACE_SUIT_MAX_TEMP_PROTECT
	can_adjust = 0
	burn_state = FIRE_PROOF

/obj/item/clothing/under/owl
	name = "owl uniform"
	desc = "A soft brown jumpsuit made of synthetic feathers and strong conviction."
	icon_state = "owl"
	item_color = "owl"
	can_adjust = 0

/obj/item/clothing/under/griffin
	name = "griffon uniform"
	desc = "A soft brown jumpsuit with a white feather collar made of synthetic feathers and a lust for mayhem."
	icon_state = "griffin"
	item_color = "griffin"
	can_adjust = 0

/obj/item/clothing/under/cloud
	name = "cloud"
	desc = "cloud"
	icon_state = "cloud"
	item_color = "cloud"
	can_adjust = 0

/obj/item/clothing/under/gimmick/rank/captain/suit
	name = "captain's suit"
	desc = "A green suit and yellow necktie. Exemplifies authority."
	icon_state = "green_suit"
	item_state = "dg_suit"
	item_color = "green_suit"
	can_adjust = 0

/obj/item/clothing/under/gimmick/rank/head_of_personnel/suit
	name = "head of personnel's suit"
	desc = "A teal suit and yellow necktie. An authoritative yet tacky ensemble."
	icon_state = "teal_suit"
	item_state = "g_suit"
	item_color = "teal_suit"
	can_adjust = 0

/obj/item/clothing/under/suit_jacket
	name = "black suit"
	desc = "A black suit and red tie. Very formal."
	icon_state = "black_suit"
	item_state = "bl_suit"
	item_color = "black_suit"
	can_adjust = 0

/obj/item/clothing/under/suit_jacket/really_black
	name = "executive suit"
	desc = "A formal black suit and red tie, intended for the station's finest."
	icon_state = "really_black_suit"
	item_state = "bl_suit"
	item_color = "black_suit"

/obj/item/clothing/under/suit_jacket/female
	name = "executive suit"
	desc = "A formal trouser suit for women, intended for the station's finest."
	icon_state = "black_suit_fem"
	item_state = "black_suit_fem"
	item_color = "black_suit_fem"

/obj/item/clothing/under/suit_jacket/red
	name = "red suit"
	desc = "A red suit and blue tie. Somewhat formal."
	icon_state = "red_suit"
	item_state = "r_suit"
	item_color = "red_suit"

/obj/item/clothing/under/suit_jacket/charcoal
	name = "charcoal suit"
	desc = "A charcoal suit and red tie. Very professional."
	icon_state = "charcoal_suit"
	item_state = "charcoal_suit"
	item_color = "charcoal_suit"

/obj/item/clothing/under/suit_jacket/navy
	name = "navy suit"
	desc = "A navy suit and red tie, intended for the station's finest."
	icon_state = "navy_suit"
	item_state = "navy_suit"
	item_color = "navy_suit"

/obj/item/clothing/under/suit_jacket/burgundy
	name = "burgundy suit"
	desc = "A burgundy suit and black tie. Somewhat formal."
	icon_state = "burgundy_suit"
	item_state = "burgundy_suit"
	item_color = "burgundy_suit"

/obj/item/clothing/under/suit_jacket/checkered
	name = "checkered suit"
	desc = "That's a very nice suit you have there. Shame if something were to happen to it, eh?"
	icon_state = "checkered_suit"
	item_state = "checkered_suit"
	item_color = "checkered_suit"

/obj/item/clothing/under/suit_jacket/tan
	name = "tan suit"
	desc = "A tan suit with a yellow tie. Smart, but casual."
	icon_state = "tan_suit"
	item_state = "tan_suit"
	item_color = "tan_suit"

/obj/item/clothing/under/suit_jacket/white
	name = "white suit"
	desc = "A white suit and jacket with a blue shirt. You wanna play rough? OKAY!."
	icon_state = "white_suit"
	item_state = "white_suit"
	item_color = "white_suit"

/obj/item/clothing/under/overalls
	name = "laborer's overalls"
	desc = "A set of durable overalls for getting the job done."
	icon_state = "overalls"
	item_state = "lb_suit"
	item_color = "overalls"
	can_adjust = 0

/obj/item/clothing/under/pirate
	name = "pirate outfit"
	desc = "Yarr."
	icon_state = "pirate"
	item_state = "pirate"
	item_color = "pirate"
	can_adjust = 0

/obj/item/clothing/under/soviet
	name = "soviet uniform"
	desc = "For the Motherland!"
	icon_state = "soviet"
	item_state = "soviet"
	item_color = "soviet"
	can_adjust = 0

/obj/item/clothing/under/redcoat
	name = "redcoat uniform"
	desc = "Looks old."
	icon_state = "redcoat"
	item_state = "redcoat"
	item_color = "redcoat"
	can_adjust = 0

/obj/item/clothing/under/kilt
	name = "kilt"
	desc = "Includes shoes and plaid."
	icon_state = "kilt"
	item_state = "kilt"
	item_color = "kilt"
	body_parts_covered = CHEST|GROIN|FEET
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/gladiator
	name = "gladiator uniform"
	desc = "Are you not entertained? Is that not why you are here?"
	icon_state = "gladiator"
	item_state = "gladiator"
	item_color = "gladiator"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = NO_FEMALE_UNIFORM
	can_adjust = 0
	burn_state = FIRE_PROOF

/obj/item/clothing/under/captainparade
	name = "captain's parade uniform"
	desc = "A captain's luxury-wear, for special occasions."
	icon_state = "captain_parade"
	item_state = "by_suit"
	item_color = "captain_parade"
	can_adjust = 0

/obj/item/clothing/under/hosparademale
	name = "head of security's parade uniform"
	desc = "A male head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_male"
	item_state = "r_suit"
	item_color = "hos_parade_male"
	can_adjust = 0

/obj/item/clothing/under/assistantformal
	name = "assistant's formal uniform"
	desc = "An assistant's formal-wear. Why an assistant needs formal-wear is still unknown."
	icon_state = "assistant_formal"
	item_state = "gy_suit"
	item_color = "assistant_formal"
	can_adjust = 0

/obj/item/clothing/under/jester
	name = "jester suit"
	desc = "A jolly dress, well suited to entertain your master, nuncle."
	icon_state = "jester"
	item_color = "jester"
	can_adjust = 0

//Fluff

/obj/item/clothing/under/fluff/jensen
	name = "cyberpunk suit"
	desc = "You never asked for anything that stylish."
	icon_state = "jensen"
	item_state = "jensensuit"
	item_color = "jensen"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 10, bomb = 10, bio = 10, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/agent47
	name = "mysterious suit"
	desc = "This dark suit was made by a blind man named Tommy, who ran a tailor shop in the ruins of Old Chicago. It seems to be reinforced with an unknown material."
	icon_state = "agent47"
	item_state = "agent47"
	item_color = "agent47"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 10,energy = 10, bomb = 50, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/psychologist
	name = "psychologist's turtleneck"
	desc = "A turqouise turtleneck and a pair of dark blue slacks, belonging to a psychologist."
	icon_state = "psychturtle"
	item_state = "b_suit"
	item_color = "psychturtle"
	armor = list(melee = 20, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/villain
	name = "green and black suit"
	desc = "There is something evil in this suit, only a villain would wear something like that."
	icon_state = "villain"
	item_state = "syndicate-green"
	item_color = "villain"
	armor = list(melee = -10, bullet = -10, laser = -10,energy = -10, bomb = -10, bio = -10, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/gentlesuit
	name = "gentlemans suit"
	desc = "A silk black shirt with a white tie and a matching gray vest and slacks. Feels proper."
	icon_state = "gentlesuit"
	item_state = "gy_suit"
	item_color = "gentlesuit"
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 5, bomb = 5, bio = 5, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/dispatch
	name = "dispatcher's uniform"
	desc = "A dress shirt and khakis with a security patch sewn on."
	icon_state = "dispatch"
	item_state = "lb_suit"
	item_color = "dispatch"
	armor = list(melee = 10, bullet = 10, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	body_parts_covered = CHEST|GROIN|LEGS
	can_adjust = 0

/obj/item/clothing/under/fluff/detectivealt
	name = "fancy detective suit"
	desc = "An immaculate white dress shirt, paired with a pair of fancy black dress pants, a red tie, and a charcoal vest."
	icon_state = "detectivealt"
	item_state = "bl_suit"
	item_color = "detectivealt"
	armor = list(melee = 20, bullet = 20, laser = -10,energy = -10, bomb = 20, bio = 0, rad = 0)
	body_parts_covered = CHEST|GROIN|LEGS
	can_adjust = 1

/obj/item/clothing/under/fluff/rdalt
	name = "head researcher uniform"
	desc = "A suit and slacks stained with hard work and dedication to science. Perhaps other things as well, but mostly hard work and dedication."
	icon_state = "rdalt"
	item_state = "lb_suit"
	item_color = "rdalt"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 20, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/hopalt
	name = "head of personnel's suit"
	desc = "A blue jacket and red tie, with matching red cuffs! Snazzy. Wearing this makes you feel more important than your job title does."
	icon_state = "hopalt"
	item_state = "b_suit"
	item_color = "hopalt"
	armor = list(melee = -10, bullet = 0, laser = 20,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/roboticistalt
	name = "roboticist's jumpsuit"
	desc = "It's a slimming black with bright reinforced orange seams; great for industrial work."
	icon_state = "roboticsalt"
	item_state = "jensensuit"
	item_color = "roboticsalt"
	armor = list(melee = 0, bullet = 0, laser = 10,energy = 10, bomb = 0, bio = 0, rad = 0)
	can_adjust = 1

/obj/item/clothing/under/fluff/bartenderalt
	name = "fancy bartender's uniform"
	desc = "It's a rather fancy uniform for a real professional."
	icon_state = "barmanalt"
	item_state = "bl_suit"
	item_color = "barmanalt"
	armor = list(melee = 0, bullet = 10, laser = 0,energy = 0, bomb = 0, bio = 10, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/fluff/manager
	name = "manager suit"
	desc = "A good choice for an average corporate manager."
	icon_state = "manager"
	item_state = "bar_suit"
	item_color = "manager"
	armor = list(melee = 5, bullet = -20, laser = 0,energy = 0, bomb = 0, bio = 5, rad = 0)
	can_adjust = 1

/obj/item/clothing/under/fluff/spaceship
	name = "crewman uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of crewman."
	icon_state = "spaceship_crewman"
	item_state = "syndicate-black-red"
	item_color = "spaceship_crewman"
	armor = list(melee = 0, bullet = 0, laser = 5,energy = 5, bomb = 0, bio = 5, rad = 10)
	can_adjust = 0

/obj/item/clothing/under/fluff/spaceship/officer
	name = "officer uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of officer."
	icon_state = "spaceship_officer"
	item_color = "spaceship_officer"
	armor = list(melee = 5, bullet = 5, laser = 5,energy = 5, bomb = 5, bio = 5, rad = 10)

/obj/item/clothing/under/fluff/spaceship/captain
	name = "captain uniform"
	desc = "The insignia on this uniform tells you that this uniform belongs to some sort of captain."
	icon_state = "spaceship_captain"
	item_color = "spaceship_captain"
	armor = list(melee = 10, bullet = 10, laser = 10,energy = 10, bomb = 10, bio = 10, rad = 10)

//Female

/obj/item/clothing/under/female/wedding
	name = "wedding dress"
	desc = "If you see this, make a screenshot and report for shitspawn."
	icon_state = "bride_orange"
	item_state = "rad_suit"
	item_color = "bride_orange"
	can_adjust = 0
	fitted = FEMALE_UNIFORM_TOP
	body_parts_covered = CHEST|GROIN|LEGS
	flags_inv = HIDESHOES //IT DOESN'T HIDE SHOES! Someone. Pls. Help.

/obj/item/clothing/under/female/wedding/bride_orange
	name = "orange wedding dress"
	desc = "A big and puffy orange dress."
	icon_state = "bride_orange"
	item_state = "rad_suit"
	item_color = "bride_orange"

/obj/item/clothing/under/female/wedding/bride_purple
	name = "purple wedding dress"
	desc = "A big and puffy purple dress."
	icon_state = "bride_purple"
	item_state = "p_suit"
	item_color = "bride_purple"

/obj/item/clothing/under/female/wedding/bride_blue
	name = "blue wedding dress"
	desc = "A big and puffy blue dress."
	icon_state = "bride_blue"
	item_state = "b_suit"
	item_color = "bride_blue"

/obj/item/clothing/under/female/wedding/bride_red
	name = "red wedding dress"
	desc = "A big and puffy red dress."
	icon_state = "bride_red"
	item_state = "r_suit"
	item_color = "bride_red"

/obj/item/clothing/under/female/wedding/bride_white
	name = "silky wedding dress"
	desc = "A white wedding gown made from the finest silk."
	icon_state = "bride_white"
	item_state = "w_suit"
	item_color = "bride_white"
	body_parts_covered = CHEST|GROIN

/obj/item/clothing/under/female/queen
	name = "royal purple dress"
	desc = "A splender purple dress, made of silk. It's decorated with golden necklace."
	icon_state = "queen_dress"
	item_state = "p_suit"
	item_color = "queen_dress"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blackskirt
	name = "black skirt"
	desc = "A black skirt, very fancy!"
	icon_state = "blackskirt"
	item_color = "blackskirt"
	item_state = "bl_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blueskirt
	name = "blue skirt"
	desc = "A blue, casual skirt."
	icon_state = "blueskirt"
	item_color = "blueskirt"
	item_state = "b_suit"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blueskirt/redskirt
	name = "red skirt"
	desc = "A red, casual skirt."
	icon_state = "redskirt"
	item_color = "redskirt"
	item_state = "r_suit"

/obj/item/clothing/under/female/schoolgirl
	name = "blue schoolgirl uniform"
	desc = "It's just like one of my Japanese animes!"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	item_color = "schoolgirl"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/schoolgirl/red
	name = "red schoolgirl uniform"
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	item_color = "schoolgirlred"

/obj/item/clothing/under/female/schoolgirl/green
	name = "green schoolgirl uniform"
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	item_color = "schoolgirlgreen"

/obj/item/clothing/under/female/schoolgirl/orange
	name = "orange schoolgirl uniform"
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	item_color = "schoolgirlorange"

/obj/item/clothing/under/female/sexymime
	name = "sexy mime outfit"
	desc = "The only time when you DON'T enjoy looking at someone's rack."
	icon_state = "sexymime"
	item_state = "sexymime"
	item_color = "sexymime"
	body_parts_covered = CHEST|GROIN|LEGS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/sundress
	name = "sundress"
	desc = "Makes you want to frolic in a field of daisies."
	icon_state = "sundress"
	item_state = "sundress"
	item_color = "sundress"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/hosparadefem
	name = "head of security's parade uniform"
	desc = "A female head of security's luxury-wear, for special occasions."
	icon_state = "hos_parade_fem"
	item_state = "r_suit"
	item_color = "hos_parade_fem"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blacktango
	name = "black tango dress"
	desc = "Filled with Latin fire."
	icon_state = "black_tango"
	item_state = "wcoat"
	item_color = "black_tango"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/stripeddress
	name = "striped dress"
	desc = "Fashion in space."
	icon_state = "striped_dress"
	item_state = "stripeddress"
	item_color = "striped_dress"
	fitted = FEMALE_UNIFORM_FULL
	can_adjust = 0

/obj/item/clothing/under/female/sailordress
	name = "sailor dress"
	desc = "Formal wear for a leading lady."
	icon_state = "sailor_dress"
	item_state = "sailordress"
	item_color = "sailor_dress"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/redeveninggown
	name = "red evening gown"
	desc = "Fancy dress for space bar singers."
	icon_state = "red_evening_gown"
	item_state = "redeveninggown"
	item_color = "red_evening_gown"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/maid
	name = "maid costume"
	desc = "Maid in China."
	icon_state = "maid"
	item_state = "maid"
	item_color = "maid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/janimaid
	name = "maid uniform"
	desc = "A simple maid uniform for housekeeping."
	icon_state = "janimaid"
	item_state = "janimaid"
	item_color = "janimaid"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/plaid_skirt
	name = "red plaid skirt"
	desc = "A preppy red skirt with a white blouse."
	icon_state = "plaid_red"
	item_state = "plaid_red"
	item_color = "plaid_red"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/plaid_skirt/blue
	name = "blue plaid skirt"
	desc = "A preppy blue skirt with a white blouse."
	icon_state = "plaid_blue"
	item_state = "plaid_blue"
	item_color = "plaid_blue"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/plaid_skirt/purple
	name = "purple plaid skirt"
	desc = "A preppy purple skirt with a white blouse."
	icon_state = "plaid_purple"
	item_state = "plaid_purple"
	item_color = "plaid_purple"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/dress_black
	name = "black skirt"
	desc = "Official black skirt. Can look quite sexy though."
	icon_state = "dress_black"
	item_state = "bl_suit"
	item_color = "dress_black"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 1
	alt_covers_chest = 1

/obj/item/clothing/under/female/dress_orange
	name = "orange dress"
	desc = "A fancy orange gown for those who like to show leg."
	icon_state = "dress_orange"
	item_state = "rad_suit"
	item_color = "dress_orange"
	body_parts_covered = CHEST
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_yellow
	name = "yellow dress"
	desc = "Rather bright and somewhat ugly yellow dress."
	icon_state = "dress_yellow"
	item_state = "y_suit"
	item_color = "dress_yellow"
	body_parts_covered = CHEST
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_hr
	name = "human resources director uniform"
	desc = "Superior class for the nosy H.R. Director."
	icon_state = "huresource"
	item_state = "rad_suit"
	item_color = "huresource"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/blackjumpskirt
	name = "black jumpskirt"
	desc = "A black jumpskirt, Sol size 0."
	icon_state = "blackjumpskirt"
	item_state = "bl_suit"
	item_color = "blackjumpskirt"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/dress_saloon
	name = "saloon girl dress"
	desc = "A old western inspired gown for the girl who likes to drink."
	icon_state = "dress_saloon"
	item_state = "r_suit"
	item_color = "dress_saloon"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/female/cheongsam
	name = "white cheongsam"
	desc = "It is a white cheongsam dress."
	icon_state = "cheongsam"
	item_state = "cheongsam"
	item_color = "cheongsam"
	body_parts_covered = CHEST|GROIN|LEGS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

//Fallout 13

/obj/item/clothing/under/f13/navy
	name = "navy jumpsuit"
	desc = "Pre-War navy military standart uniform."
	icon_state = "navy"
	item_state = "bl_suit"
	item_color = "navy"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 5, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/navyofficer
	name = "navy officer jumpsuit"
	desc = "Pre-War navy military standart uniform for ranked officers."
	icon_state = "navyofficer"
	item_state = "bl_suit"
	item_color = "navyofficer"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 15, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/machinist
	name = "workman outfit"
	desc = "Apparel of an old-time machinist."
	icon_state = "machinist"
	item_state = "lb_suit"
	item_color = "machinist"
	can_adjust = 0

/obj/item/clothing/under/f13/lumberjack
	name = "lumberjack outfit"
	desc = "Apparel of an old-time lumberjack."
	icon_state = "lumberjack"
	item_state = "r_suit"
	item_color = "lumberjack"
	can_adjust = 0

/obj/item/clothing/under/f13/police
	name = "pre-War police uniform"
	desc = "Golden classics of pre-War police officers."
	icon_state = "retro_police"
	item_state = "b_suit"
	item_color = "retro_police"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 5, bullet = 5, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/cowboyb //Originally cowboy and mafia stuff by Nienhaus
	name = "dusty prospector outfit"
	desc = "It's a white shirt with brass buttons and a pair of brown trousers, commonly worn by prospectors."
	icon_state = "cowboyb"
	item_state = "det"
	item_color = "cowboyb"
	can_adjust = 0

/obj/item/clothing/under/f13/cowboyg
	name = "well-heeled prospector outfit"
	desc = "It's a white shirt with black buttons and a pair of gray trousers, commonly worn by prospectors."
	icon_state = "cowboyg"
	item_state = "sl_suit"
	item_color = "cowboyg"
	can_adjust = 0

/obj/item/clothing/under/f13/female/flapper
	name = "flapper dress"
	desc = "It's an outfit commonly worn by old-time prostitutes from around New Reno, but can be seen all over the wasteland."
	icon_state = "flapper"
	item_state = "gy_suit"
	item_color = "flapper"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/f13/bdu //WalterJe military standarts.
	name = "BDU"
	desc = "It's a standart military Battle Dress Uniform."
	icon_state = "bdu"
	item_state = "xenos_suit"
	item_color = "bdu"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 1

/obj/item/clothing/under/f13/dbdu
	name = "DBDU"
	desc = "It's a military Desert Battle Dress Uniform."
	icon_state = "dbdu"
	item_state = "xenos_suit"
	item_color = "dbdu"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 1

/obj/item/clothing/under/f13/shiny //Firefly, yay!
	name = "shiny outfit"
	desc = "Perfect outfit for a brave and reckless space cowboy. Shiny!"
	icon_state = "shiny"
	item_state = "owl"
	item_color = "shiny"
	can_adjust = 0

/obj/item/clothing/under/f13/batter //I guess we're going OFF limits.
	name = "worn baseball uniform"
	desc = "<b>Purification in progress...</b>"
	icon_state = "batter"
	item_state = "w_suit"
	item_color = "batter"
	can_adjust = 0

/obj/item/clothing/under/f13/bennys //Benny's suit from Fallout: New Vegas. But Benny was just a kid back in 2255, so it's just a fancy suit for you.
	name = "fancy suit"
	desc = "It's a black and white buffalo plaid suit. Fancy!"
	icon_state = "benny"
	item_state = "white_suit"
	item_color = "benny"
	can_adjust = 0

/obj/item/clothing/under/f13/relaxedwearm
	name = "pre-War male relaxedwear"
	desc = "It's a dirty long-sleeve blue shirt with a greenish brown sweater-vest and slacks."
	icon_state = "relaxedwearm"
	item_state = "g_suit"
	item_color = "relaxedwearm"
	can_adjust = 0

/obj/item/clothing/under/f13/springm
	name = "pre-War male spring outfit"
	desc = "It's a dirty long-sleeve beige shirt with a red sweater-vest and brown trousers."
	icon_state = "springm"
	item_state = "brownjsuit"
	item_color = "springm"
	can_adjust = 0

/obj/item/clothing/under/f13/doomsday
	name = "doomsday cult outfit"
	desc = "It's a grimy pre-war dress shirt, tie, and slacks, with some makeshift pauldrons made of scrap metal attached with leather straps."
	icon_state = "doomsday"
	item_state = "sl_suit"
	item_color = "doomsday"
	can_adjust = 0

/obj/item/clothing/under/f13/enclaveo
	name = "Enclave officer uniform"
	desc = "It's a standard Enclave officer uniform.<br>The outer layer is made of a sturdy material designed to withstand the harsh conditions of the wasteland."
	icon_state = "enclaveo"
	item_state = "bl_suit"
	item_color = "enclaveo"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 20, bullet = 10, laser = 5,energy = 5, bomb = 5, bio = 0, rad = 5)
	can_adjust = 0

/obj/item/clothing/under/f13/combat
	name = "combat uniform"
	desc = "An old combat uniform, out of use around the time of the war."
	icon_state = "combat_shirt"
	item_state = "bl_suit"
	item_color = "combat_shirt"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 15, bullet = 15, laser = 5,energy = 5, bomb = 5, bio = 0, rad = 5)
	can_adjust = 0

/obj/item/clothing/under/f13/settler
	name = "settler outfit"
	desc = "It's more or less a crudely made tan robe with a makeshift belt made from cloth.<br>Paired with worn grey pants."
	icon_state = "settler"
	item_state = "brownjsuit"
	item_color = "settler"
	can_adjust = 0

/obj/item/clothing/under/f13/brahmin //Male version
	name = "brahmin-skin outfit"
	desc = "A basic outfit consisting of a white shirt and patched trousers with Y-shaped suspenders."
	icon_state = "brahmin_m"
	item_state = "brownjsuit"
	item_color = "brahmin_m"
	can_adjust = 0

/obj/item/clothing/under/f13/female/brahmin //Female version
	name = "brahmin-skin outfit"
	desc = "A basic outfit consisting of a rolled-up long-sleeve shirt and patched trousers with Y-shaped suspenders.<br>Fitted for female wastelanders."
	icon_state = "brahmin_f"
	item_state = "brownjsuit"
	item_color = "brahmin_f"
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = 0

/obj/item/clothing/under/f13/doctor //Male version
	name = "doctor fatigues"
	desc = "It's a white t-shirt, a small brown satchel bag and brown trousers with pouches attached to the belt."
	icon_state = "doctor_m"
	item_state = "brownjsuit"
	item_color = "doctor_m"
	allowed = list(/obj/item/weapon/scalpel, /obj/item/weapon/surgical_drapes, /obj/item/weapon/cautery, /obj/item/weapon/hemostat, /obj/item/weapon/retractor)
	can_adjust = 0

/obj/item/clothing/under/f13/female/doctor //Female version
	name = "doctor fatigues"
	desc = "It's a white t-shirt with brown trousers, and a small brown satchel bag attached to it.<br>Fitted for female wastelanders."
	icon_state = "doctor_f"
	item_state = "brownjsuit"
	item_color = "doctor_f"
	fitted = FEMALE_UNIFORM_TOP
	allowed = list(/obj/item/weapon/scalpel, /obj/item/weapon/surgical_drapes, /obj/item/weapon/cautery, /obj/item/weapon/hemostat, /obj/item/weapon/retractor)
	can_adjust = 0

/obj/item/clothing/under/f13/mercadv //Male version
	name = "merc adventurer outfit"
	desc = "It's a large leather jacket with torn-off sleeves, paired with a red sweater, a necklace with three teeth of unknown origin strung on, and a pair of brown leather pants.<br>There is also a rough leather bandolier for additional storage capacity."
	icon_state = "merca_m"
	item_state = "bl_suit"
	item_color = "merca_m"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/female/mercadv //Female version
	name = "merc adventurer outfit"
	desc = "It's a large leather jacket with torn-off sleeves, paired with a midriff-revealing red and black top and a pair of brown leather pants.<br>There is also a rough leather bandolier and belt for additional storage capacity.<br>Fitted for female wastelanders."
	icon_state = "merca_f"
	item_state = "bl_suit"
	item_color = "merca_f"
	fitted = FEMALE_UNIFORM_TOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 10, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/merccharm //Male version
	name = "merc charmer outfit"
	desc = "A blue and gray outfit resembling a three piece suit, heavily stitched and reinforced with a small metal cup on the groin area."
	icon_state = "mercc_m"
	item_state = "bl_suit"
	item_color = "mercc_m"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/female/merccharm //Female version
	name = "merc charmer outfit"
	desc = "A ripped and torn blue female business suit, it still gives ladies a rather sexy look."
	icon_state = "mercc_f"
	item_state = "bl_suit"
	item_color = "mercc_f"
	fitted = FEMALE_UNIFORM_TOP
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	can_adjust = 0

/obj/item/clothing/under/f13/caravaneer
	name = "caravaneer outift"
	desc = "It's a striped brown shirt, with a pair of dark blue pants on suspenders.<br>That type of outfit is commonly worn by caravaneers and travelers."
	icon_state = "caravaneer"
	item_state = "syndicate-blue"
	item_color = "caravaneer"
	can_adjust = 0

/obj/item/clothing/under/f13/roving
	name = "roving trader outfit "
	desc = "It's an outfit commonly worn by various wastelanders, but it still looks pretty badass!"
	icon_state = "roving"
	item_state = "bl_suit"
	item_color = "roving"
	can_adjust = 0

/obj/item/clothing/under/f13/vault
	name = "vault jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This particular jumpsuit has no number on the back."
	icon_state = "vault"
	item_state = "b_suit"
	item_color = "vault"
	can_adjust = 1

/obj/item/clothing/under/f13/vault/v13 //The Legend is here.
	name = "Vault 13 jumpsuit"
	desc = "The regulation clothing worn by the vault dwellers of Vault-Tec vaults. It's made of sturdy leather.<br>This jumpsuit has number 13 on the back."
	icon_state = "vault13"
	item_color = "vault13"



//Fallout 13 goes rampage at this point. The following uniforms provide decent deffence bonus.

/obj/item/clothing/under/f13/recon
	name = "recon armor"
	desc = "Intended to serve as the under-armor of the T-45d power armor, the recon armor is a vacuum-sealed asbestos jumpsuit covering the entire body.<br>Attached to it is the interface and mounts for the power armor.<br>Its purpose is twofold - it allows the user to actually operate the armor and protect soft tissue from moving parts inside the suit and heat."
	icon_state = "recon"
	item_state = "rig_suit"
	item_color = "recon"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|HEAD
	flags = BLOCKHAIR //It doesn't block the hair! What I did wrong?
	armor = list(melee = 40, bullet = 30, laser = 10, energy = 10, bomb = 10, bio = 0, rad = 0)
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HEAD
	can_adjust = 0

//Plasmameme

/obj/item/clothing/under/plasmaman
	name = "Plasma-man Jumpsuit"
	desc = "A specially designed suit that allows Plasma based life forms to exist in an oxygenated environment."
	icon_state = "plasmaman"
	item_state = "plasmaman"
	item_color = "plasmaman"
	armor = list(melee = 0, bullet = 0, laser = 0, energy = 0, bomb = 0, bio = 100, rad = 0)
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	can_adjust = 0
	strip_delay = 80
	var/next_extinguish = 0
	var/extinguish_cooldown = 100
	var/extinguishes_left = 5


/obj/item/clothing/under/plasmaman/examine(mob/user)
	..()
	user << "<span class='notice'>There are [extinguishes_left] extinguisher canisters left in this suit.</span>"


/obj/item/clothing/under/plasmaman/proc/Extinguish(mob/living/carbon/human/H)
	if(!istype(H))
		return

	if(H.fire_stacks)
		if(extinguishes_left)
			if(next_extinguish > world.time)
				return
			next_extinguish = world.time + extinguish_cooldown
			extinguishes_left--
			H.visible_message("<span class='warning'>[H]'s suit automatically extinguishes them!</span>","<span class='warning'>Your suit automatically extinguishes you.</span>")
			H.ExtinguishMob()
			PoolOrNew(/obj/effect/particle_effect/water, get_turf(H))
	return 0

/obj/item/clothing/under/plasmaman/attackby(obj/item/E, mob/user, params)
	if (istype(E, /obj/item/device/extinguisher_refill))
		if (extinguishes_left == 5)
			user << "<span class='notice'>The inbuilt extinguisher is full.</span>"
			return
		else
			extinguishes_left = 5
			user << "<span class='notice'>You refill the suits inbuilt extinguisher, using up the refill pack.</span>"
			qdel(E)
			return
		return
	return

/obj/item/device/extinguisher_refill
	name = "Plasma-man jumpsuit refill pack"
	desc = "A compressed water pack used to refill plasma-man jumpsuit auto-extinguishers."
	icon_state = "plasmarefill"

