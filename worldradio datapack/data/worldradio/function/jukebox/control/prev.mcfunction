# WorldRadio - Previous Track on All Playing Jukebox Zones
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_prev_sequence
tellraw @s [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Switched to previous song on playing Jukebox Zones.","color":"blue"}]
