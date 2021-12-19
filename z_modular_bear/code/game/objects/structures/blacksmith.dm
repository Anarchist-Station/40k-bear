/obj/structure/anvil
	name = "anvil"
	desc = "An anvil for your forge."
	icon = 'icons/obj/stationobjs.dmi'
	icon_state = "forge"
	density = 1
	anchored = 1
	var/occupied = 0
	var/ironbar = 0
	var/goldbar = 0
	var/adamantinebar = 0
	var/silverbar = 0
	var/steelbar = 0

// these ingot vars are going to be used to determine what ingot is actually on the anvil. kind of shitty i know
// hopefully there will be no cases where more than 1 of these vars will be true at once. if so, uh...OOPS LOL





/obj/structure/anvil/attackby(obj/item/W as obj, mob/user as mob)
	while(src.occupied == 0)
		if(istype(W,/obj/item/weapon/earthbreaker))
			to_chat(user, "<span class='notice'>You need to put a bar on the anvil to hammer anything into shape!</span>")
			return
		if(istype(W,/obj/item/ingots/ironingot))
			qdel(W)
			to_chat(user, "<span class='notice'>You put an iron bar onto the anvil and ready it for forging.</span>")
			ironbar++
			occupied++
			return
	while(src.occupied == 1)
		if((istype(W,/obj/item/weapon/earthbreaker)) && (src.ironbar == 1))
			to_chat(user, "<span class='notice'>i just pissed my pants</span>")
			return
