param(
$taskName,
$WaitSeconds
)

Function Create-Task
{
$A = New-ScheduledTaskAction -Execute 'C:\mytask.ps1'

$T = New-ScheduledTaskTrigger -At(Get-Date) -Once -RepetitionInterval (New-TimeSpan -Minutes 1 )

$Task = Register-ScheduledTask -Action $A -Trigger $T -TaskName $taskName

}

Function Change-Status
{

$task = Get-ScheduledTask -TaskName $taskName

if($task.State -eq "Running" -or $task.State -eq "Ready" )
    {
    start-sleep -s $WaitSeconds
    Stop-ScheduledTask -TaskName $taskName
    $task | Disable-ScheduledTask
    }

}

function Get-AllTasks
{
    start-sleep -s 10
   
    Clear-Host

    Get-ScheduledTask | Where-Object{$_.State -eq "Ready"}
}

Create-Task



Change-Status



Get-AllTasks | ForEach-Object {Write-Host $_.TaskName}



