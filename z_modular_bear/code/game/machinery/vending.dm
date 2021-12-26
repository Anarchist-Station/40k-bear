/obj/machinery/vending/bear
	name = "Fleet-Ration Vendor"
	desc = "As part of the outreach program, the Fleet put up a vendor for the village to sample what they're missing out on, and to feed them. How generous!"
	icon = 'icons/cadia-sprites/migrated/hospital.dmi'
	icon_state = "washer"
	icon_deny = "washer" //no access on it so it doesn't rly matter lol


	products = list(/obj/item/reagent_containers/food/snacks/warfare = 3,
					/obj/item/reagent_containers/food/snacks/warfare/flower = 3,
					/obj/item/reagent_containers/food/snacks/warfare/rat = 3,
					/obj/item/reagent_containers/food/snacks/warfare/milk = 1,
					/obj/item/reagent_containers/food/snacks/warfare/sardine = 3,
					/obj/item/weapon/canopener = 20)
	prices = list(/obj/item/reagent_containers/food/snacks/warfare = 5,
					/obj/item/reagent_containers/food/snacks/warfare/flower = 5,
					/obj/item/reagent_containers/food/snacks/warfare/rat = 5,
					/obj/item/reagent_containers/food/snacks/warfare/milk = 10,
					/obj/item/reagent_containers/food/snacks/warfare/sardine = 5,
					/obj/item/weapon/canopener = 1)