# Song: Wraith Serenade - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_wraithsere
scoreboard players operation #radio nbs_wraithsere += #seek_delta worldradio.data

execute if score #radio nbs_wraithsere matches ..-1 run scoreboard players set #radio nbs_wraithsere 0
execute if score #radio nbs_wraithsere matches 0 run scoreboard players set #radio nbs_wraithsere_t -1

execute if score #radio nbs_wraithsere matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_wraithsere
execute if score #radio nbs_wraithsere matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_wraithsere
execute if score #radio nbs_wraithsere matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_wraithsere matches 1.. run scoreboard players operation #radio nbs_wraithsere_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_wraithsere = #radio nbs_wraithsere
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_wraithsere_t = #radio nbs_wraithsere_t
