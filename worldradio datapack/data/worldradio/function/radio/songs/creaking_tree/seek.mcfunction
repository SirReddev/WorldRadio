# Song: Creaking Tree - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_creakingtr
scoreboard players operation #radio nbs_creakingtr += #seek_delta worldradio.data

execute if score #radio nbs_creakingtr matches ..-1 run scoreboard players set #radio nbs_creakingtr 0
execute if score #radio nbs_creakingtr matches 0 run scoreboard players set #radio nbs_creakingtr_t -1

execute if score #radio nbs_creakingtr matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_creakingtr
execute if score #radio nbs_creakingtr matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_creakingtr
execute if score #radio nbs_creakingtr matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_creakingtr matches 1.. run scoreboard players operation #radio nbs_creakingtr_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_creakingtr = #radio nbs_creakingtr
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_creakingtr_t = #radio nbs_creakingtr_t
