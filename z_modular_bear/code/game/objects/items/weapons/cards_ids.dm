// new accesses. accessi? accessories. bear access

/var/const/access_stockades= 518
/datum/access/stockades
	id = access_stockades
	desc = "noble stockades"


/var/const/access_nobility= 519
/datum/access/stockades
	id = access_nobility
	desc = "nobility"


// keys

/obj/item/card/id/stockades
	name = "stockades key"
	color = "grey"
	icon_state = "key2"
	access = list(access_stockades)
	grab_sound = 'sound/items/keyring_up.ogg'

/obj/item/card/id/nobility
	name = "nobility key"
	color = "grey"
	icon_state = "key3"
	access = list(access_nobility)
	grab_sound = 'sound/items/keyring_up.ogg'

/obj/item/card/id/ring/nobility
	icon_state = "admin_ring"
	access = list(access_stockades, access_nobility)
	desc = "An ornate ring forged by jewlers. Glows faintly upon approaching a door or lock."

/obj/item/card/id/shop
	name = "merchant's key"
	grab_sound = 'sound/items/keyring_up.ogg'
	icon_state = "key3"
	access = list(213)