
//fud- reflavored, first

/obj/item/reagent_containers/food/snacks/warfare/flower
	name = "\improper canned leaf-delight"
	desc = "A Biblio specialty poorly recreated in a can. Salad-replacement synthesized in a lab and fortified with bean proteins."
	nutriment_desc = list("something like salad" = 1)

/obj/item/reagent_containers/food/snacks/warfare/rat
	name = "\improper proccessed canned meat-product"
	desc = "A canned meal reinforced with iron and vitamins. Is it meat? Probably! Is it edible? Maybe! Is it tasty? Good joke!"
	nutriment_desc = list("chewy meat" = 1)

/obj/item/reagent_containers/food/snacks/warfare/sardine
	name = "\improper canned ripmeat"
	icon_state = "pisssardine"
	open_can_icon = "pisssardine_open"
	desc = "A can of proccessed ripper meat. Surprisingly fishy. Smells rotten."
	nutriment_desc = list("slightly-fermented meat" = 1)





// new


/obj/item/reagent_containers/food/snacks/warfare/milk
	name = "\improper canned condensed milk"
	desc = "The blessed king of all Fleet rations. Sweet milk in a can. Filling and doesn't make you want to tear your eyes out."
	icon = 'z_modular_bear/icons/obj/food.dmi'
	icon_state = "milk"
	open_can_icon = "milk_open"
	nutriment_desc = list("sweet milk" = 1)
	bitesize = 1
	nutriment_amt = 12

/obj/item/trash/warfare_can/milk
	name = "used can"
	icon = 'z_modular_bear/icons/obj/food.dmi'
	icon_state = "milk_empty"
	drop_sound = 'sound/items/handle/can_drop.ogg'