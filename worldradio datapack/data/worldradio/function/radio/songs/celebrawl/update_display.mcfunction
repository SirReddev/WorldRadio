# Song: Celebrawl - Update Boombox Display
execute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"Celebrawl",color:"dark_green"}]}
