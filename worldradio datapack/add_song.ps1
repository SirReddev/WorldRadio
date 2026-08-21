<#
.SYNOPSIS
    WorldRadio - Automated Song Importer & Registration Script
.DESCRIPTION
    Imports a NoteBlockStudio exported ZIP, folder, or existing song folder into the WorldRadio datapack,
    and automatically registers it in the playlist system.
.EXAMPLE
    .\add_song.ps1 "C:\Users\devus\Downloads\steam_gardens.zip" "Steam Gardens"
    .\add_song.ps1 steam_gardens "Steam Gardens"
#>

param (
    [Parameter(Mandatory = $true, Position = 0)]
    [string]$Source,

    [Parameter(Mandatory = $true, Position = 1)]
    [string]$SongTitle
)

$baseDir = $PSScriptRoot
$songsDir = "$baseDir\data\worldradio\function\songs"
$radioSongsDir = "$baseDir\data\worldradio\function\radio\songs"

if (-not (Test-Path $songsDir)) {
    New-Item -ItemType Directory -Path $songsDir -Force | Out-Null
}

$tempExtractDir = "$env:TEMP\worldradio_import_$(Get-Random)"
$sourceSongFolder = $null
$songFolderName = $null

# 1. Determine Source Type (ZIP file, Datapack folder, or song name)
$resolvedPath = $Source
if (-not (Test-Path $resolvedPath)) {
    # Check in Downloads
    $dlZip = "$HOME\Downloads\$Source.zip"
    $dlDir = "$HOME\Downloads\$Source"
    if (Test-Path $dlZip) {
        $resolvedPath = $dlZip
    } elseif (Test-Path $dlDir) {
        $resolvedPath = $dlDir
    }
}

if (Test-Path $resolvedPath) {
    $item = Get-Item $resolvedPath
    if ($item.PSIsContainer) {
        # Check if this folder contains data/*/function/songs/<song>
        $foundSongs = Get-ChildItem -Path "$resolvedPath" -Recurse -Directory | Where-Object {
            (Test-Path "$($_.FullName)\load.mcfunction") -and (Test-Path "$($_.FullName)\tick.mcfunction")
        }
        if ($foundSongs) {
            $sourceSongFolder = $foundSongs[0].FullName
            $songFolderName = $foundSongs[0].Name
        }
    } else {
        # It is a file (.zip)
        Write-Host "Extracting ZIP: $resolvedPath..." -ForegroundColor Cyan
        Expand-Archive -Path $resolvedPath -DestinationPath $tempExtractDir -Force
        $foundSongs = Get-ChildItem -Path $tempExtractDir -Recurse -Directory | Where-Object {
            (Test-Path "$($_.FullName)\load.mcfunction") -and (Test-Path "$($_.FullName)\tick.mcfunction")
        }
        if ($foundSongs) {
            $sourceSongFolder = $foundSongs[0].FullName
            $songFolderName = $foundSongs[0].Name
        }
    }
} elseif (Test-Path "$songsDir\$Source") {
    $sourceSongFolder = "$songsDir\$Source"
    $songFolderName = $Source
}

if (-not $sourceSongFolder -or -not (Test-Path "$sourceSongFolder\load.mcfunction")) {
    Write-Error "Could not find a valid NoteBlockStudio song (missing load.mcfunction) in '$Source'!"
    if (Test-Path $tempExtractDir) { Remove-Item $tempExtractDir -Recurse -Force }
    exit 1
}

# 2. Copy into datapack data/worldradio/function/songs/<song_name>
$destSongFolder = "$songsDir\$songFolderName"
if ($sourceSongFolder -ne $destSongFolder) {
    if (Test-Path $destSongFolder) {
        Remove-Item -Path $destSongFolder -Recurse -Force
    }
    Copy-Item -Path $sourceSongFolder -Destination $destSongFolder -Recurse -Force
    Write-Host "Copied song files to: $destSongFolder" -ForegroundColor Green

    # Sanitize note files (fix invalid NBS playsound IDs like minecraft:Fizz)
    $notesSubDir = "$destSongFolder\notes"
    if (Test-Path $notesSubDir) {
        Get-ChildItem -Path $notesSubDir -Filter "*.mcfunction" | ForEach-Object {
            $nContent = Get-Content $_.FullName -Raw
            if ($nContent -match 'minecraft:[^ ]*[A-Z]') {
                $nContent = $nContent -replace 'minecraft:Fizz', 'minecraft:block.fire.extinguish'
                $nContent = [regex]::Replace($nContent, 'playsound\s+minecraft:(\S+)', { param($m) "playsound minecraft:" + $m.Groups[1].Value.ToLower() })
                Set-Content -Path $_.FullName -Value $nContent -NoNewline
            }
        }
        Write-Host "Sanitized note files (fixed uppercase sound IDs)." -ForegroundColor Green
    }
}

# Clean up temp
if (Test-Path $tempExtractDir) {
    Remove-Item -Path $tempExtractDir -Recurse -Force
}

# 3. Detect NBS objective name from load.mcfunction
$loadPath = "$destSongFolder\load.mcfunction"
$loadContent = Get-Content $loadPath -Raw
if ($loadContent -match 'scoreboard objectives add (\S+?)_t dummy' -or $loadContent -match 'scoreboard objectives add (\S+?) dummy') {
    $objName = $matches[1]
} else {
    Write-Error "Could not detect NBS objective name in $loadPath!"
    exit 1
}

Write-Host "Detected NoteBlockStudio objective: $objName for '$SongTitle' ($songFolderName)" -ForegroundColor Cyan

# 4. Create Connector Files
$connectorDir = "$radioSongsDir\$songFolderName"
if (-not (Test-Path $connectorDir)) {
    New-Item -ItemType Directory -Path $connectorDir -Force | Out-Null
}

# Play
@"
# Song: $SongTitle - Play
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] add $objName
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] $objName 0
scoreboard players set @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] ${objName}_t -1

scoreboard players set #radio $objName 0
scoreboard players set #radio ${objName}_t -1
scoreboard players set #radio_has_song worldradio.data 1
"@ | Set-Content -Path "$connectorDir\play.mcfunction" -NoNewline

# Resume
@"
# Song: $SongTitle - Resume
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] add $objName
scoreboard players set #radio_has_song worldradio.data 1
"@ | Set-Content -Path "$connectorDir\resume.mcfunction" -NoNewline

# Pause
@"
# Song: $SongTitle - Pause
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove $objName
scoreboard players set #radio_has_song worldradio.data 0
"@ | Set-Content -Path "$connectorDir\pause.mcfunction" -NoNewline

# Stop
@"
# Song: $SongTitle - Stop
tag @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] remove $objName
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] $objName
scoreboard players reset @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] ${objName}_t

scoreboard players reset #radio $objName
scoreboard players reset #radio ${objName}_t
scoreboard players set #radio_has_song worldradio.data 0
"@ | Set-Content -Path "$connectorDir\stop.mcfunction" -NoNewline

# Tick
@"
# Song: $SongTitle - Tick
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=$objName] run scoreboard players operation @s $objName += speed $objName
scoreboard players operation #radio $objName += speed $objName

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=$objName] run function worldradio:songs/$songFolderName/tree/0_8191

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=$objName,limit=1] run scoreboard players operation #radio ${objName}_t = @s ${objName}_t

execute store result score #has_tag worldradio.data if entity @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root,tag=$objName,limit=1]
execute if score #has_tag worldradio.data matches 0 run scoreboard players set #radio_has_song worldradio.data 0
"@ | Set-Content -Path "$connectorDir\tick.mcfunction" -NoNewline

# Seek
@"
# Song: $SongTitle - Seek
scoreboard players operation #seek_delta worldradio.data = #seek_ticks worldradio.data
scoreboard players operation #seek_delta worldradio.data *= speed $objName
scoreboard players operation #radio $objName += #seek_delta worldradio.data

execute if score #radio $objName matches ..-1 run scoreboard players set #radio $objName 0
execute if score #radio $objName matches 0 run scoreboard players set #radio ${objName}_t -1

execute if score #radio $objName matches 1.. run scoreboard players operation #temp worldradio.data = #radio $objName
execute if score #radio $objName matches 1.. run scoreboard players operation #temp worldradio.data /= speed $objName
execute if score #radio $objName matches 1.. run scoreboard players remove #temp worldradio.data 1
execute if score #radio $objName matches 1.. run scoreboard players operation #radio ${objName}_t = #temp worldradio.data

execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s $objName = #radio $objName
execute as @e[type=minecraft:item_display,tag=aj.worldradio_boombox.root] run scoreboard players operation @s ${objName}_t = #radio ${objName}_t
"@ | Set-Content -Path "$connectorDir\seek.mcfunction" -NoNewline

# Update Display
@"
# Song: $SongTitle - Update Boombox Display
execute as @e[type=minecraft:text_display,tag=boombox] run data modify entity @s text set value {text:"",extra:[{text:"Playing: ",color:"green"},{text:"$SongTitle",color:"dark_green"}]}
"@ | Set-Content -Path "$connectorDir\update_display.mcfunction" -NoNewline

Write-Host "Created connector files in $connectorDir" -ForegroundColor Green

# 5. Rebuild registry and dispatchers for all registered songs
$registeredSongs = Get-ChildItem -Path $radioSongsDir -Directory | Where-Object { $_.Name -ne "TEMPLATE" } | Sort-Object Name
$total = $registeredSongs.Count

# Rebuild Registry
$registryLines = @(
    "# WorldRadio - Song Registry",
    "scoreboard players set #total_songs worldradio.data $total",
    ""
)
foreach ($s in $registeredSongs) {
    $registryLines += "function worldradio:songs/$($s.Name)/load"
}
$registryLines -join "`n" | Set-Content -Path "$radioSongsDir\registry.mcfunction" -NoNewline

# Helper to build dispatcher
function Build-Dispatcher ($name, $funcName) {
    $lines = @("# WorldRadio - $name Dispatcher")
    $id = 1
    foreach ($s in $registeredSongs) {
        $lines += "execute if score #song worldradio.data matches $id run function worldradio:radio/songs/$($s.Name)/$funcName"
        $id++
    }
    $lines -join "`n" | Set-Content -Path "$radioSongsDir\$name.mcfunction" -NoNewline
}

Build-Dispatcher "play_song" "play"
Build-Dispatcher "resume_song" "resume"
Build-Dispatcher "pause_song" "pause"
Build-Dispatcher "stop_song" "stop"
Build-Dispatcher "tick_song" "tick"
Build-Dispatcher "seek_song" "seek"
Build-Dispatcher "update_display" "update_display"

# Announce song
$announceLines = @("# WorldRadio - Announce Song")
$id = 1
foreach ($s in $registeredSongs) {
    $title = $SongTitle
    $dispPath = "$radioSongsDir\$($s.Name)\update_display.mcfunction"
    if (Test-Path $dispPath) {
        $dispContent = Get-Content $dispPath -Raw
        if ($dispContent -match '\{text:"([^"]+)",color:"dark_green"\}') {
            $title = $matches[1]
        }
    }
    $announceLines += "execute if score #song worldradio.data matches $id run title @a actionbar [{`"text`":`"Now Playing: `" ,`"color`":`"green`"},{`"text`":`"$title`",`"color`":`"dark_green`",`"bold`":true}]"
    $announceLines += "execute if score #song worldradio.data matches $id run tellraw @a [{`"text`":`"[WorldRadio] `",`"color`":`"green`",`"bold`":true},{`"text`":`"Now Playing: `",`"color`":`"gray`"},{`"text`":`"$title`",`"color`":`"dark_green`",`"bold`":true}]"
    $id++
}
$announceLines -join "`n" | Set-Content -Path "$radioSongsDir\announce_song.mcfunction" -NoNewline

Write-Host "========================================================" -ForegroundColor Green
Write-Host " Successfully imported & registered '$SongTitle' ($songFolderName)!" -ForegroundColor Green
Write-Host " Total songs in WorldRadio playlist: $total" -ForegroundColor Green
Write-Host "========================================================" -ForegroundColor Green
