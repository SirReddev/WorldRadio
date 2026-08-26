# WorldRadio - Jukebox Animation Sequence State Machine

# 1. Next/Prev/Stop: Stop old song 2 seconds into stopping animation (frame 40 of 60)
execute if entity @s[tag=worldradio.state_stopping,tag=!worldradio.music_stopped] if score @s aj.stopping.frame matches 40.. run function worldradio:jukebox/sequences/halt_and_switch_song

# 2. Stopping animation finished:
# If this was a Stop action (direction_stop), finish and rest in stopped state
execute if entity @s[tag=worldradio.state_stopping,tag=worldradio.direction_stop,tag=!aj.worldradio_jukebox.animation.stopping.playing] run function worldradio:jukebox/sequences/finish_stop_sequence
# If this was Next/Prev (NOT direction_stop), immediately start switch disc animation
execute if entity @s[tag=worldradio.state_stopping,tag=!worldradio.direction_stop,tag=!aj.worldradio_jukebox.animation.stopping.playing] run function worldradio:jukebox/sequences/step_switch

# 3. Switch disc animation finished -> Immediately start Start (needle drop) animation
execute if entity @s[tag=worldradio.state_switch,tag=!aj.worldradio_jukebox.animation.switch.playing] run function worldradio:jukebox/sequences/step_start

# 4. Play/Next/Prev: Launch music 2 seconds before needle settles (frame 20 of 60)
execute if entity @s[tag=worldradio.state_start,tag=!worldradio.music_started] if score @s aj.start.frame matches 20.. run function worldradio:jukebox/sequences/launch_music

# 5. Start (needle drop) finished -> Immediately finish sequence and loop playing animation!
execute if entity @s[tag=worldradio.state_start,tag=!aj.worldradio_jukebox.animation.start.playing] run function worldradio:jukebox/sequences/finish_sequence
