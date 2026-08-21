# WorldRadio - Handle Song Natural Finish
execute if score #shuffle worldradio.data matches 1 run function worldradio:radio/shuffle
execute if score #shuffle worldradio.data matches 0 run function worldradio:radio/next
