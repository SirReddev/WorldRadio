# Song: Bat Cave - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_batcave] remove nbs_batcave
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_batcave
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_batcave_t

scoreboard players reset #radio nbs_batcave
scoreboard players reset #radio nbs_batcave_t
scoreboard players set #radio_has_song worldradio.data 0
