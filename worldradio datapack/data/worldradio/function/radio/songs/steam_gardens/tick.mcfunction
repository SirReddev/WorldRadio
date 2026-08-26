# Song: Steam Gardens - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_steamgarde += speed nbs_steamgarde
scoreboard players operation #radio nbs_steamgarde += speed nbs_steamgarde

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_steamgarde,tag=!worldradio.local_zone] at @s run function worldradio:songs/steam_gardens/tree/0_8191

execute as @e[type=minecraft:item_display,tag=nbs_steamgarde,limit=1] run scoreboard players operation #radio nbs_steamgarde_t = @s nbs_steamgarde_t

# Natural finish when end of song is reached
execute if score #radio nbs_steamgarde matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0