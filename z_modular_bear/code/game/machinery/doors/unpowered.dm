/obj/machinery/door/unpowered/inn
	normalspeed = 1
	autoclose = 0

/obj/machinery/door/unpowered/inn
	normalspeed = 1
	autoclose = 0
	req_access = list(213)


/obj/machinery/door/unpowered/inn/dungeon
	normalspeed = 0
	autoclose = 1


/obj/machinery/door/unpowered/inn/interior
	name = "interior inn door"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_bar)

/obj/machinery/door/unpowered/inn/magistratum
	name = "Magistratum door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_brig)

/obj/machinery/door/unpowered/inn/vault
	name = "Interior Vault"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_treasury)


/obj/machinery/door/unpowered/inn/krootdoor
	name = "kroot room door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_kroot)

/obj/machinery/door/unpowered/inn/groxpen
	name = "grox pen"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_grox)


/obj/machinery/door/unpowered/inn/room1
	name = "room 1"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_inn1) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/inn/room2
	name = "room 2"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_inn2) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/inn/room3
	name = "room 3"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_inn3) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/administratum
	name = "Administratum Door"
	icon = 'icons/obj/doors/door_cave2.dmi'
	icon_state = "door1"
	autoclose = 0
	normalspeed = 1
	req_access = list(access_administratum) //so innkeeper always can get in if needed

/obj/machinery/door/unpowered/cargo
	name = "heavy wood door"
	desc = "Heavy on its hinges, and always seems to tend to swing inward to close.."
	autoclose = 1
	normalspeed = 1
	req_access = list(access_cargo) //so innkeeper always can get in if needed