# Song: Celebrawl - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_Celebrawl
scoreboard players operation #radio nbs_Celebrawl += #seek_delta worldradio.data

execute if score #radio nbs_Celebrawl matches ..-1 run scoreboard players set #radio nbs_Celebrawl 0
execute if score #radio nbs_Celebrawl matches 0 run scoreboard players set #radio nbs_Celebrawl_t -1

execute if score #radio nbs_Celebrawl matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_Celebrawl
execute if score #radio nbs_Celebrawl matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_Celebrawl
execute if score #radio nbs_Celebrawl matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_Celebrawl matches 1.. run scoreboard players operation #radio nbs_Celebrawl_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_Celebrawl = #radio nbs_Celebrawl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_Celebrawl_t = #radio nbs_Celebrawl_t
