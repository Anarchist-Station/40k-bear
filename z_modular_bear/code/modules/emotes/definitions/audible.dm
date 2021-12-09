/decl/emote/audible/weh
	key ="weh"
	emote_message_3p = "USER lets out a 'weh'."
	emote_sound = 'sound/voice/weh.ogg'

/mob/living/carbon/human/verb/weh()
	set name = "Weh"
	set category = "Emotes"

	emote("weh",1)