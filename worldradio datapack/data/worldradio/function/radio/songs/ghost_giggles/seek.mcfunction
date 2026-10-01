# Song: Ghost Giggles - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed nbs_ghostgiggl
scoreboard players operation #radio nbs_ghostgiggl += #seek_delta worldradio.data

execute if score #radio nbs_ghostgiggl matches ..-1 run scoreboard players set #radio nbs_ghostgiggl 0
execute if score #radio nbs_ghostgiggl matches 0 run scoreboard players set #radio nbs_ghostgiggl_t -1

execute if score #radio nbs_ghostgiggl matches 1.. run scoreboard players operation #temp worldradio.data = #radio nbs_ghostgiggl
execute if score #radio nbs_ghostgiggl matches 1.. run scoreboard players operation #temp worldradio.data /= speed nbs_ghostgiggl
execute if score #radio nbs_ghostgiggl matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio nbs_ghostgiggl matches 1.. run scoreboard players operation #radio nbs_ghostgiggl_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_ghostgiggl = #radio nbs_ghostgiggl
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_ghostgiggl_t = #radio nbs_ghostgiggl_t
