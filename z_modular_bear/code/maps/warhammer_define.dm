///datum/map/warhammer
//	map_lore = "Biblio-32c was a forgotten prison-planet that used to house heretics and criminals, miscreants for whom death was too harsh but going free was too lenient. Over generations, though, Biblio-32c became a Lost World, forgotten among the gears of the Administratum, until a Rogue Trader purchased it for its mining resources. Upon arrival, the trader was shocked to find an inhabited, ignorant backwater world, full of warp readings and abhumans. The native population are not too happy at suddenly having to pay taxes and work for an Imperium that they were, apparently, citizens of all of their lives, despite not knowing of their existance til four years ago. And the local House Nobility are furious..."

/datum/map/warhammer
.

/datum/map/warhammer
	name = "Evervalley"
	full_name = "Biblio Evervalley"
	path = "warhammer"
	station_name  = "The Evervalley"
	station_short = "Evervalley"
	dock_name     = "Evervalley"
	boss_name     = "Fleet Admirality"
	boss_short    = "1stFleet"
	company_name  = "First Fleet"
	company_short = "1stFleet"
	system_name = "Biblio-System"

	lobby_icon = 'maps/warhammer/fullscreen.dmi'
	lobby_screens = list("lobby1","lobby2","lobby3","lobby4","lobby5", "lobby6")

	station_levels = list(1,2,3,4)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)

	allowed_spawns = list("Arrivals Shuttle")
	base_turf_by_z = list("1" = /turf/simulated/floor/dirty, "2" = /turf/simulated/floor/dirty, "3" = /turf/simulated/floor/dirty,"4" = /turf/simulated/floor/dirty)
	shuttle_docked_message = "The shuttle has docked."
	shuttle_leaving_dock = "The shuttle has departed from home dock."
	shuttle_called_message = "A scheduled transfer shuttle has been sent."
	shuttle_recall_message = "The shuttle has been recalled"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	map_lore = "The First Fleet shattered Biblio-32c on a quiet night, seven years ago. They invaded in a brief, bloody war that lasted twelve hours, and resulted in the death of over seventy percent of all native flora and fauna. As the natives were reeling from the bloody Conflict, the First Fleet was moving to set up their mineral-extractors. Just as soon as they arrived, the Fleet left, leaving behind only a skeleton-crew to occupy the planet and send back resources. It's been four years, since then- all of them have been cold, dark winters, year-round. Though the remnants of the last governments, the House Nobility, have attempted to plead for help from the occupying Fleet force, none has come. To make matters worse...ever since the Conflict, shadows creep in the night. Unnatural things bubble from the underground. People hear whispers..."



//Overriding event containers to remove random events.
/datum/event_container/mundane
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars1",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Appendecitis",/datum/event/spontaneous_appendicitis,5),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "MeteorLight",/datum/event/meteor_wave,10),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Infestation",/datum/event/infestation,100)
		)

/datum/event_container/moderate
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "MeteorMedium",/datum/event/meteor_wave,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars2",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars3",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "InvasionMedium",/datum/event/invasion,25)
	)

/datum/event_container/major
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "MeteorHeavy",/datum/event/meteor_wave,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars2",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars3",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars4",/datum/event/mortar,100)
	)
