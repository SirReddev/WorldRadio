# Song: Celebrawl - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_Celebrawl] run scoreboard players operation @s nbs_Celebrawl += speed nbs_Celebrawl
scoreboard players operation #radio nbs_Celebrawl += speed nbs_Celebrawl

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_Celebrawl] at @s run function worldradio:songs/celebrawl/tree/0_2047

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_Celebrawl,limit=1] run scoreboard players operation #radio nbs_Celebrawl_t = @s nbs_Celebrawl_t

execute store result score #has_tag worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_Celebrawl,limit=1]
execute if score #has_tag worldradio.data matches 0 run scoreboard players set #radio_has_song worldradio.data 0
