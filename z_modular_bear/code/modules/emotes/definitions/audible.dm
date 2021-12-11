/decl/emote/audible/weh
	key ="weh"
	emote_message_3p = "USER lets out a 'weh'."
	emote_sound = 'sound/voice/weh.ogg'

/mob/living/carbon/human/verb/weh()
	set name = "Weh"
	set category = "Emotes"

	emote("weh",1)


/decl/emote/audible/bark
	key ="bark"
	emote_message_3p = "USER barks."
	emote_sound = 'sound/voice/bark2.ogg'

/mob/living/carbon/human/verb/bark()
	set name = "Bark"
	set category = "Emotes"

	emote("bark",1)

