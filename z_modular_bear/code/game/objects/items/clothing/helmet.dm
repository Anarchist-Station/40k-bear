/obj/item/clothing/head/helmet/stechhelm
	name = "Stechhelm"
	desc = "A wonderful Frog-mouthed helmet. The height of protective fashion! Just don't bother trying to turn your head to look at things."
	drop_sound = 'sound/items/helm_drop.ogg'
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "stechhelm"
	item_icons = list(slot_head_str = 'z_modular_bear/icons/mob/icons/head.dmi')
	item_state_slots = list(
		slot_head_str = "stechhelm",
		)
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD|EYES|BLOCKHEADHAIR
	armor = list(melee = 80, bullet = 80, laser = 80, energy = 50, bomb = 60, bio = 10, rad = 10)
	flags_inv = BLOCKHEADHAIR
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	helmet_vision = TRUE
	str_requirement = 18

/obj/item/clothing/head/helmet/sentryhelm
	name = "Sentry Helmet"
	desc = "Used for taking blows to the noggin without getting hurt."
	drop_sound = 'sound/items/helm_drop.ogg'
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "siegehelmet"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 55, bullet = 55, laser = 55, energy = 40, bomb = 50, bio = 5, rad = 5)
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	str_requirement = 14
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/helmet/hauberkhood
	name = "Chainmail Coif"
	desc = "A series of metal rings to provide some protection to your head."
	drop_sound = 'sound/items/helm_drop.ogg'
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "hauberkhood"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD
	armor = list(melee = 45, bullet = 45, laser = 45, energy = 30, bomb = 40, bio = 0, rad = 0)
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	str_requirement = 12
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/helmet/zealot
	name = "Steel Helm"
	desc = "When your face needs protection too."
	drop_sound = 'sound/items/helm_drop.ogg'
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "zealot"
	item_flags = ITEM_FLAG_THICKMATERIAL
	body_parts_covered = HEAD|EYES|BLOCKHEADHAIR
	armor = list(melee = 60, bullet = 60, laser = 60, energy = 60, bomb = 60, bio = 10, rad = 10)
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	helmet_vision = TRUE
	str_requirement = 15
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/helmet/armingcap
	name = "Arming cap"
	desc = "Padded leather in the form of headwear. Comfortable and warm at least."
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "armingcap"
	body_parts_covered = HEAD
	armor = list(melee = 25, bullet = 25, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0)
	flags_inv = BLOCKHEADHAIR
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	str_requirement = 0
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/hatfur
	name = "Fur Hat"
	desc = "A warm fur hat to keep out the cold."
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "hatfur"
	body_parts_covered = HEAD
	armor = list(melee = 20, bullet = 20, laser = 20, energy = 20, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 1
	w_class = ITEM_SIZE_NORMAL
	str_requirement = 0
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/minitop
	name = "Tiny Hat"
	desc = "Small hat, with a ribbon."
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "minitop"
	w_class = ITEM_SIZE_SMALL
	str_requirement = 0
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/leper
	name = "Cloth Hood"
	desc = "A thin fabric woven into a hood."
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "leper"
	w_class = ITEM_SIZE_SMALL
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD
	str_requirement = 0
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')

/obj/item/clothing/head/plebhood
	name = "Leather Hood"
	desc = "Light leathers to wrap around one's head."
	icon = 'z_modular_bear/icons/obj/items/clothing/hats.dmi'
	icon_state = "plebhood"
	w_class = ITEM_SIZE_SMALL
	flags_inv = BLOCKHEADHAIR
	body_parts_covered = HEAD
	str_requirement = 0
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(slot_head_str = 'icons/cadia-sprites/obj/clothing/hats.dmi')