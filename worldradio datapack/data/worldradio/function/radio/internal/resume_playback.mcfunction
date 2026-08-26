# WorldRadio - Resume Playback
scoreboard players set #state worldradio.data 1
function worldradio:radio/songs/resume_song
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/playing/resume
function worldradio:radio/songs/update_display
function worldradio:radio/songs/announce_song
