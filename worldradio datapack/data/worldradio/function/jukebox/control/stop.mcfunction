# WorldRadio - Stop Playback on All Active Jukebox Zones
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_stop_sequence
tellraw @a [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Stopped playback on Jukebox Zones.","color":"red"}]
