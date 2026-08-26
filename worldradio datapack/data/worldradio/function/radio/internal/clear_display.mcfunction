# WorldRadio - Clear Boombox Text Display (Empty Title)
execute as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display] run data modify entity @s alignment set value "center"
execute as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display] run data modify entity @s line_width set value 200
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=!worldradio.local_zone] at @s as @e[type=minecraft:text_display,tag=aj.worldradio_boombox.text_display,distance=..1] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"",color:"dark_green"}]}
