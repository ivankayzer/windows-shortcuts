$Action = $args[0]

Function Run {
  param($action)

  Function FPS {
    param($fps)
    C:\rtss-cli.exe limit:set $fps
  }

  Function Resolution4k {
    param($index)
    C:\ChangeScreenResolution.exe /w=3840 /h=2160 /d=$index
  }

  Function Resolution800p {
    C:\ChangeScreenResolution.exe /w=1920 /h=1200 /d=0
  }

  switch ($action) {
    "60hz" { FPS "60" }
    "120hz" { FPS "120" }
    "90hz" { FPS "90" }
    "steam" {
      Start-Process C:\"Program Files (x86)"\Steam\steam.exe
      C:\nircmd.exe win close title "Steam Big Picture Mode"
    }
    "tv_mode" {
      DisplaySwitch 4
      Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_on.bat
      Run "120hz"
      Resolution4k 1
    }
    "monitor_mode" {
      DisplaySwitch 1
      Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_off.bat
      Run "60hz"
      Resolution4k 0
    }
    "steam_deck_mode" {
      Run "monitor_mode"
      Run "90hz"
      Resolution800p
    }
    "turn_pc_off" {
      shutdown /s /t 0
    }
    "toggle_capframe" {
      # Requires CapFrameX to run
      Start-Process C:\Users\ivank\Documents\Scripts\f1.exe
    }
    "steam_big_picture" {
      Start-Process C:\"Program Files (x86)"\Steam\steam.exe
      Start-Process "steam://open/bigpicture"
    }
    "playnite" {
      Start-Process C:\Users\ivank\AppData\Local\Playnite\Playnite.toDesktopApp.exe
    }
    "playnite_fs" {
      Start-Process -FilePath "C:\Users\ivank\AppData\Local\Playnite\Playnite.DesktopApp.exe" -ArgumentList "--startfullscreen"
    }
  }
  
  Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false -ErrorAction SilentlyContinue
}

Run $Action


