/datum/map
	var/emergency_shuttle_called_message
	var/emergency_shuttle_called_sound

	var/command_report_sound

	var/electrical_storm_moderate_sound
	var/electrical_storm_major_sound

	var/grid_check_message = "Abnormal activity detected in the %STATION_NAME%'s power system. As a precaution, the %STATION_NAME%'s power must be shut down for an indefinite duration."
	var/grid_check_sound

	var/grid_restored_message = "Station power to the %STATION_NAME% will be restored at this time. We apologize for the inconvenience."
	var/grid_restored_sound

	var/	meteor_detected_message = "WEATHER UPDATE: MAJOR KEPLER-PREVENTION DE-ORBIT IN PROGRESS. ALL RESIDENTS OF %STATION_NAME% ARE ORDERED TO BRACE FOR IMPACT AT THIS TIME. STAY INDOORS AND AWAY FROM ALL EXTERIORS UNTIL THE ALL-CLEAR SIGNAL HAS PASSED.." //bear

	var/meteor_detected_sound

	var/radiation_detected_message = "WEATHER UPDATE: Fleet satelites are performing a scheduled high-power gamma-ray based surveillance of %STATION_NAME%. For your own safety, please head to your nearest underground shelter."
	var/radiation_detected_sound

	var/space_time_anomaly_sound

	var/unidentified_lifesigns_message = "Unidentified lifesigns detected coming aboard the %STATION_NAME%. Please lockdown all exterior access points, including ducting and ventilation."
	var/unidentified_lifesigns_sound

	var/unknown_biological_entities_message = "Unknown biological entities have been detected near the %STATION_NAME%, please stand-by."

	var/xenomorph_spawn_sound = 'sound/AI/aliens.ogg'

/datum/map/proc/emergency_shuttle_called_announcement()
	evacuation_controller.evac_called.Announce(replacetext(emergency_shuttle_called_message, "%ETA%", "[round(evacuation_controller.get_eta()/60)] minute\s."), new_sound = emergency_shuttle_called_sound)

/datum/map/proc/grid_check_announcement()
	command_announcement.Announce(replacetext(grid_check_message, "%STATION_NAME%", station_name()), "Automated Grid Check", new_sound = grid_check_sound)

/datum/map/proc/grid_restored_announcement()
	command_announcement.Announce(replacetext(grid_restored_message, "%STATION_NAME%", station_name()), "Power Systems Nominal", new_sound = grid_restored_sound)

/datum/map/proc/level_x_biohazard_announcement(var/bio_level)
	if(!isnum(bio_level))
		CRASH("Expected a number, was: [log_info_line(bio_level)]")
	if(bio_level < 1 || bio_level > 9)
		CRASH("Expected a number between 1 and 9, was: [log_info_line(bio_level)]")

	command_announcement.Announce("Confirmed outbreak of level [bio_level] biohazard aboard the [station_name()]. All personnel must contain the outbreak.", "Biohazard Alert", new_sound = level_x_biohazard_sound(bio_level))

/datum/map/proc/level_x_biohazard_sound(var/bio_level)
	return

/datum/map/proc/meteors_detected_announcement()
	command_announcement.Announce(replacetext(meteor_detected_message, "%STATION_NAME%", station_name()), "[station_name()] Sensor Array", new_sound = meteor_detected_sound)

/datum/map/proc/radiation_detected_announcement()
	command_announcement.Announce(replacetext(radiation_detected_message, "%STATION_NAME%", station_name()), "Anomaly Alert", new_sound = radiation_detected_sound)

/datum/map/proc/space_time_anomaly_detected_annoncement()
	command_announcement.Announce("Space-time anomalies have been detected on the [station_name()].", "Anomaly Alert", new_sound = space_time_anomaly_sound)

/datum/map/proc/unidentified_lifesigns_announcement()
	command_announcement.Announce(replacetext(unidentified_lifesigns_message, "%STATION_NAME%", station_name()), "Lifesign Alert", new_sound = unidentified_lifesigns_sound)

/datum/map/proc/unknown_biological_entities_announcement()
	command_announcement.Announce(replacetext(unknown_biological_entities_message, "%STATION_NAME%", station_name()), "Lifesign Alert", new_sound = command_report_sound)
