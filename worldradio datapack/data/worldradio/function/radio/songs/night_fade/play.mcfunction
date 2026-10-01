# Song: Night Fade - Play
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] add nbs_nightfade
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_nightfade 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_nightfade_t -1

scoreboard players set #radio nbs_nightfade 0
scoreboard players set #radio nbs_nightfade_t -1
scoreboard players set #radio_has_song worldradio.data 1
