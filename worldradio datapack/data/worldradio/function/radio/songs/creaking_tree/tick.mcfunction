# Song: Creaking Tree - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_creakingtr,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_creakingtr += speed nbs_creakingtr
scoreboard players operation #radio nbs_creakingtr += speed nbs_creakingtr

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_creakingtr,tag=!worldradio.local_zone] at @s run function worldradio:songs/creaking_tree/tree/0_2047

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_creakingtr,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_creakingtr_t = @s nbs_creakingtr_t

execute if score #radio nbs_creakingtr matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0
