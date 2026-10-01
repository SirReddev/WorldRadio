# Song: Midnight Mystery - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_midnightmy
scoreboard players operation #radio nbs_midnightmy += #seek_delta worldradio.data

execute if score #radio nbs_midnightmy matches ..-1 run scoreboard players set #radio nbs_midnightmy 0
execute if score #radio nbs_midnightmy matches 0 run scoreboard players set #radio nbs_midnightmy_t -1

execute if score #radio nbs_midnightmy matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_midnightmy
execute if score #radio nbs_midnightmy matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_midnightmy
execute if score #radio nbs_midnightmy matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_midnightmy matches 1.. run scoreboard players operation #radio nbs_midnightmy_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_midnightmy = #radio nbs_midnightmy
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_midnightmy_t = #radio nbs_midnightmy_t
