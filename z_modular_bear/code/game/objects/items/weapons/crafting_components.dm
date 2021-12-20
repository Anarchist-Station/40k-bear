/obj/item/weapon/bear_crafting
	name = "debug crafting item"
	desc = "Ping Bear if this exists."
	icon = 'z_modular_bear/icons/obj/items/miscellaneous.dmi'

/obj/item/handcuffs/cable/rope
	desc = "A length of rope. Has many uses, most of them for crafting. Can also tie people up." // TODO: rope sprites, also make it so rope completely restrains someone (no movement)
	name = "rope"
	icon = 'z_modular_bear/icons/obj/items/miscellaneous.dmi'
	icon_state = "rope"


/obj/item/weapon/bear_crafting/iron_axe
	name = "iron axe head"
	desc = "The head of an iron axe, waiting to be attached to something. Useless as-is. Might be useful as a...throwing weapon?"
	icon_state = "axe_head"
	force = 0

/obj/item/weapon/bear_crafting/iron_spear
	name = "iron axe head"
	desc = "The head of an iron spear, waiting to be attached to something. Might be useful as a...throwing weapon?."
	icon_state = "spade_head"
	force = 0

/obj/item/weapon/bear_crafting/spade_head
	name = "spade head"
	desc = "A spade head."
	icon_state = "spade_head"
	force = 0

/obj/item/weapon/bear_crafting/wood_hilt
	name = "wood hilt"
	desc = "A hilt waiting to turn into something useful. "
	icon_state = "hilt_wood"
	var/roped = 0




/obj/item/weapon/bear_crafting/wood_hilt/attackby(obj/item/W as obj, mob/user as mob)
	while(src.roped == 0)
		if(istype(W,/obj/item/handcuffs/cable/rope))
			to_chat(user, "<span class='notice'>You attach the rope to the end of the tool.</span>")
			src.desc += "It has a piece of rope attached to the end of it."
			roped++
			qdel(W)
			return
	while(src.roped == 1)
		if(istype(W,/obj/item/weapon/bear_crafting/iron_axe))
			to_chat(user, "<span class='notice'>You start pulling everything together...</span>")
			if(do_after(user, 50, src))
				to_chat(user, "<span class='notice'>Done!</span>")
				new /obj/item/material/hatchet(get_turf(src))
				qdel(W)
				qdel(src)
				return
		if(istype(W,/obj/item/weapon/bear_crafting/spade_head))
			to_chat(user, "<span class='notice'>You start pulling everything together...</span>")
			if(do_after(user, 50, src))
				to_chat(user, "<span class='notice'>Done!</span>")
				new /obj/item/shovel/spade(get_turf(src))
				qdel(W)
				qdel(src)
				return