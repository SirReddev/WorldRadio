# Song: Bat Cave - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_batcave
scoreboard players operation #radio nbs_batcave += #seek_delta worldradio.data

execute if score #radio nbs_batcave matches ..-1 run scoreboard players set #radio nbs_batcave 0
execute if score #radio nbs_batcave matches 0 run scoreboard players set #radio nbs_batcave_t -1

execute if score #radio nbs_batcave matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_batcave
execute if score #radio nbs_batcave matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_batcave
execute if score #radio nbs_batcave matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_batcave matches 1.. run scoreboard players operation #radio nbs_batcave_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_batcave = #radio nbs_batcave
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_batcave_t = #radio nbs_batcave_t
