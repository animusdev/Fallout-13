/mob/living/carbon/monkey/special //except for a few special persistence features, this is just a normal monkey
	name = "Caesar" //C A N O N of year 2255 - R.I.P. Pun Pun
	unique_name = 0
	var/ancestor_name
	var/ancestor_chain = 1
	var/relic_hat	//Note: these two are paths
	var/relic_mask
	var/memory_saved = 0
	var/list/pet_monkey_names = list("Caesar", "Toecutter", "Humungus", "Dealgood", "Immortan") //Hell yeah!

/mob/living/carbon/monkey/special/New() //Head and mouth gear saves.
	Read_Memory()
	if(relic_hat)
		equip_to_slot_or_del(new relic_hat, slot_head)
	if(relic_mask)
		equip_to_slot_or_del(new relic_mask, slot_wear_mask)
	if(ancestor_name)
		name = ancestor_name
		if(ancestor_chain > 1)
			name += " [num2roman(ancestor_chain)]"
	else
		name = pick(pet_monkey_names)
		gender = pick(MALE, FEMALE)
	..()

/mob/living/carbon/monkey/special/Life()
	if(ticker.current_state == GAME_STATE_FINISHED && !memory_saved)
		Write_Memory(0)
	..()

/mob/living/carbon/monkey/special/death(gibbed)
	if(!memory_saved || gibbed)
		Write_Memory(1,gibbed)
	..()

/mob/living/carbon/monkey/special/proc/Read_Memory()
	var/savefile/S = new /savefile("data/npc_saves/special.sav")
	S["ancestor_name"] 		>> ancestor_name
	S["ancestor_chain"]		>> ancestor_chain
	S["relic_hat"]			>> relic_hat
	S["relic_mask"]			>> relic_mask

/mob/living/carbon/monkey/special/proc/Write_Memory(dead, gibbed)
	var/savefile/S = new /savefile("data/npc_saves/special.sav")
	if(gibbed)
		S["ancestor_name"] 		<< null
		S["ancestor_chain"]		<< 1
		S["relic_hat"]			<< null
		S["relic_mask"]			<< null
		return
	if(dead)
		S["ancestor_name"] 		<< ancestor_name
		S["ancestor_chain"]		<< ancestor_chain + 1
	if(!ancestor_name)	//new monkey name this round
		S["ancestor_name"] 		<< name
	if(head)
		S["relic_hat"]			<< head.type
	else
		S["relic_hat"]			<< null
	if(wear_mask)
		S["relic_mask"]			<< wear_mask.type
	else
		S["relic_mask"]			<< null
	if(!dead)
		memory_saved = 1