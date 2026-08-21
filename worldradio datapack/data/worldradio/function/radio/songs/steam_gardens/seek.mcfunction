# Song: Steam Gardens - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_steamgarde
scoreboard players operation #radio nbs_steamgarde += #seek_delta worldradio.data

execute if score #radio nbs_steamgarde matches ..-1 run scoreboard players set #radio nbs_steamgarde 0
execute if score #radio nbs_steamgarde matches 0 run scoreboard players set #radio nbs_steamgarde_t -1

execute if score #radio nbs_steamgarde matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_steamgarde
execute if score #radio nbs_steamgarde matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_steamgarde
execute if score #radio nbs_steamgarde matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_steamgarde matches 1.. run scoreboard players operation #radio nbs_steamgarde_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s nbs_steamgarde = #radio nbs_steamgarde
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s nbs_steamgarde_t = #radio nbs_steamgarde_t