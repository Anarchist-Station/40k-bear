/obj/item/storage/backpack/satchel/quiver
	name = "quiver"
	desc = "A quiver, meant for holding arrows."
	can_hold = list(/obj/item/arrow)
	icon = 'z_modular_bear/icons/obj/storage.dmi'
	icon_state = "quiver"
	item_icons = list(slot_back_str = 'z_modular_bear/icons/mob/onmob/back.dmi')
	max_storage_space = 56
	item_state_slots = list(
		slot_wear_suit_str = "quiver",
		)

/obj/item/storage/backpack/satchel/quiver/full/New()
	..()
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)
	new /obj/item/arrow(src)