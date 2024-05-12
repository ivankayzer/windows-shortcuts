Register-ScheduledTask -TaskName "Shortcut Action" -InputObject (
  (
    New-ScheduledTask -Action (
             (New-ScheduledTaskAction -Execute cmd -Argument "powershell -Command `"Start-Process -Verb RunAs powershell '-ExecutionPolicy Bypass -Command cd \\\`"C:\Users\ivank\Documents\Scripts\v2\\\`"; & \\\`".\run.ps1 remove\\\`"' `"")
    ) -Trigger (
      New-ScheduledTaskTrigger -Once -At 3am
    ) -Principal New-ScheduledTaskPrincipal -RunLevel Highest -UserID $env:USERNAME
  )
)

