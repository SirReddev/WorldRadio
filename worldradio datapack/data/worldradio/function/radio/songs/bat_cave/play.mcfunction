# Song: Bat Cave - Play
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] add nbs_batcave
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_batcave 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_batcave_t -1

scoreboard players set #radio nbs_batcave 0
scoreboard players set #radio nbs_batcave_t -1
scoreboard players set #radio_has_song worldradio.data 1
