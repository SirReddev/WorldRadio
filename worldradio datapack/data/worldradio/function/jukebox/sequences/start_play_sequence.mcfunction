# WorldRadio - Start Play Sequence (Simultaneous Button + Start Animation)
tag @s add worldradio.busy
tag @s remove worldradio.state_stopping
tag @s remove worldradio.state_switch
tag @s remove worldradio.state_start
tag @s remove worldradio.music_started
tag @s remove worldradio.music_stopped
tag @s add worldradio.state_start

function aj:worldradio_jukebox/animations/playing/stop
function aj:worldradio_jukebox/animations/stopping/stop
function aj:worldradio_jukebox/animations/switch/stop
function aj:worldradio_jukebox/animations/stop/stop
function aj:worldradio_jukebox/animations/play/play
function aj:worldradio_jukebox/animations/start/play
