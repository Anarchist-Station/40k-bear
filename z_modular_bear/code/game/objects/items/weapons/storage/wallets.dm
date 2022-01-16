/obj/item/storage/wallet/pouch
	name = "wallet"
	desc = "It can hold a few small and personal things."
	icon = 'icons/obj/thrones.dmi'
	icon_state = "coin_bag"
	w_class = ITEM_SIZE_SMALL
	max_w_class = ITEM_SIZE_SMALL //Don't worry, see can_hold[]
	max_storage_space = 8
	can_hold = list(
		/obj/item/spacecash,
		/obj/item/card,
		/obj/item/thrones,
		/obj/item/lipstick,
		/obj/item/haircomb,
		/obj/item/mirror,
		/obj/item/clothing/accessory/locket,
		/obj/item/clothing/head/hairflower,
		/obj/item/device/flashlight/pen,
		/obj/item/seeds,
		/obj/item/coin,
		/obj/item/dice,
		/obj/item/disk,
		/obj/item/implant,
		/obj/item/implanter,
		/obj/item/flame,
		/obj/item/paper,
		/obj/item/paper_bundle,
		/obj/item/pen,
		/obj/item/photo,
		/obj/item/reagent_containers/dropper,
		/obj/item/reagent_containers/syringe,
		/obj/item/reagent_containers/pill,
		/obj/item/reagent_containers/hypospray/autoinjector,
		/obj/item/reagent_containers/glass/beaker/vial,
		/obj/item/device/radio/headset,
		/obj/item/device/paicard,
		/obj/item/stamp,
		/obj/item/key,
		/obj/item/clothing/accessory/badge)
	slot_flags = SLOT_ID