# Song: Midnight Mystery - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone,tag=nbs_midnightmy] remove nbs_midnightmy
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_midnightmy
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_midnightmy_t

scoreboard players reset #radio nbs_midnightmy
scoreboard players reset #radio nbs_midnightmy_t
scoreboard players set #radio_has_song worldradio.data 0
