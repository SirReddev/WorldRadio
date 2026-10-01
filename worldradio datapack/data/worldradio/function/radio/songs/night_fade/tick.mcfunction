# Song: Night Fade - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_nightfade,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_nightfade += speed nbs_nightfade
scoreboard players operation #radio nbs_nightfade += speed nbs_nightfade

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_nightfade,tag=!worldradio.local_zone] at @s run function worldradio:songs/night_fade/tree/0_4095

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_nightfade,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_nightfade_t = @s nbs_nightfade_t

execute if score #radio nbs_nightfade matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0
