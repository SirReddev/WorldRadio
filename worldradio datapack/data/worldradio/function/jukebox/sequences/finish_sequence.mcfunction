# WorldRadio - Complete Sequence & Transition to Looping Playing Animation
tag @s remove worldradio.busy
tag @s remove worldradio.state_start
tag @s remove worldradio.music_started
tag @s remove worldradio.seq_next
tag @s remove worldradio.seq_prev
tag @s remove worldradio.seq_play

# Start looping Playing animation
function aj:worldradio_jukebox/animations/playing/play

# Fallback: if music was not launched earlier, ensure local music starts now
execute if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/local/start_playback
