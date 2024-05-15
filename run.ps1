$Action = $args[0]

switch ($Action) {
  "60hz" { C:\rtss-cli.exe limit:set 60 }
  "120hz" { C:\rtss-cli.exe limit:set 120 }
  "steam" {
    Start-Process C:\"Program Files (x86)"\Steam\steam.exe
    C:\nircmd.exe win close title "Steam Big Picture Mode"
  }
  "tv_mode" {
    DisplaySwitch 4
    Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_on.bat
    C:\rtss-cli.exe limit:set 120
  }
  "monitor_mode" {
    DisplaySwitch 1
    Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_off.bat
    C:\rtss-cli.exe limit:set 60
  }
  "turn_pc_off" {
    shutdown /s /t 0
  }
  "toggle_capframe" {
    Stop-Process -name "CapFrameX" -ErrorAction SilentlyContinue
    Start-Process "C:\Program Files (x86)\CapFrameX\CapFrameX.exe"
    Start-Sleep -Seconds 3
    Start-Process C:\Users\ivank\Documents\Scripts\f1.exe
  }
  "steam_big_picture" {
    Start-Process C:\"Program Files (x86)"\Steam\steam.exe
    Start-Process "steam://open/bigpicture"
  }
  "playnite" {
    Start-Process C:\Users\ivank\AppData\Local\Playnite\Playnite.DesktopApp.exe
  }
  "playnite_fs" {
    Start-Process -FilePath "C:\Users\ivank\AppData\Local\Playnite\Playnite.DesktopApp.exe" -ArgumentList "--startfullscreen"
  }
}

Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false
