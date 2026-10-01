# Song: Gourd Dance - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_gourddance,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_gourddance += speed nbs_gourddance
scoreboard players operation #radio nbs_gourddance += speed nbs_gourddance

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_gourddance,tag=!worldradio.local_zone] at @s run function worldradio:songs/gourd_dance/tree/0_4095

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_gourddance,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_gourddance_t = @s nbs_gourddance_t

execute if score #radio nbs_gourddance matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0
