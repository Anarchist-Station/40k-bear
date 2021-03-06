// copied from code/game/gamemodes/warfare/trenches.dmi
/*
/turf/simulated/floor/trenches
	name = "trench"
	icon = 'icons/turf/trenches_turfs.dmi'
	icon_state = "wood0"
	can_smooth = TRUE
	movement_delay = 0.5

/obj/structure/trench_wall
	name = "trench wall"
	icon = 'icons/turf/trenches_turfs.dmi'
	icon_state = "trench"
	density = FALSE



/turf/simulated/floor/trenches/relativewall()
	var/junction = 0
	for(var/turf/simulated/floor/trenches/W in orange(src,1))
		if(abs(src.x-W.x)-abs(src.y-W.y))
			junction |= get_dir(src,W)
	icon_state = "wood[junction]"

/turf/simulated/floor/trenches/ex_act()//No blowing this up.
	return


/turf/simulated/floor/trenches/Initialize()
	. = ..()
	relativewall_neighbours()
/*	spawn(5)
		update_icon()

/turf/simulated/floor/trenches/update_icon()
	overlays.Cut()
	var/image/snow_overlay = image('icons/obj/warfare.dmi', "snow_1", dir = pick(GLOB.alldirs))
	snow_overlay.plane = ABOVE_TURF_PLANE
	overlays += snow_overlay
	//snow_overlay.turf_decal_layerise()
*/
*/

/turf/simulated/floor/trench/bear
	icon = 'icons/obj/warfare.dmi'
	icon_state = "trench"
	name = "trench"
	movement_delay = 0.5



/turf/simulated/floor/trench/bear/New()
	..()
	if(!locate(/obj/effect/lighting_dummy/daylight) in src) // --MODULAR BEARHAMMER EDIT: moved from code/game/gamemodes/warfare/trenches.dm
		new /obj/effect/lighting_dummy/daylight(src) // --MODULAR BEARHAMMER EDIT: moved from code/game/gamemodes/warfare/trenches.dm
	dir = pick(GLOB.alldirs)
	update_icon()

/turf/simulated/floor/trench/bear/RightClick(mob/living/user)
	if(!CanPhysicallyInteract(user))
		return
	var/obj/item/shovel/S = user.get_active_hand()
	if(!istype(S))
		return
	if(!can_be_dug)//No escaping to mid early.
		return
	if(!user.doing_something)
		user.doing_something = TRUE
		if(src.density)
			user.doing_something = FALSE
			return
		for(var/obj/structure/object in contents)
			if(object)
				to_chat(user, "There are things in the way.")
				user.doing_something = FALSE
				return
		playsound(src, 'sound/effects/dig_shovel.ogg', 50, 0)
		visible_message("[user] begins fill in the trench!")
		if(do_after(user, backwards_skill_scale(user.SKILL_LEVEL(engineering)) * 5))
			for(var/mob/M in src)
				if(ishuman(M))
					M.pixel_y = 0
			ChangeTurf(/turf/simulated/floor/dirty)
			update_trench_shit()
			visible_message("[user] finishes filling in trench.")
			playsound(src, 'sound/effects/empty_shovel.ogg', 50, 0)
			user.doing_something = FALSE

		user.doing_something = FALSE

	else
		to_chat(user, "You're already digging.")



/turf/simulated/floor/trench/bear/update_icon()
	update_trench_shit()

	update_trench_layers()

/turf/simulated/floor/trench/bear/Crossed(var/mob/living/carbon/human/M)
	if(istype(M))
		if(!M.throwing)
			if(M.client)
				M.fov_mask.screen_loc = "1,0.8"
				M.fov.screen_loc = "1,0.8"
			if(M.crouching)
				M.pixel_y = -12
			else
				M.pixel_y = -8

			M.plane = LYING_HUMAN_PLANE

			var/trench_check = 0 //If we're not up against a trench wall, we don't want to stay zoomed in.
			for(var/direction in GLOB.cardinal)
				var/turf/turf_to_check = get_step(M.loc,direction)//So get all of the turfs around us.
				if(istype(turf_to_check, /turf/simulated/floor/trench/bear))//And if they're a trench, count it.
					trench_check++
			if(trench_check >= 4)//We're surrounded on all sides by trench. We unzoom.
				if(M.zoomed)//If we're zoomed that is.
					M.do_zoom()



/turf/simulated/floor/trench/bear/Uncrossed(var/mob/living/carbon/human/M)
	if(istype(M))
		if(M.client)
			M.fov_mask.screen_loc = "1,1"
			M.fov.screen_loc = "1,1"
		M.pixel_y = 0
		M.plane = HUMAN_PLANE
