# WorldRadio - Next Track on All Jukebox Zones
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 1 run function worldradio:jukebox/sequences/start_next_sequence

execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 0 run scoreboard players add @s worldradio.jb_song 1
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 0 if score @s worldradio.jb_song > #total_songs worldradio.data run scoreboard players set @s worldradio.jb_song 1
execute as @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] if score @s worldradio.jb_state matches 0 run function worldradio:jukebox/sequences/start_play_sequence

tellraw @a [{"text":"[WorldRadio] ","color":"gold","bold":true},{"text":"Switched to next song on Jukebox Zones.","color":"aqua"}]
