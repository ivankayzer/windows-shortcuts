$actions = $args[0].Split(",")

Function Run {
  param($action)

  Function FPS {
    param($fps)
    C:\rtss-cli.exe limit:set $fps
  }

  Function Resolution4k {
    C:\ChangeScreenResolution.exe /w=3840 /h=2160
  }

  Function Resolution800p {
    C:\ChangeScreenResolution.exe /w=1920 /h=1200
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
	  Resolution4k
      DisplaySwitch 4
      Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_on.bat
      Run "120hz"
    }
    "monitor_mode" {
      Resolution4k
      DisplaySwitch 1
      Start-Process C:\Users\ivank\Documents\Scripts\toggle_hdr_off.bat
      Run "60hz"
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
      Start-Process -FilePath "C:\Users\ivank\AppData\Local\Playnite\Playnite.DesktopApp.exe"
    }
    "playnite_fs" {
      Start-Process -FilePath "C:\Users\ivank\AppData\Local\Playnite\Playnite.DesktopApp.exe" -ArgumentList "--startfullscreen"
    }
  }
  
  Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false -ErrorAction SilentlyContinue
}

foreach ($action in $actions) {
  Run $action
}



