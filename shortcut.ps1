$Action = $args[0]

Register-ScheduledTask -TaskName "Shortcut Action" -InputObject (
  (
    New-ScheduledTask -Action (
             (New-ScheduledTaskAction -Execute "$PsHome\powershell.exe" -Argument "-Command `"Start-Process -Verb RunAs powershell '-ExecutionPolicy Bypass -Command cd \\\`"$(Split-Path -Path $MyInvocation.MyCommand.Path -Parent)\\\`"; & \\\`".\run.ps1\\\`" $Action' `"")
    ) -Trigger (
      New-ScheduledTaskTrigger -Once -At 3am
    ) -Principal ( New-ScheduledTaskPrincipal -UserId "$Env:ComputerName\$Env:UserName" -LogonType ServiceAccount -RunLevel Highest )
  )
)

Start-ScheduledTask "Shortcut Action"