# WorldRadio - Internal Stop Playback (Silent)
scoreboard players set #state worldradio.data 0
function worldradio:radio/songs/stop_song
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/playing/stop
function worldradio:radio/internal/clear_display
