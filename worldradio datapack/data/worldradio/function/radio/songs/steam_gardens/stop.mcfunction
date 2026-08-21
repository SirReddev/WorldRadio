# Song: Steam Gardens - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove nbs_steamgarde
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_steamgarde
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_steamgarde_t

scoreboard players reset #radio nbs_steamgarde
scoreboard players reset #radio nbs_steamgarde_t
scoreboard players set #radio_has_song worldradio.data 0