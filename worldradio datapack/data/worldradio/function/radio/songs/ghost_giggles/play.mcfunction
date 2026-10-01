# Song: Ghost Giggles - Play
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] add nbs_ghostgiggl
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_ghostgiggl 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_ghostgiggl_t -1

scoreboard players set #radio nbs_ghostgiggl 0
scoreboard players set #radio nbs_ghostgiggl_t -1
scoreboard players set #radio_has_song worldradio.data 1
