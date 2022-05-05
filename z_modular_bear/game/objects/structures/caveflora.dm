//_____________________________________Flora_____________________________________

/obj/structure/flora/caveshroom
	name = "Large Shroom"
	anchored = 1
	density = 0
	alpha = 200
	density = FALSE
	layer = 1
	plane = ABOVE_HUMAN_PLANE
	layer = ABOVE_HUMAN_LAYER
	var/log_type //type of log
	var/log_amount //amount of logs when cut down
	var/cutdown = FALSE //is it already cut down?
	var/delete_after_harvest = TRUE //deletes tree after cutting down
	log_type = /obj/item/stack/shroomlog


/obj/structure/flora/caveshroom/meatshroom1
	name = "large shroom"
	icon = 'icons/cadia-sprites/migrated2/mining.dmi'
	icon_state = "meatshroom1"
	density = 0
	anchored = 1

/obj/structure/flora/caveshroom/meatshroom2
	name = "large shroom"
	icon = 'icons/cadia-sprites/migrated2/mining.dmi'
	icon_state = "meatshroom2"
	density = 0
	anchored = 1

/obj/structure/flora/caveshroom/meatshroom3
	name = "large shroom"
	icon = 'icons/cadia-sprites/migrated2/mining.dmi'
	icon_state = "meatshroom3"
	density = 0
	anchored = 1

/obj/structure/flora/caveshroom/dead //Not being used yet, but it's there.
	icon = 'z_modular_bear/icons/obj/structures/caveflora.dmi'
	icon_state = "meatshroom1"
	density = 0
	anchored = 1

/obj/structure/smallcaveshroom
	name = "small shroom"
	desc = "How did you see this?"
	anchored = 1
	density = 0
	alpha = 200
	density = FALSE
	var/log_type //type of log
	var/log_amount //amount of logs when cut down
	var/cutdown = FALSE //is it already cut down?
	var/delete_after_harvest = TRUE //deletes tree after cutting down
	var/contained

/obj/structure/smallcaveshroom/glowstalk
	name = "glow stalk"
	desc = "Ever squriming tendrils reach for craven beings seeking light."
	icon = 'icons/cadia-sprites/migrated2/mining.dmi'
	icon_state = "hydra"
	density = 0
	anchored = 1
	log_type = /obj/item/reagent_containers/food/snacks/glowstalk


/obj/structure/smallcaveshroom/glowstalk/New()
	..()
	set_light(5,2, "#d6d65c")
















//_____________________________________Resources_____________________________________

obj/item/stack/shroomlog
	name = "Hard Shroom Logs"
	desc = "The core of a large shroom cut free from the earth."
	singular_name = "Hard Shroom Log"
	icon = 'z_modular_bear/icons/obj/structures/caveflora.dmi'
	icon_state = "shroomlog"
	w_class = ITEM_SIZE_SMALL
	force = 3
	throwforce = 3
	max_amount = 5

/obj/item/stack/shroomlog/update_icon()
	if(!amount)//There's no more money here, so delete the handful.
		qdel(src)
		return
	icon_state = "[initial(icon_state)][amount]"//If there is money then we take our initial icon_state and add the ammount of money in the stack to it.

/obj/item/reagent_containers/food/snacks/glowstalk
	icon = 'icons/cadia-sprites/migrated2/mining.dmi'
	icon_state = "glowstick"
	item_state = "glowstick"
	name = "Glowstalk"
	desc = "Faintly glowing fronds once reached to the sky to draw prey."
	New()
		..()
		bitesize = 1

/obj/item/reagent_containers/food/snacks/glowstalk/New()
	..()
	set_light(2,1, "#d6d65c")
	reagents.add_reagent(/datum/reagent/soporific, 3)
	reagents.add_reagent(/datum/reagent/paracetamol, 15)

















//_____________________________________Harvest code_____________________________________

/obj/structure/flora/caveshroom/attackby(var/obj/item/O, var/mob/user)
	if(log_type)	//if the tree has logs
		if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/material/sword))//what items can cut down trees
			if(!cutdown)
				to_chat(user, "<span='bnotice'[user] begins to saw through \the [src]!</span>" )
				playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
				if(do_after(user, 200, src))
					harvest(user)
	else
		if(!O.force)
			visible_message("<span class='notice'>[user] gently taps [src] with \the [O].</span>")
		else
			O.attack(src, user, user.zone_sel.selecting)

/obj/structure/flora/caveshroom/proc/harvest(var/mob/user)
	if(cutdown)
		to_chat(user, "<span='bnotice'This plant has already been harvested.</span>")
	var/actual_log_amount = max(1,(log_amount/2))
	if(log_type && actual_log_amount>0)
		for(var/i=0;i<actual_log_amount;i++)
			new log_type(get_turf(src)) //pulls the log type from whatever is specified in the tree

		user.visible_message("<span class='danger'>[user] cuts down \the [src]!</span>")
		if(delete_after_harvest)
			qdel(src)
		else
			cutdown = TRUE
	else
		user.visible_message("<span class='danger'>[user] butchers \the [src] messily!</span>")

/obj/structure/smallcaveshroom/attack_hand(var/mob/user)
	if(log_type)
		var/mob/living/carbon/human/H = user
		if(istype(H) && H.gloves)
			if(!cutdown)
				user.visible_message(H, "<span='bnotice'[user] begins pick at  \the [src]!</span>" )
				if(do_after(user, 50, src))
					harvest(user)
				else
					to_chat(H, "<span='bnotice'error not standing still.</span>")
			else
				to_chat(H, "<span='bnotice'There's nothing left to harvest.</span>")
		if(istype(H) && !H.gloves)
			if(do_after(user, 10, src))
				user.visible_message("<span class='danger'>[user] feels a painful sting as they grab the [src] without gloves!</span>")
				user.reagents.add_reagent(/datum/reagent/soporific, 35)
				user.reagents.add_reagent(/datum/reagent/paracetamol, 20)
	else
		to_chat(H, "<span='error.</span>")

/obj/structure/smallcaveshroom/proc/harvest(var/mob/user)
	if(cutdown)
		to_chat(user, "<span='bnotice'This plant has already been harvested.</span>")
	var/actual_log_amount = max(1,(log_amount/2))
	if(log_type && actual_log_amount>0)
		for(var/i=0;i<actual_log_amount;i++)
			new log_type(get_turf(src))

		user.visible_message("<span class='danger'>[user] harvests \the [src]!</span>")
		if(delete_after_harvest)
			qdel(src)
		else
			cutdown = TRUE
	else
		user.visible_message("<span class='danger'>[user] butchers \the [src] messily!</span>")
