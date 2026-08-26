# WorldRadio - Start Playback on All Stopped Jukebox Zones
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/sequences/start_play_sequence
tellraw @a [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Started playback on Jukebox Zones.","color":"green"}]
