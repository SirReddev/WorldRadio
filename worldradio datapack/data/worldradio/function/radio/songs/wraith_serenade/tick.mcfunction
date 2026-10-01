# Song: Wraith Serenade - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_wraithsere,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_wraithsere += speed nbs_wraithsere
scoreboard players operation #radio nbs_wraithsere += speed nbs_wraithsere

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_wraithsere,tag=!worldradio.local_zone] at @s run function worldradio:songs/wraith_serenade/tree/0_2047

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_wraithsere,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_wraithsere_t = @s nbs_wraithsere_t

execute if score #radio nbs_wraithsere matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0
