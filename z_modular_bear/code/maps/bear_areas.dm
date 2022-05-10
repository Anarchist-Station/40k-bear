// turfs

/turf/simulated/wall/wood
	icon_state = "wood0"
	walltype = "wood"
	integrity = 300












// areas

/area/cadiaoutpost/oa/village/mansion
	name = "Mansion"
	icon_state = "village"
	music = 'sound/music/gnossienne01.ogg'
	requires_power = FALSE
	dynamic_lighting = 1

/area/cadiaoutpost/oa/service/inn/mansioninterior
	name = "Mansion Interior"
	icon_state = "inn"
	music = 'sound/music/gymnopedie03.ogg'
	dynamic_lighting = 1
	requires_power = 0

/obj/screen/fullscreen/fallout
	alpha = 100

/area/cadiaoutpost/oa/wasteland
	name = "Wasteland"
	icon_state = "forest"
	requires_power = FALSE
	dynamic_lighting = 1
	music = 'sound/newmusic/Caves_Terror.ogg'

/area/cadiaoutpost/oa/wasteland/Entered(mob/living/L,  atom/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/wasteland))//Doesn't work but this does stop the lag.
		L.overlay_fullscreen("fallout", /obj/screen/fullscreen/fallout)

/area/cadiaoutpost/oa/wasteland/Exited(mob/living/L, area/A)
	. = ..()
	if(istype(L) && !istype(A, /area/cadiaoutpost/oa/wasteland))
		L.clear_fullscreen("fallout")
