# WorldRadio - Print Status Summary
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute store result score #boombox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root]

tellraw @a ["\n",{"text":"======== ","color":"dark_green"},{"text":"WorldRadio Status","color":"green","bold":true},{"text":" ========","color":"dark_green"}]

# Song info
execute if score #song worldradio.data matches 1 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Steam Gardens","color":"gold","bold":true},{"text":" (1/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]

# State info
execute if score #state worldradio.data matches 0 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"STOPPED","color":"red","bold":true}]
execute if score #state worldradio.data matches 1 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"PLAYING","color":"green","bold":true}]
execute if score #state worldradio.data matches 2 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"PAUSED","color":"yellow","bold":true}]

# Shuffle mode info
execute if score #shuffle worldradio.data matches 0 run tellraw @a [{"text":" Playlist Mode: ","color":"gray"},{"text":"Sequential","color":"aqua","bold":true}]
execute if score #shuffle worldradio.data matches 1 run tellraw @a [{"text":" Playlist Mode: ","color":"gray"},{"text":"Shuffle","color":"gold","bold":true}]

# Boombox counts
tellraw @a [{"text":" Active Boomboxes: ","color":"gray"},{"score":{"name":"#boombox_count","objective":"worldradio.data"},"color":"light_purple","bold":true}]
tellraw @a [{"text":"=================================","color":"dark_green"},"\n"]
