# Song: Night Fade - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_nightfade] remove nbs_nightfade
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_nightfade
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_nightfade_t

scoreboard players reset #radio nbs_nightfade
scoreboard players reset #radio nbs_nightfade_t
scoreboard players set #radio_has_song worldradio.data 0
