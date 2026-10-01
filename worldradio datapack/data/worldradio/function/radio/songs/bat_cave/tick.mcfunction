# Song: Bat Cave - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_batcave,tag=!worldradio.local_zone] run scoreboard players operation @s nbs_batcave += speed nbs_batcave
scoreboard players operation #radio nbs_batcave += speed nbs_batcave

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_batcave,tag=!worldradio.local_zone] at @s run function worldradio:songs/bat_cave/tree/0_2047

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=nbs_batcave,tag=!worldradio.local_zone,limit=1] run scoreboard players operation #radio nbs_batcave_t = @s nbs_batcave_t

execute if score #radio nbs_batcave matches 341760.. run scoreboard players set #radio_has_song worldradio.data 0
