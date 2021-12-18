// first, reflavors up here.

/obj/item/reagent_containers/glass/bucket
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "bucket"

/obj/item/material/minihoe
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "hoe"

/obj/item/shovel/spade
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "spade"

/obj/item/material/hatchet
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "axe"
	desc = "An axe made from crude metal and a rotwood grip. Not the best weapon, but it's reliable for cutting trees."


/obj/item/material/sword/cane/seolite/practice
	force = 5
	name = "practice sword"
	desc = "A sword belonging to the Nobility. This blade is weighted perfectly in your hand. A large hilt allows for easy blocking. This one has a blunted edge. Still painful."
	sharp = 0
	edge = 0



/obj/item/material/sword/chaosknife/lament
	name = "blooded knife"
	desc = "A knife made of solid tears and mourning. Just holding it in your hand makes you feel so heavy, but ready to lash out with rage."
	force_divisor = 0.35
	block_chance = 15
	force = 15

// next, new weapons 'proper'

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

// crafting tree with javelin - rope
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


/obj/item/handcuffs/cable/rope
	desc = "A length of rope. Has many uses, most of them for crafting. Can also tie people up." // TODO: rope sprites, also make it so rope completely restrains someone (no movement)
	name = "rope"
	icon = 'z_modular_bear/icons/obj/items/miscellaneous.dmi'
	icon_state = "rope"

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
	if(istype(W,/obj/item/ingots/ironingot))
		to_chat(user, "<span class='notice'>You begin fashioning your new spear...</span>")
		if(do_after(user, 50, src))
			to_chat(user, "<span class='notice'>You crafted your new spear!</span>")
			qdel(W)
			new /obj/item/weapon/spear_crafted(get_turf(src))
			qdel(src)
			return


/obj/item/weapon/earthbreaker
	name = "Earthbreaker"
	desc = "An incredibly heavy hammer fashioned by the All-Dwellers in the image of the hammer of their god. If you're strong enough to hold it in two hands effectively, it's a devestating weapon."
	force = 40
	sharp = 0
	edge = 0
	sharpness = 0
	str_requirement = 20
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


//custom stuff with extra code

/obj/item/shield/buckler/custom
	name = "custom-made buckler"
	desc = "A buckler with a twist- though it's covered in wood, nearly the entire thing is made out of a surprisingly protective material that's warm to the touch. Has runes on the back-side of it. Also has a razor-sharp edge. For some reason, you feel confident enough to throw it."
	icon = 'z_modular_bear/icons/obj/items/weapons/village.dmi'
	icon_state = "buckler"
	color = "gray"
	slot_flags = SLOT_BACK
	force = 12
	throwforce = 25
	sharp = 1
	edge = 1
	base_block_chance = 60
	throw_speed = 10
	throw_range = 10
	w_class = ITEM_SIZE_HUGE
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 1000, "Wood" = 1000)
	attack_verb = list("slashed", "cut")

/obj/item/shield/buckler/handle_shield(mob/living/user)
	. = ..()
	if(.) playsound(user.loc, 'sound/items/buckler_block.ogg', 50, 1)

/obj/item/shield/buckler/get_block_chance(mob/user, var/damage, atom/damage_source = null, mob/attacker = null)
	return base_block_chance
