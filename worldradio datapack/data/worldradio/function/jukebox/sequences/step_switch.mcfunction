# WorldRadio - Transition to Switch Animation
# Fallback: ensure old song was stopped if stopping animation ended before frame 40
execute if entity @s[tag=!worldradio.music_stopped] run function worldradio:jukebox/sequences/halt_and_switch_song

tag @s remove worldradio.state_stopping
tag @s add worldradio.state_switch
function aj:worldradio_jukebox/animations/switch/play
