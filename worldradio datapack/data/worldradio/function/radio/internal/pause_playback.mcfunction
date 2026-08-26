# WorldRadio - Internal Pause Playback
scoreboard players set #state worldradio.data 2
function worldradio:radio/songs/pause_song
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run function aj:worldradio_boombox/animations/playing/pause
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Paused playback.","color":"yellow"}]
