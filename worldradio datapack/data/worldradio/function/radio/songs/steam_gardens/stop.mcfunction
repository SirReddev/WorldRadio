# Song: Steam Gardens - Stop
tag @e[type=minecraft:item_display,tag=nbs_steamgarde] remove nbs_steamgarde
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_steamgarde 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] nbs_steamgarde_t -1
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] nbs_steamgarde 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root] nbs_steamgarde_t -1

scoreboard players set #radio nbs_steamgarde 0
scoreboard players set #radio nbs_steamgarde_t -1
scoreboard players set #radio_has_song worldradio.data 0