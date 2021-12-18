/obj/random/loot/fantasygear_meh
	desc = "This is a loot spawner that spawns generic fantasy gear. Mostly bad or 'meh' stuff, low chance of some good."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/fantasygear_meh/spawn_choices()
	return list(/obj/item/stack/medical/bruise_pack = 2,
	            /obj/item/clothing/suit/armor/bear/leather = 1,
	            /obj/item/clothing/suit/armor/bear/bone = 1,
				/obj/item/weapon/javelin = 5,
				/obj/item/storage/belt/medical/alchemist = 3,
				/obj/item/arrow = 3,
				/obj/item/material/sword/commissword/sabre = 1
				)

/obj/random/loot/fantasygear_armor
	desc = "This is a loot spawner that spawns generic fantasy gear. Mostly armor."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/fantasygear_armor/spawn_choices()
	return list(/obj/item/clothing/suit/armor/bear/leather = 4,
	            /obj/item/clothing/suit/armor/bear/bone = 4,
				/obj/item/storage/belt/medical/alchemist = 4,
				/obj/item/arrow = 2,
				/obj/item/clothing/suit/armor/bear/iron = 2,
				/obj/item/storage/backpack/satchel/quiver = 2,
				/obj/item/storage/backpack/satchel/quiver/full = 2,
				/obj/item/clothing/suit/armor/bear = 1
				)

