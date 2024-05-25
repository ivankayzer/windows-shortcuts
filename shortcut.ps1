$Action = $args[0]

Unregister-ScheduledTask -TaskName "Shortcut Action" -Confirm:$false -ErrorAction SilentlyContinue

Register-ScheduledTask -TaskName "Shortcut Action" -InputObject (
  (
    New-ScheduledTask -Action (
             (New-ScheduledTaskAction -Execute "C:\run-hidden.exe" -Argument "powershell -File $(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)\run.ps1 $Action")
    ) -Trigger (
      New-ScheduledTaskTrigger -Once -At 3am
    ) -Principal ( New-ScheduledTaskPrincipal -UserId "$Env:ComputerName\$Env:UserName" -LogonType ServiceAccount -RunLevel Highest )
  )
)

Start-ScheduledTask "Shortcut Action"