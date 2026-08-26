# Song: Celebrawl - Stop
tag @e[type=minecraft:item_display,tag=nbs_Celebrawl] remove nbs_Celebrawl
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_Celebrawl 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_Celebrawl_t -1
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] nbs_Celebrawl 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] nbs_Celebrawl_t -1

scoreboard players set #radio nbs_Celebrawl 0
scoreboard players set #radio nbs_Celebrawl_t -1
scoreboard players set #radio_has_song worldradio.data 0
