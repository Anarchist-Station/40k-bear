/obj/item/clothing/under/darkwitch
	desc = "Red gossamer that seems to gleam and shine on its own. Despite barely counting as clothing, it's both surprisingly comfortable and feels...oddly protective?"
	name = "blood-witch garb"
	icon = 'z_modular_bear/icons/obj/items/clothing/uniform.dmi'
	item_state = "darkwitch"
	icon_state = "darkwitch"
	worn_state = "darkwitch"
	armor = list(melee = 20, bullet = 10, laser = 40, energy = 50, bomb = 0, bio = 0, rad = 0) //shit be enchanted. todo: make EMPs disable this
	item_icons = list(slot_w_uniform_str = 'z_modular_bear/icons/mob/icons/uniform.dmi')
	item_state_slots = list(
		slot_head_str = "darkwitch",
		)

/obj/item/clothing/under/villagegarb
	desc = "Dirty robes that used to, at one point, probably be proper clothing."
	name = "dark rags"
	icon = 'z_modular_bear/icons/obj/items/clothing/uniform.dmi'
	item_state = "village_garb"
	icon_state = "village_garb"
	worn_state = "village_garb"
	item_icons = list(slot_w_uniform_str = 'z_modular_bear/icons/mob/icons/uniform.dmi')
	item_state_slots = list(
		slot_head_str = "village_garb",
		)

/obj/item/clothing/under/nobleskirt
	desc = "A skirt and frilled tunic fit for someone of royal stature."
	name = "noble's skirt"
	icon = 'icons/cadia-sprites/mob/uniform.dmi'
	item_state = "hos_formal_fem_s"
	icon_state = "hos_formal_fem_s"
	worn_state = "hos_formal_fem"
	armor = list(melee = 20, bullet = 10, laser = 40, energy = 50, bomb = 0, bio = 0, rad = 0) //shit be enchanted. todo: make EMPs disable this
	item_icons = list(slot_w_uniform_str = 'icons/cadia-sprites/mob/uniform.dmi')
	item_state_slots = list(
		slot_head_str = "hos_formal_fem"
		)


/obj/item/clothing/under/nobletuxedo
	desc = "Trousers and a frilled tunic fit for someone of royal stature."
	name = "noble's tuxedo"
	icon = 'icons/cadia-sprites/mob/uniform.dmi'
	item_state = "hos_formal_male_s"
	icon_state = "hos_formal_male_s"
	worn_state = "hos_formal_male"
	armor = list(melee = 20, bullet = 10, laser = 40, energy = 50, bomb = 0, bio = 0, rad = 0) //shit be enchanted. todo: make EMPs disable this
	item_icons = list(slot_w_uniform_str = 'icons/cadia-sprites/mob/uniform.dmi')
	item_state_slots = list(
		slot_head_str = "hos_formal_male"
		)