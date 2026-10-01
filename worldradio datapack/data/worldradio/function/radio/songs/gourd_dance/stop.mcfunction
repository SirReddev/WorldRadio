# Song: Gourd Dance - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_gourddance] remove nbs_gourddance
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_gourddance
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_gourddance_t

scoreboard players reset #radio nbs_gourddance
scoreboard players reset #radio nbs_gourddance_t
scoreboard players set #radio_has_song worldradio.data 0
