$Action = $args[0]

switch ($Action) {
  "60hz" { C:\rtss-cli.exe limit:set 60 }
  "steam" {
    Start-Process C:\"Program Files (x86)"\Steam\steam.exe
    C:\nircmd.exe win close title "Steam Big Picture Mode"
  }
}

Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false
