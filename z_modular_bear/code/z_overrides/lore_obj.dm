//statues and signs

/obj/structure/statue/aquilla
	name = "fleet insignia altar"
	desc = "...the Fleet will march on in the face of danger and against all enemies, for we bear the Insignia of Sol, which fills us with strength, and means that..."

/obj/structure/statue/verina
	name = "elegy for Eurydale"
	desc = "A statue of the dead nature goddess, Eurydale, who died in the Fleet invasion. She was blasted to a million pieces by a single beam, her ashes scattered across her children whom she raised her soft, feathery wings to protect. This statue is of her worshippers, for it is illegal to build one in her image."

/obj/structure/statue/verina/broken
	name = "elegy for Eurydale"
	desc = "Into a thousand ashes the Goddess of Nature disintegrated, gone from this realm. With her died thousands of stories, millions of untold little Lights that would never live to see the now-darkened, ashy-snowy sky where her remains blanket the world. Is the winter her fault? Is this revenge...?"

/obj/structure/sign/imperial
	name = "fleet insignia"
	desc = "Into the void the Fleet marches, stopping only to bury our fallen before moving on. To a billion worlds have we sailed, and may a billion more pass us!"

// doors

/obj/machinery/door/airlock/imperiumdoor
	name = "fleet airlock"
	desc = "A solemn door with iconography of the Flagship carved into it. It is made of scrap and copper mechanations."
	icon = 'z_modular_bear/icons/obj/doors/imperiumdoor.dmi'

/obj/machinery/door/airlock/imperiumdoor
	name = "fleet airlock"
	desc = "A solemn door with iconography of the Flagship carved into it. It is made of scrap and copper mechanations."
	icon = 'z_modular_bear/icons/obj/doors/imperiumdoor.dmi'

/obj/machinery/door/airlock/highsecurity/imperiumdoor
	name = "reinforced airlock"
	desc = "A reinforced, monstrously heavy door with an ornate archway. It is made of heavy metal. It has iconography scrawled into it resembling the Flagship, with its thrusters serving as status indicators and a large,emphasized canopy."
	icon = 'z_modular_bear/icons/obj/doors/imperiumdoor.dmi'



// signs

/obj/structure/sign/bear
	icon = 'z_modular_bear/icons/obj/decals.dmi'

/obj/structure/sign/art/lordgovenor
	name = "Royal Portrait"
	desc = "A portrait of a lord or noble of some kind. He looks important."

// fireplace / pyre


/obj/structure/fireplacebl
	icon = 'icons/obj/objects.dmi'
	icon_state = "fire_bl"
	name = "fireplace"
	desc = "In radiance may we find victory."
	anchored = 1
	density = 1
	pixel_x = 0
	pixel_y = 0
	var/lit = FALSE
	var/self_lighting = 0
	lit = 1

/obj/structure/fireplacebl/br
	icon = 'icons/obj/objects.dmi'
	icon_state = "fire_br"
	pixel_x = 0
	pixel_y = 0
	lit = 1


/obj/structure/fireplacebl/r
	icon = 'icons/obj/objects.dmi'
	icon_state = "fire_r"
	pixel_x = 0
	pixel_y = 0
	lit = 1

/obj/structure/fireplacebl/l
	icon = 'icons/obj/objects.dmi'
	icon_state = "fire_l"
	pixel_x = 0
	pixel_y = 0
	lit = 1

/obj/structure/fireplacebl/New()
	set_light(5, 7, "#E38F46")

/obj/structure/fireplacebl/l/New()
	set_light(5, 7, "#E38F46")

/obj/structure/fireplacebl/r/New()
	set_light(5, 7, "#E38F46")

/obj/structure/fireplacebl/br/New()
	set_light(5, 7, "#E38F46")


/obj/item/paper/pamphlet/fleet
	name = "pamphlet"
	icon_state = "pamphlet"
	info = "<b>Welcome to the Fleet!</b><br>\
			Greetings, native! Whether you are a newly-hired recruit, or considering a career \
			with the Fleet, this pamphlet will share some of the many signing benefits with you!  \
			If you're prepared to serve your community and progress your species to the new age, read on!<br> \
			<b>TRADE AND MEDICAL BENEFITS</b><br>\
			By signing with the Fleet, you gain an immesurable amount of bonuses! All Fleet \
			soldiers are trained in useful life or trade skills, and work in safe enviroments with fair pay! \
			Even if you get injured in an accident, our top-of-the-line medical coverage will cover the \
			costs of injury, and provide restitution to your family in the event of brain-death or \
			severe injury. What's a couple of bruises when you have some good old FLEET ELBOW GREASE? <br>\
			<b>PERSONAL BENEFITS</b><br>\
			All Fleet personnel are fed filling, naturally-sourced meals free of charge, and can even \
			spend some of their salary for extra rations! The menu options are nearly endless- and tasty!. \
			You'll see some classic home-planet chow like Leaf Delight or Ripper Meat, but you'll also get \
			to enjoy foreign delicacies like meat from a Mus musculus, or beans grown in zero-gravity.\
			 .<br>\
			<br><b>What are YOU waiting for?</b><br>\
			A sense of purpose, a warm bed, security and standing strong with your brothers and sisters. \
			What's not to love? Join the Fleet today!"

/obj/item/paper/pamphlet/fleet/update_icon()
	return