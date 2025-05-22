## Script Description

This PowerShell script retrieves all scheduled tasks on the local machine and exports key details about each task to a CSV file for easy review and auditing. The exported information includes the task name, task path, author (user who created the task), run level, action commands, and current task state.

Features:

Scans all scheduled tasks regardless of their location in the Task Scheduler hierarchy.

Normalizes task paths for consistent output.

Extracts and concatenates multiple action commands if a task has more than one action.

Exports the results in a UTF-8 encoded CSV file suitable for Excel or other spreadsheet applications.

Provides colored console output messages to inform the user about the scanning and exporting progress.

Includes a prompt at the end to keep the console window open until the user chooses to exit.

Usage:
Run the script in an elevated PowerShell session (Run as Administrator) to ensure full access to all scheduled tasks.
