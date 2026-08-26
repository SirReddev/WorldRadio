# WorldRadio - Increase Radius by 5
scoreboard players add #jukebox_radius worldradio.data 5
execute if score #jukebox_radius worldradio.data matches 201.. run scoreboard players set #jukebox_radius worldradio.data 200
execute store result storage worldradio:settings radius int 1 run scoreboard players get #jukebox_radius worldradio.data
tellraw @a [{"text":"[WorldRadio] ","color":"green","bold":true},{"text":"Jukebox Zone Radius: ","color":"gray"},{"score":{"name":"#jukebox_radius","objective":"worldradio.data"},"color":"gold","bold":true},{"text":" blocks","color":"gray"}]
dialog show @s worldradio:radius
