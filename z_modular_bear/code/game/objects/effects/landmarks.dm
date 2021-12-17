/obj/random/loot/fantasygear_meh
	desc = "This is a loot spawner that spawns generic fantasy gear. Mostly bad or 'meh' stuff, low chance of some good."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "horribletie"

/obj/random/loot/fantasygear_meh/spawn_choices()
	return list(/obj/item/stack/medical/bruise_pack = 2,
	            /obj/item/clothing/suit/armor/bear/leather = 1,
				/obj/item/weapon/javelin = 5,
				/obj/item/storage/belt/medical/alchemist = 3,
				/obj/item/arrow = 3,
				/obj/item/material/sword/commissword/sabre = 1,
				)