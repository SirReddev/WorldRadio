# WorldRadio - Update Boombox Text Display
execute if score #current_song worldradio.data matches 1 as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value '{"text":"Now Playing:\n,"color":"green"},{"text":"Steam Gardens","color":"dark_green","bold":true}","color":"white","alignment":"center"}'
execute if score #current_song worldradio.data matches 2 as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value '{"text":"Now Playing:\nCelebrawl","color":"white","alignment":"center"}'
