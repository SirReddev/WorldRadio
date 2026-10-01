# Song: Creaking Tree - Play
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] add nbs_creakingtr
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_creakingtr 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] nbs_creakingtr_t -1

scoreboard players set #radio nbs_creakingtr 0
scoreboard players set #radio nbs_creakingtr_t -1
scoreboard players set #radio_has_song worldradio.data 1
