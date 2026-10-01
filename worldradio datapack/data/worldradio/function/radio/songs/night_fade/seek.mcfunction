# Song: Night Fade - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_nightfade
scoreboard players operation #radio nbs_nightfade += #seek_delta worldradio.data

execute if score #radio nbs_nightfade matches ..-1 run scoreboard players set #radio nbs_nightfade 0
execute if score #radio nbs_nightfade matches 0 run scoreboard players set #radio nbs_nightfade_t -1

execute if score #radio nbs_nightfade matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_nightfade
execute if score #radio nbs_nightfade matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_nightfade
execute if score #radio nbs_nightfade matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_nightfade matches 1.. run scoreboard players operation #radio nbs_nightfade_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_nightfade = #radio nbs_nightfade
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_nightfade_t = #radio nbs_nightfade_t
