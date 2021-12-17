/obj/item/clothing/suit/armor/bear
	name = "knight's armor"
	desc = "The regalia of a knight of the House Nobility. Although it looks like it's made out of steel, there have been a few improvements made to it with space-age materials. Full-body protection! The downside is that it's extremely heavy."
	armor = list(melee = 60, bullet = 35, laser = 35, energy = 5, bomb = 10, bio = 0, rad = 0)
	icon_state = "village_knight"
	item_state = "village_knight"
	icon_override = 'z_modular_bear/icons/mob/suit.dmi'
	icon = 'z_modular_bear/icons/mob/icons/suit.dmi'
	str_requirement = 14
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS



/obj/item/clothing/suit/armor/bear/iron
	name = "light knight's breastplate"
	desc = "The regalia of a knight of the House Nobility. A protective breastplate for shielding your fleshy organs. Heavy."
	armor = list(melee = 45, bullet = 30, laser = 20, energy = 0, bomb = 20, bio = 0, rad = 0)
	icon_state = "iron_chest"
	item_state = "iron_chest"
	str_requirement = 11
	body_parts_covered = UPPER_TORSO


/obj/item/clothing/suit/armor/bear/leather
	name = "leather armor"
	desc = "Armor for your chest made out of animal-hide. Surprisingly protective, and lightweight, though it doesn't stop bullets."
	armor = list(melee = 40, bullet = 15, laser = 15, energy = 5, bomb = 20, bio = 0, rad = 0)
	icon_state = "leather"
	item_state = "leather"
	icon = 'z_modular_bear/icons/mob/icons/suit.dmi'
	icon_override = 'z_modular_bear/icons/mob/suit.dmi'
	body_parts_covered = UPPER_TORSO
	str_requirement = 5

/obj/item/clothing/suit/armor/bear/bone
	icon_state = "bone"
	item_state = "bone"
	icon = 'z_modular_bear/icons/mob/icons/suit.dmi'
	icon_override = 'z_modular_bear/icons/mob/suit.dmi'


/*
/obj/item/clothing/under/bearpriest
	name = "priest vestiment"
	desc = "Priest vestiments."
//	icon_override = 'z_modular_bear/icons/mob/icons/uniform.dmi'
	icon = 'z_modular_bear/icons/mob/icons/uniform.dmi'
	icon_state = "priest"
	item_state = "priest"
	worn_state = "priest"
	item_state_slots = list(
		slot_w_uniform = "priest",
		)
*/