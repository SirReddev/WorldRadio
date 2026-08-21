# WorldRadio - Global Song Finish Check
execute if score #song worldradio.data matches 1 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,limit=1] if score @s nbs_steam_gardens_t matches 2470.. run function worldradio:radio/internal/on_song_finished
execute if score #song worldradio.data matches 2 as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,limit=1] if score @s nbs_Celebrawl_t matches 1311.. run function worldradio:radio/internal/on_song_finished
