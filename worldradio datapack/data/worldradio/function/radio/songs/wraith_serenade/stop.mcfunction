# Song: Wraith Serenade - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_wraithsere] remove nbs_wraithsere
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_wraithsere
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_wraithsere_t

scoreboard players reset #radio nbs_wraithsere
scoreboard players reset #radio nbs_wraithsere_t
scoreboard players set #radio_has_song worldradio.data 0
