# WorldRadio - Clear Boombox Text Display (Empty Title)
execute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s alignment set value "center"
execute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s line_width set value 200
execute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"",color:"dark_green"}]}
