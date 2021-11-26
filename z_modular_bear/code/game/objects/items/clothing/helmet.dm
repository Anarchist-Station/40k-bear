/obj/item/clothing/head/helmet/stechhelm
	name = "Stechhelm"
	desc = "Frog-mouthed helmet."
	drop_sound = 'sound/items/helm_drop.ogg'
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "stechhelm"
	item_icons = list(slot_head_str = 'z_modular_bear/icons/mob/icons/head.dmi')
	item_state_slots = list(
		slot_head_str = "stechhelm",
		slot_l_hand_str = "helmet",
		slot_r_hand_str = "helmet"
		)
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 60, bullet = 50, laser = 40, energy = 35, bomb = 30, bio = 0, rad = 0)
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	helmet_vision = TRUE