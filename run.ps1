$Action = $args[0]

Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false

switch ($Action) {
  "60hz" { C:\rtss-cli.exe limit:set 60 }
  "steam" {
    Start-Process C:\"Program Files (x86)"\Steam\steam.exe
    C:\nircmd.exe win close title "Steam Big Picture Mode"
  }
  "remove" {
    Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false
  }
}

