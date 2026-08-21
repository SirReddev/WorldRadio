# WorldRadio - Shuffle Song
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run tellraw @s [{"text":"[WorldRadio] ","color":"red","bold":true},{"text":"You need the ","color":"gray"},{"text":"WorldRadioDJ","color":"gold","bold":true},{"text":" tag to use this command.","color":"gray"}]
execute as @s[type=minecraft:player,tag=!WorldRadioDJ] run return 0

# Pick a random song from 1..#total_songs
execute store result score #rand worldradio.data run random value 0..2147483647
scoreboard players operation #rand worldradio.data %= #total_songs worldradio.data
scoreboard players add #rand worldradio.data 1

# If the randomizer picks the same song that's currently playing, advance to next sequential song
execute if score #rand worldradio.data = #song worldradio.data run scoreboard players add #rand worldradio.data 1
execute if score #rand worldradio.data > #total_songs worldradio.data run scoreboard players set #rand worldradio.data 1

# Set active song and play
scoreboard players operation #song worldradio.data = #rand worldradio.data
function worldradio:radio/internal/switch_and_play
