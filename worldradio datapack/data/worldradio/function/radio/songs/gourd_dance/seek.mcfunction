# Song: Gourd Dance - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_gourddance
scoreboard players operation #radio nbs_gourddance += #seek_delta worldradio.data

execute if score #radio nbs_gourddance matches ..-1 run scoreboard players set #radio nbs_gourddance 0
execute if score #radio nbs_gourddance matches 0 run scoreboard players set #radio nbs_gourddance_t -1

execute if score #radio nbs_gourddance matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_gourddance
execute if score #radio nbs_gourddance matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_gourddance
execute if score #radio nbs_gourddance matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_gourddance matches 1.. run scoreboard players operation #radio nbs_gourddance_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_gourddance = #radio nbs_gourddance
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_gourddance_t = #radio nbs_gourddance_t
