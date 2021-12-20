// required tools for crafting

/obj/item/weapon/earthbreaker //this is used for shaping ingots
	name = "Earthbreaker"
	desc = "An incredibly heavy hammer fashioned by the All-Dwellers in the image of the hammer of their god. Due to its heavy weight, it's most commonly used in forging...but the warriors that are strong enough to use it threaten a devestating blow."
	force = 40
	sharp = 0
	edge = 0
	sharpness = 0
	str_requirement = 25
	w_class = ITEM_SIZE_HUGE
	attack_verb = list("thwacked", "crushed")
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "earthbreaker"
	item_icons = list(
		icon_l_hand = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		icon_r_hand = 'z_modular_bear/icons/mob/onmob/righthand.dmi',
		)
	item_icons = list(slot_l_hand_str = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'z_modular_bear/icons/mob/onmob/righthand.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "earthbreaker",
		slot_r_hand_str = "earthbreaker"
	) //i actually don't know if the above part is needed lol

// rope
/obj/structure/flora/ausbushes/sparsegrass
	var/harvested_rope = 0

/obj/structure/flora/ausbushes/sparsegrass/attack_hand(mob/user as mob) //attack_generic may be better here
	if (harvested_rope == 0)
		to_chat(user, "<span class='notice'>You start uprooting tufts of grass and picking out suitable reeds...</span>")
		if(do_after(user, 50, src))
			if(prob(75))
				to_chat(user, "<span class='notice'>You finish scavenging, finding nothing useful.</span>")
				harvested_rope++
				return
			else
				new /obj/item/handcuffs/cable/rope(get_turf(src))
				harvested_rope++
				to_chat(user, "<span class='notice'>You finish scavenging.</span>")
				return
	else if (harvested_rope == 1)
		to_chat(user, "<span class='notice'>The grass has already been scavenged through...</span>")
		return

// first - javelin to spear

/obj/item/weapon/javelin
	name = "wooden javelin"
	desc = "A wooden javelin that doubles up as a spear. Good for both throwing and stabbing. Not exactly an elegant weapon."
	throw_speed = 15
	throw_range = 15
	force = 10
	throwforce = 25
	sharp = 1
	attack_verb = list("stabs", "jabs")
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "stick"
	item_icons = list(
		icon_l_hand = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		icon_r_hand = 'z_modular_bear/icons/mob/onmob/righthand.dmi',
		)
	item_icons = list(slot_l_hand_str = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'z_modular_bear/icons/mob/onmob/righthand.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "stick",
		slot_r_hand_str = "stick"
	) //i actually don't know if the above part is needed lol

/obj/item/weapon/javelin_step
	name = "wooden javelin"
	desc = "A wooden javelin that doubles up as a spear. Good for both throwing and stabbing. Not exactly an elegant weapon. Has a piece of rope on the end waiting to affix something."
	throw_speed = 15
	throw_range = 15
	force = 12
	throwforce = 25
	sharp = 1
	attack_verb = list("stabs", "jabs")
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "stick_rope"
	item_icons = list(
		icon_l_hand = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		icon_r_hand = 'z_modular_bear/icons/mob/onmob/righthand.dmi',
		)
	item_icons = list(slot_l_hand_str = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'z_modular_bear/icons/mob/onmob/righthand.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "stick",
		slot_r_hand_str = "stick"
	) //i actually don't know if the above part is needed lol

/obj/item/weapon/spear_crafted
	name = "metal spear"
	desc = "A wooden javelin that's had a pointy bit affixed to the end. You made this! A bit worse at tossing than a solely wooden counterpart, but much pointier for stabbing."
	throw_speed = 15
	throw_range = 15
	force = 15
	throwforce = 20
	sharp = 1
	attack_verb = list("stabs", "jabs")
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "stick_end"
	item_icons = list(
		icon_l_hand = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		icon_r_hand = 'z_modular_bear/icons/mob/onmob/righthand.dmi',
		)
	item_icons = list(slot_l_hand_str = 'z_modular_bear/icons/mob/onmob/lefthand.dmi',
		slot_r_hand_str = 'z_modular_bear/icons/mob/onmob/righthand.dmi'
		)
	item_state_slots = list(
		slot_l_hand_str = "finish_stick",
		slot_r_hand_str = "finish_stick"
	) //i actually don't know if the above part is needed lol

// javelin to rope stick
/obj/item/weapon/javelin/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/handcuffs/cable/rope))
		to_chat(user, "<span class='notice'>You tie the rope firmly around the edge of the javelin. Now you just need to attach something to the end of it!</span>")
		if(do_after(user, 50, src))
			qdel(W)
			new /obj/item/weapon/javelin_step(get_turf(src))
			qdel(src)
			return
		return



// rope stick to spear

/obj/item/weapon/javelin_step/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/bear_crafting/iron_spear))
		to_chat(user, "<span class='notice'>You begin fashioning your new spear...</span>")
		if(do_after(user, 50, src))
			to_chat(user, "<span class='notice'>You crafted your new spear!</span>")
			qdel(W)
			new /obj/item/weapon/spear_crafted(get_turf(src))
			qdel(src)
			return
