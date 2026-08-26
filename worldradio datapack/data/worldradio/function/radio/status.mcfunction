# WorldRadio - Print Status Summary
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

execute store result score #boombox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root]
execute store result score #jukebox_count worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_jukebox.root]

tellraw @a ["\n",{"text":"======== ","color":"dark_green"},{"text":"WorldRadio Status","color":"green","bold":true},{"text":" ========","color":"dark_green"}]

# Song info
execute if score #song worldradio.data matches 1 run tellraw @a [{"text":" Global Song: ","color":"gray"},{"text":"Steam Gardens","color":"gold","bold":true},{"text":" (1/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]
execute if score #song worldradio.data matches 2 run tellraw @a [{"text":" Global Song: ","color":"gray"},{"text":"Celebrawl","color":"gold","bold":true},{"text":" (2/","color":"dark_gray"},{"score":{"name":"#total_songs","objective":"worldradio.data"},"color":"dark_gray"},{"text":")","color":"dark_gray"}]

# State info
execute if score #state worldradio.data matches 0 run tellraw @a [{"text":" Global State: ","color":"gray"},{"text":"STOPPED","color":"red","bold":true}]
execute if score #state worldradio.data matches 1 run tellraw @a [{"text":" Global State: ","color":"gray"},{"text":"PLAYING","color":"green","bold":true}]
execute if score #state worldradio.data matches 2 run tellraw @a [{"text":" Global State: ","color":"gray"},{"text":"PAUSED","color":"yellow","bold":true}]

# Playlist mode info
execute if score #shuffle worldradio.data matches 0 run tellraw @a [{"text":" Global Auto-Play: ","color":"gray"},{"text":"Sequential","color":"aqua","bold":true}]
execute if score #shuffle worldradio.data matches 1 run tellraw @a [{"text":" Global Auto-Play: ","color":"gray"},{"text":"Shuffle (Random)","color":"gold","bold":true}]

execute if score #jukebox_shuffle worldradio.data matches 0 run tellraw @a [{"text":" Jukebox Auto-Play: ","color":"gray"},{"text":"Sequential","color":"aqua","bold":true}]
execute if score #jukebox_shuffle worldradio.data matches 1 run tellraw @a [{"text":" Jukebox Auto-Play: ","color":"gray"},{"text":"Shuffle (Random)","color":"gold","bold":true}]

# Jukebox Zone Radius info
tellraw @a [{"text":" Jukebox Zone Radius: ","color":"gray"},{"score":{"name":"#jukebox_radius","objective":"worldradio.data"},"color":"gold","bold":true},{"text":" blocks","color":"gray"}]

# Notification mode info
execute if score #announce_mode worldradio.data matches 0 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Both (Actionbar & Chat)","color":"aqua","bold":true}]
execute if score #announce_mode worldradio.data matches 1 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Actionbar Only","color":"gold","bold":true}]
execute if score #announce_mode worldradio.data matches 2 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"Chat Only","color":"yellow","bold":true}]
execute if score #announce_mode worldradio.data matches 3 run tellraw @a [{"text":" Notifications: ","color":"gray"},{"text":"None (Silent)","color":"red","bold":true}]

# Device counts
tellraw @a [{"text":" Active Boomboxes: ","color":"gray"},{"score":{"name":"#boombox_count","objective":"worldradio.data"},"color":"light_purple","bold":true}]
tellraw @a [{"text":" Active Jukeboxes: ","color":"gray"},{"score":{"name":"#jukebox_count","objective":"worldradio.data"},"color":"gold","bold":true}]
tellraw @a [{"text":"=================================","color":"dark_green"},"\n"]
