# Song: Ghost Giggles - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_ghostgiggl] remove nbs_ghostgiggl
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_ghostgiggl
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_ghostgiggl_t

scoreboard players reset #radio nbs_ghostgiggl
scoreboard players reset #radio nbs_ghostgiggl_t
scoreboard players set #radio_has_song worldradio.data 0
