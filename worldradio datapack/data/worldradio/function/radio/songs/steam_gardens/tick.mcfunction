# Song: Steam Gardens - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde] run scoreboard players operation @s nbs_steamgarde += speed nbs_steamgarde
scoreboard players operation #radio nbs_steamgarde += speed nbs_steamgarde

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde] run function worldradio:songs/steam_gardens/tree/0_8191

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde,limit=1] run scoreboard players operation #radio nbs_steamgarde_t = @s nbs_steamgarde_t

execute store result score #has_tag worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde,limit=1]
execute if score #has_tag worldradio.data matches 0 run scoreboard players set #radio_has_song worldradio.data 0