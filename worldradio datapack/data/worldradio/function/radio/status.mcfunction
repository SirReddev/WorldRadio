# WorldRadio - Print Status Summary
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute store result score #boombox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root]
execute store result score #jukebox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root]

tellraw @a ["\n",{"text":"======== ","color":"dark_green"},{"text":"WorldRadio Status","color":"green","bold":true},{"text":" ========","color":"dark_green"}]

execute if score #song worldradio.data matches 1 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Bat Cave","color":"gold","bold":true},{"text":" (1/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 2 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Celebrawl","color":"gold","bold":true},{"text":" (2/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 3 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Creaking Tree","color":"gold","bold":true},{"text":" (3/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 4 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Ghost Giggles","color":"gold","bold":true},{"text":" (4/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 5 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Gourd Dance","color":"gold","bold":true},{"text":" (5/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 6 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Midnight Mystery","color":"gold","bold":true},{"text":" (6/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 7 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Night Fade","color":"gold","bold":true},{"text":" (7/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 8 run tellraw @a [{"text":" Current Song: ","color":"gray"},{"text":"Wraith Serenade","color":"gold","bold":true},{"text":" (8/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]

# State info
execute if score #state worldradio.data matches 0 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"STOPPED","color":"red","bold":true}]
execute if score #state worldradio.data matches 1 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"PLAYING","color":"green","bold":true}]
execute if score #state worldradio.data matches 2 run tellraw @a [{"text":" Playback State: ","color":"gray"},{"text":"PAUSED","color":"yellow","bold":true}]

# Shuffle mode info
execute if score #shuffle worldradio.data matches 0 run tellraw @a [{"text":" Playlist Mode: ","color":"gray"},{"text":"Sequential","color":"aqua","bold":true}]
execute if score #shuffle worldradio.data matches 1 run tellraw @a [{"text":" Playlist Mode: ","color":"gray"},{"text":"Shuffle","color":"gold","bold":true}]

# Jukebox scope info
execute if score #jukebox_mode worldradio.data matches 0 run tellraw @a [{"text":" Jukebox Scope: ","color":"gray"},{"text":"Global (All Boomboxes)","color":"aqua","bold":true}]
execute if score #jukebox_mode worldradio.data matches 1 run tellraw @a [{"text":" Jukebox Scope: ","color":"gray"},{"text":"Local (Zone Only)","color":"gold","bold":true}]

# Notification mode info
execute if score #announce_mode worldradio.data matches 0 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Both (Actionbar & Chat)","color":"aqua","bold":true}]
execute if score #announce_mode worldradio.data matches 1 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Actionbar Only","color":"gold","bold":true}]
execute if score #announce_mode worldradio.data matches 2 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Chat Only","color":"yellow","bold":true}]
execute if score #announce_mode worldradio.data matches 3 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"None (Silent)","color":"red","bold":true}]
tellraw @a [{"text":" Jukebox Zone Radius: ","color":"gray"},{"score":{"name":"#jukebox_radius","objective":"worldradio.data"},"color":"gold","bold":true},{"text":" blocks","color":"gray"}]

# Device counts
tellraw @a [{"text":" Active Boomboxes: ","color":"gray"},{"score":{"name":"#boombox_count","objective":"worldradio.data"},"color":"light_purple","bold":true}]
tellraw @a [{"text":" Active Jukeboxes: ","color":"gray"},{"score":{"name":"#jukebox_count","objective":"worldradio.data"},"color":"gold","bold":true}]
tellraw @a [{"text":"=================================","color":"dark_green"},"\n"]
