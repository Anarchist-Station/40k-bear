//to simplify tihs, we're going to

/obj/structure/railing/fence
	name = "railing"
	desc = "A standard steel railing. Prevents human stupidity."
	icon = 'z_modular_bear/icons/obj/fence.dmi'
	density = 1
	throwpass = 1
	//layer = 3.2//Just above doors 	//Layers mean nothing.
	plane = ABOVE_HUMAN_PLANE // They go ontop of humans.
	//pressure_resistance = 4*ONE_ATMOSPHERE
	anchored = 1
	atom_flags = ATOM_FLAG_CLIMBABLE|ATOM_FLAG_CHECKS_BORDER
	icon_state = "railing0"

/obj/structure/railing/fence/New(loc, constructed=0)
	..()
	if (constructed)	//player-constructed railings
		anchored = 0
	if(src.anchored)
		spawn(5)
			update_icon(0)

/obj/structure/railing/fence/Destroy()
	anchored = null
	atom_flags = null
	broken = 1
	for(var/obj/structure/railing/fence/R in oview(src, 1))
		R.update_icon()
	..()

/obj/structure/railing/fence/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(!mover)
		return TRUE

	if(istype(mover) && mover.checkpass(PASS_FLAG_TABLE))
		return TRUE

	if (locate(/obj/structure/table) in get_turf(mover))
		return TRUE

	if(get_dir(loc, target) == dir)
		return !density
	else
		return TRUE



/obj/structure/railing/fence/examine(mob/user)
	. = ..()
	if(health < maxhealth)
		switch(health / maxhealth)
			if(0.0 to 0.5)
				to_chat(user, "<span class='warning'>It looks severely damaged!</span>")
			if(0.25 to 0.5)
				to_chat(user,"<span class='warning'>It looks damaged!</span>")
			if(0.5 to 1.0)
				to_chat(user, "<span class='notice'>It has a few scrapes and dents.</span>")


/obj/structure/railing/fence/update_icon(var/UpdateNeighgors = 1)
	NeighborsCheck(UpdateNeighgors)
	overlays.Cut()
	if (!check || !anchored)
		icon_state = "railing0"
	else
		icon_state = "railing1"
		if (check & 32)
			overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "corneroverlay")
		if ((check & 16) || !(check & 32) || (check & 64))
			overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "frontoverlay_l")
		if (!(check & 2) || (check & 1) || (check & 4))
			overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "frontoverlay_r")
			if(check & 4)
				switch (src.dir)
					if (NORTH)
						overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "mcorneroverlay", pixel_x = 32)
					if (SOUTH)
						overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "mcorneroverlay", pixel_x = -32)
					if (EAST)
						overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "mcorneroverlay", pixel_y = -32)
					if (WEST)
						overlays += image ('z_modular_bear/icons/obj/fence.dmi', src, "mcorneroverlay", pixel_y = 32)



/obj/structure/railing/fence/RightClick(mob/user)
	if(CanPhysicallyInteract(user))
		rotate()

/obj/structure/railing/fence/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASS_FLAG_TABLE))
		return 1
	if(get_dir(O.loc, target) == dir)
		return 0
	return 1

/obj/structure/railing/fence/attackby(obj/item/W as obj, mob/user as mob)
	// Dismantle
	if(istype(W, /obj/item/wrench) && !anchored)
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		if(do_after(user, 20, src))
			user.visible_message("<span class='notice'>\The [user] dismantles \the [src].</span>", "<span class='notice'>You dismantle \the [src].</span>")
			new /obj/item/stack/material/steel(get_turf(usr))
			new /obj/item/stack/material/steel(get_turf(usr))
			qdel(src)
			return

	// Repair
	if(health < maxhealth && istype(W, /obj/item/weldingtool))
		var/obj/item/weldingtool/F = W
		if(F.welding)
			playsound(src.loc, 'sound/items/Welder.ogg', 50, 1)
			if(do_after(user, 20, src))
				user.visible_message("<span class='notice'>\The [user] repairs some damage to \the [src].</span>", "<span class='notice'>You repair some damage to \the [src].</span>")
				health = min(health+(maxhealth/5), maxhealth)//max(health+(maxhealth/5), maxhealth) // 20% repair per application
				return

	// Install
	if(istype(W, /obj/item/screwdriver))
		user.visible_message(anchored ? "<span class='notice'>\The [user] begins unscrew \the [src].</span>" : "<span class='notice'>\The [user] begins fasten \the [src].</span>" )
		playsound(loc, 'sound/items/Screwdriver.ogg', 75, 1)
		if(do_after(user, 10, src))
			user << (anchored ? "<span class='notice'>You have unfastened \the [src] from the floor.</span>" : "<span class='notice'>You have fastened \the [src] to the floor.</span>")
			anchored = !anchored
			update_icon()
			return

	// Handle harm intent grabbing/tabling.
	if(istype(W, /obj/item/grab) && get_dist(src,user)<2)
		var/obj/item/grab/G = W
		if (istype(G.affecting, /mob/living))
			var/mob/living/M = G.affecting
			var/obj/occupied = turf_is_crowded()
			if(occupied)
				user << "<span class='danger'>There's \a [occupied] in the way.</span>"
				return
			if (G.current_grab < 2)
				if(user.a_intent == I_HURT)
					if (prob(15))	M.Weaken(5)
					M.apply_damage(8,def_zone = "head")
					take_damage(8)
					visible_message("<span class='danger'>[G.assailant] slams [G.affecting]'s face against \the [src]!</span>")
					playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
				else
					user << "<span class='danger'>You need a better grip to do that!</span>"
					return
			else
				if (get_turf(G.affecting) == get_turf(src))
					G.affecting.forceMove(get_step(src, src.dir))
				else
					G.affecting.forceMove(get_turf(src))
				G.affecting.Weaken(5)
				visible_message("<span class='danger'>[G.assailant] throws [G.affecting] over \the [src]!</span>")
			qdel(W)
			return

	else
		playsound(loc, 'sound/effects/grillehit.ogg', 50, 1)
		take_damage(W.force)
		user.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)

	return ..()

/obj/structure/railing/fence/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/railing/fence/do_climb(var/mob/living/user)
	if(!can_climb(user))
		return

	usr.visible_message("<span class='warning'>[user] starts climbing onto \the [src]!</span>")
	climbers |= user

	if(!do_after(user,(issmall(user) ? 20 : 34)))
		climbers -= user
		return

	if(!can_climb(user, post_climb_check=1))
		climbers -= user
		return

	if(!neighbor_turf_passable())
		user << "<span class='danger'>You can't climb there, the way is blocked.</span>"
		climbers -= user
		return

	if(get_turf(user) == get_turf(src))
		usr.forceMove(get_step(src, src.dir))
	else
		usr.forceMove(get_turf(src))

	usr.visible_message("<span class='warning'>[user] climbed over \the [src]!</span>")
	if(!anchored)	take_damage(maxhealth) // Fatboy
	climbers -= user


/obj/structure/railing/fence/can_climb(var/mob/living/user, post_climb_check=0)
	if (!(atom_flags & ATOM_FLAG_CLIMBABLE) || !can_touch(user) || (!post_climb_check && (user in climbers)))
		return 0

	if (!user.Adjacent(src))
		to_chat(user, "<span class='danger'>You can't climb there, the way is blocked.</span>")
		return 0

	return 1