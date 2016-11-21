
var/datum/subsystem/mobspawner/SSMOBSPAWNER
/datum/subsystem/mobspawner
	name = "Mob Spawner"
	wait = 30
	obj/effect/statclick/statclick
	var/list/spawners = list()

///datum/subsystem/mobspawner/stat_entry()
//	..("L:[spawners.len )]")
/datum/subsystem/mobspawner/New()
	NEW_SS_GLOBAL(SSMOBSPAWNER)
	..()
/datum/subsystem/mobspawner/fire()
	for(var/obj/structure/mob_spawner/spawner in spawners)
		if(spawner.check())
			spawner.Spawn()

/datum/subsystem/mobspawner/proc/ass_spawner(var/obj/structure/mob_spawner/spawner)
	if(!spawners.Find(spawner))
		spawners.Add(spawner)
	return 0
/datum/subsystem/mobspawner/proc/rem_spawner(var/obj/structure/mob_spawner/spawner)
	if(spawners.Find(spawner))
		spawners.Remove(spawner)
	return 0