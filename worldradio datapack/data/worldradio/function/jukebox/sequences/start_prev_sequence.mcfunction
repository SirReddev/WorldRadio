# WorldRadio - Start Previous Sequence (Simultaneous Button + Stopping Animation)
tag @s add worldradio.busy
tag @s remove worldradio.direction_next
tag @s remove worldradio.direction_stop
tag @s add worldradio.direction_prev
tag @s remove worldradio.state_stopping
tag @s remove worldradio.state_switch
tag @s remove worldradio.state_start
tag @s remove worldradio.music_started
tag @s remove worldradio.music_stopped
tag @s add worldradio.state_stopping

function aj:worldradio_jukebox/animations/playing/stop
function aj:worldradio_jukebox/animations/switch/stop
function aj:worldradio_jukebox/animations/start/stop
function aj:worldradio_jukebox/animations/stop/stop
function aj:worldradio_jukebox/animations/previous/play
function aj:worldradio_jukebox/animations/stopping/play
