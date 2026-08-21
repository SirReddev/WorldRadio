# Song: Celebrawl - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_Celebrawl
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_Celebrawl_t

scoreboard players reset #radio nbs_Celebrawl
scoreboard players reset #radio nbs_Celebrawl_t
scoreboard players set #radio_has_song worldradio.data 0
