/atom/movable
	var/contents_weight
	var/self_weight

/atom/movable/New()
	..()
	if(!self_weight && isitem(src))
		var/obj/item/I = src
		switch(I.w_class)
			if(0)
				self_weight = 0
			if(1)
				self_weight = 0.500
			if(2)
				self_weight = 1.500
			if(3)
				self_weight = 3.000
			if(4)
				self_weight = 8.000
			if(5)
				self_weight = 14.000
			if(6)
				self_weight = 25.000
/atom/movable/proc/update_weight(var/weight)
	if(istype(loc, /atom/movable))
		var/atom/movable/L = loc
		L.update_weight(weight)
	contents_weight += weight

/atom/movable/Entered(atom/movable/A, atom/oldloc)
	. = ..()
	update_weight(A.self_weight + A.contents_weight)

/atom/movable/Exited(atom/movable/A, atom/newloc)
	. = ..()
	update_weight( -(A.self_weight + A.contents_weight))