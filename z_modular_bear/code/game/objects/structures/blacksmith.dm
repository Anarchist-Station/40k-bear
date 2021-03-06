/obj/structure/anvil
	name = "anvil"
	desc = "An anvil for your forge. Used to work basic iron and steel."
	icon = 'z_modular_bear/icons/obj/structures/misc.dmi'
	icon_state = "anvil"
	density = 1
	anchored = 1
	var/occupied = 0
	var/ironbar = 0
	var/goldbar = 0
	var/adamantinebar = 0
	var/silverbar = 0
	var/steelbar = 0
	var/disabled = 0

// list of recipes for materials
	var/ironrecipes = list("Knuckle-Dusters", "Spear-head", "Axe-head", "Spade-head", "Iron Armor")

// these ingot vars are going to be used to determine what ingot is actually on the anvil. kind of shitty i know
// hopefully there will be no cases where more than 1 of these vars will be true at once. if so, uh...OOPS LOL


/obj/structure/anvil/update_icon()
	if(occupied)
		icon_state = "anvil_occ"
	else
		icon_state = "anvil"


/obj/structure/anvil/proc/update_occupy()
	if(src.ironbar == 0)
		src.occupied = 0
	if(src.ironbar >= 1)
		src.occupied = 1



/obj/structure/anvil/attackby(obj/item/W as obj, mob/user as mob)


	while(src.occupied == 0)
		if(istype(W,/obj/item/weapon/earthbreaker))
			to_chat(user, "<span class='notice'>You need to put a bar on the anvil to hammer anything into shape!</span>")
			update_icon()
			return

		if(istype(W,/obj/item/ingots/ironingot))
			qdel(W)
			to_chat(user, "<span class='notice'>You put an iron bar onto the anvil and ready it for forging.</span>")
			ironbar++
			occupied++
			update_occupy()
			update_icon()
			return
		else
			return


// maybe while() the vars for the bars so we don't have to 'if' this the entire time? something like
// if W = earthbreaker, WHILE bartype = 1, something like that?

	while(src.occupied == 1)

		if(istype(W,/obj/item/ingots/ironingot))
			to_chat(user, "<span class='notice'>You put an iron bar onto the anvil and ready it for forging.</span>")
			ironbar++
			qdel(W)
			return
		if((istype(W,/obj/item/weapon/earthbreaker)) && (src.ironbar >= 1))
			to_chat(user, "<span class='notice'>You heft the impossible weight of the hammer in your hands and begin banging the iron bar into shape...</span>")
			playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
			if(do_after(user, 50, src))
				var/ironchoice = input("Hammering", "Hammer your metal into shape") as anything in ironrecipes

				switch(ironchoice)
					if("Knuckle-Dusters")
						to_chat(user, "<span class='notice'>You begin hammering out your weapon...</span>")
						playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
						if(do_after(user, 50, src))
							new /obj/item/weapon/knuckleduster(get_turf(src))
							ironbar--
							update_occupy()
							update_icon()
							playsound(usr, 'sound/items/metaldrop.ogg', 80, 0, -1)
							to_chat(user, "<span class='notice'>You've crafted a pair of knuckledusters!</span>")
							return
					if("Axe-head")
						to_chat(user, "<span class='notice'>You begin hammering out your weapon...</span>")
						playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
						if(do_after(user, 50, src))
							new /obj/item/weapon/bear_crafting/iron_axe(get_turf(src))
							to_chat(user, "<span class='notice'>You've crafted an axe head!</span>")
							ironbar--
							update_occupy()
							update_icon()
							return
					if("Spear-head")
						to_chat(user, "<span class='notice'>You begin hammering out your weapon...</span>")
						playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
						if(do_after(user, 50, src))
							new /obj/item/weapon/bear_crafting/iron_spear(get_turf(src))
							to_chat(user, "<span class='notice'>You've crafted a spear head!</span>")
							ironbar--
							update_occupy()
							update_icon()
							return
					if("Spade-head")
						to_chat(user, "<span class='notice'>You begin hammering out your item...</span>")
						playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
						if(do_after(user, 50, src))
							new /obj/item/weapon/bear_crafting/spade_head(get_turf(src))
							playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
							to_chat(user, "<span class='notice'>You've crafted a spade head!</span>")
							ironbar--
							update_occupy()
							update_icon()
							return
					if("Iron Armor")
						if(ironbar < 5)
							to_chat(user, "<span class='notice'>You need five iron bars to make this!</span>")
							return
						if(ironbar >= 5)
							to_chat(user, "<span class='notice'>You begin hammering out your item...</span>")
							playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
							if(do_after(user, 50, src))
								new /obj/item/clothing/suit/armor/bear/iron(get_turf(src))
								playsound(usr, 'sound/misc/forgeloop.ogg', 80, 0, -1)
								to_chat(user, "<span class='notice'>You've crafted an iron chestplate!</span>")
								(src.ironbar -= 5)
								update_occupy()
								update_icon()
								return
							return
		else
			return
		return

