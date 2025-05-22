Function Export-ScheduledTasks {
    $outputPath = "C:\Windows\System32\scheduledtasks.csv"
    Write-Host "`n[+] Scanning all scheduled tasks..." -ForegroundColor Cyan

    $allTasks = Get-ScheduledTask

    $taskList = foreach ($task in $allTasks) {

        $normalizedPath = if ($task.TaskPath -notmatch '\\$') { $task.TaskPath + "\" } else { $task.TaskPath }

        $actionPaths = ($task.Actions | ForEach-Object { $_.Execute }) -join ", "

        [PSCustomObject]@{
            "Task Name"      = $task.TaskName
            "Path"           = $task.TaskPath
            "Author"         = $task.Principal.UserId
            "Run Level"      = $task.Principal.RunLevel
            "Action Command" = $actionPaths
            "Task State"     = $task.State
        }
    }

    $taskList | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8
    Write-Host "`n[✓] Exported scheduled tasks to:`n$outputPath" -ForegroundColor Green
}

Export-ScheduledTasks


Write-Host "`nPress Enter to exit..." -ForegroundColor Yellow
Read-Host
